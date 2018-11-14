{-
******************************************************************************
*                                  H M T C                                   *
*                                                                            *
*       Module:         Env                                                  *
*       Purpose:        Environment (symbol table) with operations           *
*       Authors:        Henrik Nilsson                                       *
*                                                                            *
*                 Copyright (c) Henrik Nilsson, 2006 - 2013                  *
*                                                                            *
******************************************************************************
-}

-- | Environment with operations. The module provides an abstract datatype
-- for representing environments (symbol tables), along with operations
-- for creating and extending environments and looking up symbols.
-- There are three kinds of symbols: term-level symbols, which are internal
-- or external, denoting entities like variables, constants, and procedures,
-- and type-level symbols, denoting types.

-- Note: "mkTopLvlEnv" and "enterInTermSym" are the responsible for creating
-- symbols. Creating symbols only in the context of an environment allows
-- scope level assignment to be handled automatically.

module Env (
    -- Environments
    Env,                -- Abstract.
    mkTopLvlEnv,        -- :: [(Name,Type)] -> [(Name,Type,ExtSymVal)] -> Env
    openMajScope,       -- :: Env -> Env
    openMinScope,       -- :: Env -> Env
    enterIntTermSym,    -- :: Name -> Type -> SrcPos -> Env
                        --    -> Either IntTermSym (Env, IntTermSym)
    lookupTypeSym,      -- :: Name -> Env -> Maybe TypeSym
    lookupTermSym,      -- :: Name -> Env -> Maybe TermSym
    dummyTmS            -- :: Name -> TermSym
) where


-- HMTC module imports
import Diagnostics (internalError)
import Name
import SrcPos
import ScopeLevel
import Type
import Symbol


-- | Environment (symbol table). Abstract.

-- An environment is represented by the current scope level,
-- a list of type-level symbols, and a list of term-level symbols.

data Env = Env ScopeLvl [TypeSym] [ExtTermSym] [IntTermSym]


-- | Creates an initial, top-level, environment of external symbols.
-- Arguments:
--
-- (1) List of name and type pairs for the type-level part of the
-- top-level environment; i.e. a /definition/ for each symbol.
-- 
-- (2) List of name and type pairs for the term-level part of the
-- top-levelenvironment; i.e., a /declaration/ for each symbol.
--
-- Returns: A top-level environment.

mkTopLvlEnv :: [(Name,Type)] -> [(Name,Type,ExtSymVal)] -> Env
mkTopLvlEnv tpnts tmnts = Env topScopeLvl tpss etmss []
    where
        tpss = [ TypeSym {tpsName = n, tpsType = t, tpsSrcPos = NoSrcPos}
                 | (n,t) <- tpnts
               ]
        etmss = [ ExtTermSym {
                      etmsName = n, 
                      etmsType = t,
                      etmsVal  = v
                  }
                | (n, t, v) <- tmnts
                ]


-- | Opens a new major (e.g. procedure/function) scope level.
openMajScope :: Env -> Env
openMajScope (Env sl tpss etmss itmss) =
    Env (incMajScopeLvl sl) tpss etmss itmss


-- | Opens a new minor (e.g. let) scope level.
openMinScope :: Env -> Env
openMinScope (Env sl tpss etmss itmss) =
    Env (incMinScopeLvl sl) tpss etmss itmss


-- | Enters an internal term-level symbol into an environment.
-- Enforces that symbols are uniquely defined at each scope level.
-- Arguments:
--
-- (1) Name of symbol to be entered.
--
-- (2) Type of symbol to be entered.
--
-- (3) Source position of the declaration or definition of symbol to be
--     entered.
-- 
-- (4) The environment to extend.
--
-- On success (Right), returns:
--
-- (1) Extended environment.
-- 
-- (2) Copy of the new symbol.
--
-- On failure (Left), returns:
--
-- (1) The internal symbol with which there was a clash.

enterIntTermSym :: Name -> Type -> SrcPos -> Env
                   -> Either IntTermSym (Env, IntTermSym)
enterIntTermSym n t sp (Env l tpss etmss itmss) =
    case redeclaredAux itmss of
        Just old -> Left old
        Nothing  -> Right (Env l tpss etmss (itms:itmss), itms)
    where
        itms = IntTermSym {
                   itmsLvl    = l,
                   itmsName   = n,
                   itmsType   = t,
                   itmsSrcPos = sp
               }

        redeclaredAux [] = Nothing
        redeclaredAux (old@IntTermSym {itmsLvl = l', itmsName = n'} : itmss)
            | l' < l    = Nothing
            | n' == n   = Just old
            | otherwise = redeclaredAux itmss


-- | Looks up a type-level symbol.
--  Arguments:
--
-- (1) Name of symbol to lookup.
-- 
-- (2) The environment in which to lookup the symbol.
-- 
-- On success, returns:
--
-- The symbol.

lookupTypeSym :: Name -> Env -> Maybe TypeSym
lookupTypeSym n (Env _ tpss _ _) = ltpsAux tpss
    where
        ltpsAux []                              = Nothing
        ltpsAux (tps : tpss) | tpsName tps == n = Just tps
                             | otherwise        = ltpsAux tpss


-- | Looks up a term-level symbol.
-- Later declarations (higher scope levels) shadow earlier ones.
-- Arguments:
--
-- (1) Name of symbol to lookup.
-- 
-- (2) The environment in which to lookup the symbol.
-- 
-- On success, returns:
--
-- The symbol.

lookupTermSym :: Name -> Env -> Maybe TermSym
lookupTermSym n (Env _ _ etmss itmss) = litms itmss
    where
        litms []                                  = letms etmss
        litms (itms : itmss) | itmsName itms == n = Just (Right itms)
                             | otherwise          = litms itmss

        letms []                                  = Nothing
        letms (etms : etmss) | etmsName etms == n = Just (Left etms)
                             | otherwise          = letms etmss


-- | Constructs a "dummy" (internal) term-level symbol to be used as a
-- placeholder for example where a lookup has failed but a term-level symbol
-- is needed.
--
-- (1) Name of the symbol.
--
-- Returns:
--
-- The dummy symbol.

dummyTmS :: Name -> TermSym
dummyTmS n = Right $
    IntTermSym {
        itmsLvl    = topScopeLvl,
        itmsName   = n,
        itmsType   = SomeType,
        itmsSrcPos = NoSrcPos
    }


envErr :: String -> String -> a
envErr = internalError "Env"
