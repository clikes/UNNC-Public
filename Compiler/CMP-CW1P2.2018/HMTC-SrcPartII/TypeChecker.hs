{-
******************************************************************************
*                                  H M T C                                   *
*                                                                            *
*       Module:         TypeChcker                                           *
*       Purpose:        MiniTriangle Type Checker                            *
*       Authors:        Henrik Nilsson                                       *
*                                                                            *
*                 Copyright (c) Henrik Nilsson, 2006 - 2014                  *
*                                                                            *
******************************************************************************
-}

-- | MiniTriangle Type Checker. 

-- Substantially re-written autumn 2013

module TypeChecker (
    typeCheck,          -- :: A.AST -> D MTIR
    testTypeChecker     -- :: String -> [(Name,Type)] -> IO ()
) where


-- Standard library imports
import Data.List ((\\), nub, sort, intersperse)
import Data.Maybe (fromJust)
import Control.Monad (zipWithM, unless)
import Control.Monad.Fix (mfix)

-- HMTC module imports
import SrcPos
import Diagnostics
import Name
import ScopeLevel
import Type
import Symbol
import Env
import MTStdEnv
import qualified AST as A
import MTIR
import PPMTIR
import Parser (parse)

-- | Type checks a complete MiniTriangle program in the standard environment 
-- and reports any errors. Hence a computation in the diagnostics monad 'D'.
-- Additionally, translates the program into the type-annotated, intermediate
-- representation MTIR, including eliminating implicit dereferencing at the
-- source level by inserting explicit dereferencing operations.

-- See the Coursework Description Part II for an explanation of the concepts
-- and principles behind this type checker, along with the typing rules that
-- define the MiniTriangle type system which this type checker implements.
-- In particular, comments like "T-IF", "env(x) = s" and "env |- e : t"
-- refers to those typing rules, with the following naming conventions:
--
--      Type set typing rule                    ASCII Comments
--      --------------------                    --------------
--      Capital gamma                           "env"
--      turnstile                               "|-"
--      vector notation (e.g. "e" overlined)    plural "s" suffix, e.g. "es"

typeCheck :: A.AST -> D MTIR
typeCheck (A.AST {A.astCmd = c}) = do
    c' <- chkCmd mtStdEnv c
    return (MTIR {mtirCmd = c'}) 


------------------------------------------------------------------------------
-- Implementation of main typing rules
------------------------------------------------------------------------------

-- Check that command is well-formed in the given environment:
--
--     env |- c

chkCmd :: Env -> A.Command -> D Command
-- T-ASSIGN
chkCmd env (A.CmdAssign {A.caVar = x, A.caVal = e, A.cmdSrcPos = sp}) = do
    (s, x') <- infTpExp env x                   -- env |- x : s
    (t, x'')<- sinks_nonreftype s x'            -- sinks(s,t), not reftype(t)
    e'      <- chkTpExp env e t                 -- env |- e : t
    return (CmdAssign {caVar = x'', caVal = e', cmdSrcPos = sp})
-- T-CALL
chkCmd env (A.CmdCall {A.ccProc = p, A.ccArgs = es, A.cmdSrcPos = sp}) = do
    (ts, t, p') <- infArrTpExp env p (length es)        -- env |- p : ts->Void
    require (t == Void) sp (notProcMsg t)
    es'         <- mapM (\(e, t) -> chkTpExp env e t)   -- env |- es : ts
                        (zip es ts)
    return (CmdCall {ccProc = p', ccArgs = es', cmdSrcPos = sp})
    where
        notProcMsg t = "Not a procedure; return type is " ++ show t
-- T-SEQ (generalized to sequence of any length)
chkCmd env (A.CmdSeq {A.csCmds = cs, A.cmdSrcPos = sp}) = do
    cs' <- mapM (chkCmd env) cs                         -- env |- cs
    return (CmdSeq {csCmds = cs', cmdSrcPos = sp})
-- T-IF
chkCmd env (A.CmdIf {A.ciCondThens = ecs, A.ciMbElse = mc2,
                     A.cmdSrcPos=sp}) = do
-- YOUR CODE HERE: This has just been patched to work for the original
-- if-then-else. The entire list ecs needs to be processed properly,
-- and the fact that the else-branch is optional taken care of.
    let (e, c1) = head ecs      -- Not wrong, but unnecessary
    let c2      = fromJust mc2  -- Wrong: the else-branch might not be there.
    e'  <- chkTpExp env e Boolean                       -- env |- e : Boolean
    c1' <- chkCmd env c1                                -- env |- c1
    c2' <- chkCmd env c2                                -- env |- c2
    return (CmdIf {ciCond = e', ciThen = c1', ciElse = c2', cmdSrcPos = sp})
-- T-WHILE
chkCmd env (A.CmdWhile {A.cwCond = e, A.cwBody = c, A.cmdSrcPos = sp}) = do
    e' <- chkTpExp env e Boolean                        -- env |- e : Boolean
    c' <- chkCmd env c                                  -- env |- c
    return (CmdWhile {cwCond = e', cwBody = c', cmdSrcPos = sp})
-- T-LET
chkCmd env (A.CmdLet {A.clDecls = ds, A.clBody = c, A.cmdSrcPos = sp}) = do
    (ds', env') <- mfix $ \ ~(_, env') ->               -- env;env'|- ds | env'
                       chkDeclarations (openMinScope env) env' ds 
    c'          <- chkCmd env' c                        -- env' |- c
    return (CmdLet {clDecls = ds', clBody = c', cmdSrcPos = sp})


-- Check that declarations/definitions are well-typed in given environment
-- and environmant for function/procedure bodies and compute extended
-- environment:
--
--     env; envB |- ds | env'
--
-- [For future reference: If user defined types were allowed, envB should
-- perhaps be used in place of env for elaboarting types and computing
-- function/procedure types if it is desired to allow (mutually) recursive
-- type definitions.]

chkDeclarations :: Env -> Env -> [A.Declaration] -> D ([Declaration], Env)
-- T-DECLEMPTY
chkDeclarations env envB [] = return ([], env)
-- T-DECLCONST
chkDeclarations env envB 
                (A.DeclConst {A.dcConst = x, A.dcVal = e, A.dcType = t,
                              A.declSrcPos=sp}
                 : ds) = do
    t' <- chkDclType env t
    e' <- chkTpExp env e t'                         -- env |- e : t
    case enterIntTermSym x (Src t') sp env of       -- env' = env, x : Src t
        Left old -> do
            emitErrD sp (redeclaredMsg old)
            chkDeclarations env envB ds
        Right (env', x') -> do                      
            wellinit (itmsLvl x') e'
            (ds', env'') <- chkDeclarations env'    -- env'; envB |- ds | env''
                                            envB
                                            ds
            return (DeclConst {dcConst = x', dcVal = e'} : ds', env'')
-- T-DECLVAR
chkDeclarations env envB 
                (A.DeclVar {A.dvVar = x, A.dvType = t, A.dvMbVal = Nothing,
                            A.declSrcPos=sp}
                 : ds) = do
    t' <- chkDclType env t
    case enterIntTermSym x (Ref t') sp env of       -- env' = env, x : Ref t
        Left old -> do
            emitErrD sp (redeclaredMsg old)
            chkDeclarations env envB ds
        Right (env', x') -> do                      
            (ds', env'') <- chkDeclarations env'    -- env'; envB |- ds | env''
                                            envB
                                            ds
            return (DeclVar {dvVar = x', dvMbVal = Nothing} : ds', env'')
-- T-DECLINITVAR
chkDeclarations env envB
                (A.DeclVar {A.dvVar = x, A.dvType = t, A.dvMbVal = Just e,
                            A.declSrcPos=sp}
                 : ds) = do
    t' <- chkDclType env t
    e' <- chkTpExp env e t'                         -- env |- e : t
    case enterIntTermSym x (Ref t') sp env of       -- env' = env, x : Ref t
        Left old -> do
            emitErrD sp (redeclaredMsg old)
            chkDeclarations env envB ds
        Right (env', x') -> do
            wellinit (itmsLvl x') e'
            (ds', env'') <- chkDeclarations env'    -- env'; envB |- ds | env''
                                            envB
                                            ds
            return (DeclVar {dvVar = x', dvMbVal = Just e'} : ds', env'')
-- T-DECLFUN
chkDeclarations env envB
                (A.DeclFun {A.dfFun = f, A.dfArgDecls = as, A.dfType = t,
                            A.dfBody = e, A.declSrcPos=sp}
                 : ds) = do
    ~(as', envB') <- chkArgDecls (openMajScope envB) as -- envB |- as | envB'
    tf            <- funType env as t
    e'            <- chkTpExp envB' e (retType tf)      -- envB' |- e : t
    case enterIntTermSym f tf sp env of                 -- env' = env, f: tf
        Left old -> do
            emitErrD sp (redeclaredMsg old)
            chkDeclarations env envB ds
        Right (env', f') -> do                      
            (ds', env'') <- chkDeclarations env'    -- env'; envB |- ds | env''
                                            envB
                                            ds
            return (DeclFun {dfFun = f', dfArgs = as', dfBody = e'} : ds',
                    env'')
-- T-DECLPROC
chkDeclarations env envB
                (A.DeclProc {A.dpProc = p, A.dpArgDecls = as,
                             A.dpBody = c, A.declSrcPos=sp}
                 : ds) = do
    ~(as', envB') <- chkArgDecls (openMajScope envB) as -- envB |- as | envB'
    c'            <- chkCmd envB' c                 -- envB' |- c
    tp            <- procType env as
    case enterIntTermSym p tp sp env of             -- env' = env, f: tf
        Left old -> do
            emitErrD sp (redeclaredMsg old)
            chkDeclarations env envB ds
        Right (env', p') -> do                      
            (ds', env'') <- chkDeclarations env'    -- env'; envB |- ds | env''
                                            envB
                                            ds
            return (DeclProc {dpProc = p', dpArgs = as', dpBody = c'} : ds',
                    env'')


-- Check that function/procedure argument declarations are well-typed in
-- given environment and compute extended environment:
--
--     env |- as | env'

chkArgDecls :: Env -> [A.ArgDecl] -> D ([IntTermSym], Env)
-- T-DECLARGEMPTY
chkArgDecls env [] = return ([], env)
-- T-DECLARG, T-DECLINARG, T-DECLOUTARG, T-DECLVARARG
chkArgDecls env  
            (A.ArgDecl {A.adArg = x, A.adArgMode = am, A.adType = td,
             A.adSrcPos=sp}
            : as) = do
    t <- chkDclType env td
    case enterIntTermSym x (Src (amType am t)) sp env of -- env' = env, x: ...
        Left old -> do
            emitErrD sp (redeclaredMsg old)
            chkArgDecls env as
        Right (env', x') -> do                          
            (as', env'') <- chkArgDecls env' as         -- env' |- as | env''
            return (x' : as', env'')


redeclaredMsg :: IntTermSym -> String
redeclaredMsg itms =
    "Identifier \""
    ++ itmsName itms
    ++ "\" redeclared; already declared at "
    ++ show (itmsSrcPos itms)


procType :: Env -> [A.ArgDecl] -> D Type
procType env as = do
    ts <- argTypes env as
    return (Arr ts Void)


funType :: Env -> [A.ArgDecl] -> A.TypeDenoter -> D Type
funType env as td = do
    ts <- argTypes env as
    t  <- chkDclType env td
    return (Arr ts t)


argTypes :: Env -> [A.ArgDecl] -> D [Type]
argTypes env []                                           = return []
argTypes env (A.ArgDecl {A.adArgMode = am, A.adType = td} : as) = do
    t  <- chkDclType env td
    ts <- argTypes env as
    return (amType am t : ts)


-- Checks that a given type is defined and translate into internal type
-- representation.
chkDclType :: Env -> A.TypeDenoter -> D Type
chkDclType env (A.TDBaseType {A.tdbtName = t, A.tdSrcPos = sp}) =
    case lookupTypeSym t env of
        Nothing -> do
            emitErrD sp ("Undefined type \"" ++ t ++ "\"")
            return SomeType
        Just tps ->
            return (tpsType tps)
chkDclType env (A.TDArray {A.tdaEltType = t, A.tdaSize = s,
                A.tdSrcPos = sp}) = do
    t' <- chkDclType env t
    s' <- toMTInt s sp
    return (Ary t' s')
chkDclType env (A.TDRecord {A.tdrFldTypes = fts}) = do
    -- Note: Ensures record fields are sorted (invariant of Rcd)
    let (xs,ts) = unzip fts
    ts' <- mapM (chkDclType env) ts
    return (Rcd (sortRcdFlds (zip xs ts')))


-- Type representation corresponding to given argument mode

amType :: A.ArgMode -> (Type -> Type)
amType A.ByValue  = id          -- Call-by-value
amType A.ByRefIn  = Src         -- Call-by-ref input
amType A.ByRefOut = Snk         -- Call-by-ref output
amType A.ByRefVar = Ref         -- Call-by-ref variable


-- Check that expression has type t in given environment:
--
--     env |- e : t
--
-- This is an algorithmic version of the typing relation for expressions
-- to be used when the desired type is known. Knowing the target type
-- makes it easy to use the rule T-SOURCES.

chkTpExp :: Env -> A.Expression -> Type -> D Expression
-- T-SOURCES
chkTpExp env e t = do
    (s, e') <- infTpExp env e                   -- env |- e : s, sources(s,t)
    sources s t e'


-- Check that expression is well-typed in the given environment and
-- infer its type assuming no (top-level) implicit dereferencing:
--
--     env |- e : t
--
-- This is an algorithmic version of the typing relation for expressions
-- to be used when the desired type is not known and leaving the option
-- for further dereferencing open.

infTpExp :: Env -> A.Expression -> D (Type, Expression)
-- T-LITINT
infTpExp env e@(A.ExpLitInt {A.eliVal = n, A.expSrcPos = sp}) = do
    n' <- toMTInt n sp
    return (Integer,                            -- env |- n : Integer
            ExpLitInt {eliVal = n', expType = Integer, expSrcPos = sp})
-- T-VAR
infTpExp env (A.ExpVar {A.evVar = x, A.expSrcPos = sp}) = do
    tms <- lookupName env x sp          -- env(x) = t, sources(t,t)
    case tms of
        Left etms ->
            return (etmsType etms, mtirETmSRepr etms)
        Right itms ->
            return (itmsType itms,
                    ExpVar {
                        evVar     = itms,
                        expType   = itmsType itms,
                        expSrcPos = sp
                    })
    where
        mtirETmSRepr (ExtTermSym {etmsVal = v, etmsType = t}) =
           case v of
               ESVBool b ->
                   ExpLitBool {elbVal = b, expType = t, expSrcPos = sp}
               ESVInt n ->
                   ExpLitInt {eliVal = n, expType = t, expSrcPos = sp}
               ESVChar c ->
                   ExpLitChr {elcVal = c, expType = t, expSrcPos = sp}
               ESVLbl l ->
                   ExpExtRef {eerVal = l, expType = t, expSrcPos = sp}
-- T-APP
infTpExp env (A.ExpApp {A.eaFun = f, A.eaArgs = es, A.expSrcPos = sp}) = do
    (ts, t, f') <- infArrTpExp env f (length es)        -- env |- f : ts -> t
    es'         <- mapM (\(e, t) -> chkTpExp env e t)   -- env |- es : ts
                        (zip es ts)
    return (t, ExpApp {eaFun = f', eaArgs = es', expType = t, expSrcPos = sp})
-- T-ARY, empty case handled specially
infTpExp env (A.ExpAry {A.eaElts = [], A.expSrcPos = sp}) = do
    let t = Ary SomeType 0
    return (t, ExpAry {eaElts = [], expType = t, expSrcPos = sp})
infTpExp env (A.ExpAry {A.eaElts = ees@(e:es), A.expSrcPos = sp}) = do
    (t, e') <- infNonRefTpExp env e             -- env |- e : t, not reftype(t)
    es'     <- mapM (\e -> chkTpExp env e t) es -- env |- es : t
    let ta = Ary t (fromIntegral (length ees))
    return (ta, ExpAry {eaElts = e':es', expType = ta, expSrcPos = sp})
-- T-IX
infTpExp env (A.ExpIx {A.eiAry = a, A.eiIx = i, A.expSrcPos = sp}) = do
    (rat, a') <- infRefAryTpExp env a           -- env |- a : R(T[n])
    i'        <- chkTpExp env i Integer         -- end |- i : Integer
    let rt = mapRfcdType eltType rat
    return (rt, ExpIx {eiAry = a', eiIx = i', expType = rt, expSrcPos = sp})
-- T-RCD
infTpExp env (A.ExpRcd {A.erFldDefs = fds, A.expSrcPos = sp}) = do
    -- Note: Ensures record fields are sorted (invariant of ExpRcd and Rcd)
    let (xs, es) = unzip (sortRcdFlds fds)
    tes' <- mapM (infNonRefTpExp env) es        -- env |- es : ts
    require (allDistinct xs) sp (repeatedMsg xs)
    let (ts, es') = unzip tes'
    let fds'      = zip xs es'
    let tr        = Rcd (zip xs ts)
    return (tr, ExpRcd {erFldDefs = fds', expType = tr, expSrcPos = sp})
    where
        allDistinct xs = xs == nub xs
        repeatedMsg xs = "Repeated record field name(s): \""
                         ++ concat (intersperse "\", \"" (nub (xs \\ nub xs)))
                         ++ "\"" 
-- T-PRJ
infTpExp env (A.ExpPrj {A.epRcd = e, A.epFld = f, A.expSrcPos = sp}) = do
    (rrt, e') <- infRefRcdTpExp env e           -- env |- e : R({xs:ts})
    require (fldExists f (rfcdType rrt)) sp (notAFieldMsg f (rfcdType rrt))
    let rt = mapRfcdType (fldType f) rrt
    return (rt, ExpPrj {epRcd = e', epFld = f, expType = rt, expSrcPos = sp})
    where
        notAFieldMsg f rt = "The type \"" ++ show rt
                            ++ "\" does not contain any field \"" ++ f ++ "\"" 


-- Check that expression is well-typed in the given environment and
-- infer its type assuming it should be an non-reference type:
--
--     env |- e : t, not reftype(t)
--
-- This is an algorithmic version of the typing relation for expressions
-- to be used when the desired type is known to be a non-reference type.

infNonRefTpExp :: Env -> A.Expression -> D (Type, Expression)
infNonRefTpExp env e = do
    (t, e') <- infTpExp env e
    sources_pred (not . refType) "non-reference type" t e' 


-- Check that expression is well-typed in the given environment and
-- infer its type assuming it should be an arrow type:
--
--     env |- e : ts -> t
--
-- This is an algorithmic version of the typing relation for expressions
-- to be used when the desired type is known to be an arrow type.

infArrTpExp :: Env -> A.Expression -> Int -> D ([Type], Type, Expression)
infArrTpExp env e n = do
    (s, e')   <- infNonRefTpExp env e
    case s of
        Arr ts t -> do
            require (length ts == n) (srcPos e)
                    ("Bad arity: expected " ++ show (length ts)
                     ++ " arguments, got " ++ show n)
            return (ensureArity n ts, t, e')
        SomeType -> do
            return (ensureArity n [], SomeType, e')
        _ -> do
            emitErrD (srcPos e) "Not a function or procedure"
            return (ensureArity n [], SomeType, e')
    where
        ensureArity n ts = take n (ts ++ repeat SomeType)


-- Check that expression is well-typed in the given environment and
-- infer its type assuming it should be a reference to an array:
--
--     env |- e : R (t[n]), R in {Src, Snk, Ref}
--
-- This is an algorithmic version of the typing relation for expressions
-- to be used when the desired type is known to be a reference to an array.

infRefAryTpExp :: Env -> A.Expression -> D (Type, Expression)
infRefAryTpExp env e = do
    (t, e') <- infTpExp env e
    sources_pred refAry "reference to array" t e' 
    where
        refAry (Src (Ary _ _)) = True
        refAry (Snk (Ary _ _)) = True
        refAry (Ref (Ary _ _)) = True
        refAry _               = False


-- Check that expression is well-typed in the given environment and
-- infer its type assuming it should be a reference to a record:
--
--     env |- e : R ({a : t, ...}), R in {Src, Snk, Ref}
--
-- This is an algorithmic version of the typing relation for expressions
-- to be used when the desired type is known to be a reference to a record.

infRefRcdTpExp :: Env -> A.Expression -> D (Type, Expression)
infRefRcdTpExp env e = do
    (t, e') <- infTpExp env e
    sources_pred refRcd "reference to record" t e' 
    where
        refRcd (Src (Rcd _)) = True
        refRcd (Snk (Rcd _)) = True
        refRcd (Ref (Rcd _)) = True
        refRcd _             = False


-- Convert Integer to MTInt (MiniTriangle integer), ensuring it is
-- representable as such.

toMTInt :: Integer -> SrcPos -> D MTInt
toMTInt n sp =
   if isMTInt n then
       return (fromInteger n)
   else do
       emitErrD sp ("Integer literal " ++ show n ++ " outside the range of "
                     ++ "representable MiniTriangle integers")
       return 0


-- Convert Char to MTChr (MiniTriangle character), ensuring it is
-- representable as such.

toMTChr :: Char -> SrcPos -> D MTChr
toMTChr c sp =
   if isMTChr c then
       return c         -- MTChr is currently just a type synonym
   else do
       emitErrD sp ("Character literal " ++ show c ++ " outside the range of "
                     ++ "representable MiniTriangle characters")
       return '?'


-- Looks up a name in the environment and returns its type along
-- with its term-level symbol representation. (Beside plain variables,
-- names can be bound to constants, procedures, functions, ...)
-- Reports an error if not found.

lookupName :: Env -> Name -> SrcPos -> D TermSym
lookupName env x sp = do
    case lookupTermSym x env of
        Nothing -> do
            emitErrD sp ("Variable \"" ++ x ++ "\" undefined")
            return (dummyTmS x)
        Just tms -> return tms


------------------------------------------------------------------------------
-- Implementation of auxiliary predicates
------------------------------------------------------------------------------


-- Check if the value of an expression of the given type can source a value
-- of the other given type. This is a version of the predicate "sources"
-- from the type system specification turned into a function assuming both
-- types are known.
-- Additionally "coerces" the type of the expression by embedding it in
-- the appropriate number of dereferencing operations.

sources :: Type -> Type -> Expression -> D Expression
sources s       t       e | s <: t = return e
sources (Ref s) t       e          = sources s t (deref e)
sources (Src s) t       e          = sources s t (deref e)
sources s       t       e          = do
    emitErrD (srcPos e)
             ("Expected type \"" ++ show t ++ "\", got \"" ++ show s ++ "\"")
    return e


{-
-- Alternative definition without explicit use of subtyping for reference. 
-- Somewhat less flexible and a bit more verbose, but adequate for
-- MiniTriangle as it stands, and avoiding subtyping is a simplification.
sources :: Type -> Type -> Expression -> D Expression
sources s       t       e | s == t = return e
sources (Ref s) (Snk t) e | s == t = return e
sources (Ref s) (Src t) e | s == t = return e
sources (Ref s) t       e          = sources s t (deref e)
sources (Src s) t       e          = sources s t (deref e)
sources s       t       e          = do
    emitErrD (srcPos e)
             ("Expected type \"" ++ show t ++ "\", got \"" ++ show s ++ "\"")
    return e
-}


-- Check if the value of an expression of the given type can source a type
-- satisfying an additinal predicate p. That is, an implementation of the
-- combination:
--
--     sources(s,t), p(t)
--
-- assuming type "s" is given and "t" is to be computed.
-- Additionally "coerces" the type of the expression by embedding it in
-- the appropriate number of dereferencing operations.

sources_pred :: (Type -> Bool) -> String -> Type -> Expression
                -> D (Type, Expression)
sources_pred p et t       e | p t = return (t, e)
sources_pred p et (Ref t) e       = sources_pred p et t (deref e)
sources_pred p et (Src t) e       = sources_pred p et t (deref e)
sources_pred p et t       e       = do
    emitErrD (srcPos e) 
             ("Expected " ++ et ++ ", got \"" ++ show t ++ "\"")
    return (SomeType, e)


-- Check if the value of an expression of the given type can sink a non-
-- reference type. That is, an implementation of the combination:
--
--     sinks(s,t), not reftype(t)
--
-- assuming type "s" is given and "t" is to be computed.
-- Additionally "coerces" the type of the expression by embedding it in
-- the appropriate number of dereferencing operations.

sinks_nonreftype :: Type -> Expression -> D (Type, Expression)
sinks_nonreftype (Snk t) e
    | not (refType t) = return (t, e)
    | otherwise       = do
        emitErrD (srcPos e)
                 "Cannot assign value of non-reference type to this variable"
        return (SomeType, e)
sinks_nonreftype (Src t) e = 
    sinks_nonreftype t (deref e)
sinks_nonreftype (Ref t) e
    | not (refType t) = return (t, e)
    | otherwise       = sinks_nonreftype t (deref e)
sinks_nonreftype SomeType e =
    return (SomeType, e)
sinks_nonreftype _ e = do
    emitErrD (srcPos e) "Does not denote an assignable variable"
    return (SomeType, e)


-- Embeds an expression in a dereferencing operation.

deref :: Expression -> Expression
deref e =
    ExpDeref {
        edArg     = e,
        expType   = rfcdType (expType e),
        expSrcPos = srcPos e
    }


-- Check that an initialiser (expression defining a constant or initialising
-- a variable) is well-initialised; i.e. does not call a function defined
-- at the present scope level as this means it could refer to constants
-- or variables that have not yet been initialised or even allocated.
-- This is defined on MTIR rather than AST, simplifying the definition
-- as the scope level of a variable is directly available, meaning that
-- there is no need to look up variables in the environment.
--
-- [For future reference:
-- Note that this restriction could be relaxed. For example, one could
-- for each function compute the set of constants/variables from the
-- same block to which it refers directly or indirectly, and then
-- flag a problem only if a function referring to constants/variables
-- currently not in scope are called. But, as functions may be mutually
-- recursive, this requires computing strongly connected components or
-- an iterative fixed-point computation.
--
-- Or one could implement initialization in dependency order, combined
-- with a static check that there are no cycles. Or one could reorder
-- declaration lists, moving procedures and functions to the end,
-- either after type checking and then possibly combined with adapted
-- code generation strategies, or before type checking, combined with
-- changed scope rules (bringing all functions and procedures into scope
-- at the start of a block) and possibly with adapted code generation
-- strategies.]

wellinit :: ScopeLvl -> Expression -> D ()
wellinit _ (ExpLitBool {})        = return ()
wellinit _ (ExpLitInt {})         = return ()
wellinit _ (ExpLitChr {})         = return ()
wellinit _ (ExpExtRef {})         = return ()
wellinit _ (ExpVar {})            = return ()
wellinit l (ExpDeref {edArg = e}) = wellinit l e
wellinit l (ExpApp {eaFun = f, eaArgs = es}) = do
    case f of
        ExpLitBool {} -> return ()      -- Type error, will have been caught
        ExpLitInt {}  -> return ()      -- Type error, will have been caught
        ExpLitChr {}  -> return ()      -- Type error, will have been caught
        ExpExtRef {}  -> return ()      -- Defined outside present scope
        ExpVar {evVar = IntTermSym {itmsLvl = l', itmsName = n},
                expSrcPos = sp}
            | l' == l ->
                emitErrD sp
                         ("Function \""
                          ++ n 
                          ++ "\" may not be called from initializers in the \
                             \same block as in which it is defined.")
            | otherwise -> return ()
        e ->
            emitErrD (srcPos e)
                     "Only known functions may be called in initializers."
    mapM_ (wellinit l) es
wellinit l (ExpAry {eaElts = es}) = mapM_ (wellinit l) es
wellinit l (ExpIx {eiAry = a, eiIx = i}) = wellinit l a >> wellinit l i
wellinit l (ExpRcd {erFldDefs = fds}) = mapM_ (wellinit l . snd) fds
wellinit l (ExpPrj {epRcd = e}) = wellinit l e


------------------------------------------------------------------------------
-- Error reporting utilities
------------------------------------------------------------------------------

-- Report an error unless the condition is true.

require :: Bool -> SrcPos -> String -> D ()
require p sp m = unless p (emitErrD sp m)


------------------------------------------------------------------------------
-- Test utilities
------------------------------------------------------------------------------

-- | Test utility. Attempts to parse and then type check the given string
-- input in the standard MT environment extended with any given bindings.
-- If successful, pretty-prints the resulting MTIR representation.

testTypeChecker :: String -> [(Name,Type)] -> IO ()
testTypeChecker s bs = do
    putStrLn "Diagnostics:"
    mapM_ (putStrLn . ppDMsg) (snd result)
    putStrLn ""
    case fst result of
        Just mtir -> do
                         putStrLn "MTIR:"
                         putStrLn (ppMTIR mtir)
        Nothing -> putStrLn "Parsing and typechecking produced no result."
    putStrLn ""
    where
        result :: (Maybe MTIR, [DMsg])
        result = runDF (parseCheck s (extend mtStdEnv bs))

        extend env [] = env
        extend env ((n,t):bs) =
            case enterIntTermSym n t NoSrcPos env of
                Left _ -> error "Extending MT Standard Environment failed!"
                Right (env', _) -> extend env' bs

        parseCheck s env = do
            ast <- parse s
            failIfErrorsD
            c <- dToDF (chkCmd env (A.astCmd ast))
            return (MTIR {mtirCmd = c})


------------------------------------------------------------------------------
-- Internal error reporting
------------------------------------------------------------------------------

tcErr :: String -> String -> a
tcErr = internalError "TypeChecker"
