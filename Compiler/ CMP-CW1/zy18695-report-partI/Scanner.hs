{-
******************************************************************************
*                                  H M T C                                   *
*                                                                            *
*       Module:         Scanner                                              *
*       Purpose:        MiniTriangle lexical analyser                        *
*       Authors:        Henrik Nilsson                                       *
*                                                                            *
*                 Copyright (c) Henrik Nilsson, 2006 - 2014                  *
*                                                                            *
******************************************************************************
-}

-- | MiniTriangle lexical analyser

-- The parser uses the function "scanner". Both the scanner and parser
-- monadic, making use of the parse monad P. They work in a tightly
-- interleaved fashion, with the parser passing control to the scanner
-- when it needs a new token, and the scanner passing control back to
-- the parser when a token has successfully been read from the input.
-- See the Happy documentation on monadic parsers for further details.
--
-- The function "scan" allows the scanner to be used in isolation, separately
-- from the parser. At present only used for diagnostics.

module Scanner (
    scanner,            -- ((Token, SrcPos) -> P a) -> P a
    scan,               -- String -> D [(Token, SrcPos)]
    testScanner         -- String -> IO ()
) where

-- Standard library imports
import Data.Char (isDigit, isAlpha, isAlphaNum)

-- HMTC module imports
import SrcPos
import Token
import Diagnostics
import ParseMonad


-- Operator characters. 
-- The present scanner allows multi-character operators. This means that
-- strings of operator characters will be scanned as a signle token as opposed
-- to a sequence of tokens. Operators characters are all non-alphanumerical
-- ASCII characters except the parentheses ('(', ')', '[', ']', '{', '}'),
-- double, single, and back quote quote ('"', '\''', '`'), and underscore
-- ('_').
isOpChr :: Char -> Bool
isOpChr '!'  = True
isOpChr '#'  = True
isOpChr '$'  = True
isOpChr '%'  = True
isOpChr '&'  = True
isOpChr '*'  = True
isOpChr '+'  = True
isOpChr '-'  = True
isOpChr '.'  = True
isOpChr '/'  = True
isOpChr ':'  = True
isOpChr '<'  = True
isOpChr '='  = True
isOpChr '>'  = True
isOpChr '?'  = True
isOpChr '@'  = True
isOpChr '\\' = True
isOpChr '^'  = True
isOpChr '|'  = True
isOpChr '~'  = True
isOpChr _    = False

isColn :: Char -> Bool
isColn '\''   = False
isColn _      = True

-- Tab stop separation
tabWidth :: Int
tabWidth = 8


nextTabStop :: Int -> Int
nextTabStop n = n + (tabWidth - (n-1) `mod` tabWidth)


-- | MiniTriangle scanner. 

scanner :: ((Token, SrcPos) -> P a) -> P a
scanner cont = P $ scan
    where
        -- scan :: Int -> Int -> String -> D a
        -- End Of File
        scan l c []         = retTkn EOF l c c []
        -- Skip white space and comments, including handling various
        -- line ending conventions (NL, CR+NL, NL+CR) gracefully.
        scan l c ('\n' : s) = scan (l + 1) 1 s
        scan l c ('\r' : s) = scan l 1 s
        scan l c ('\t' : s) = scan l (nextTabStop c) s
        scan l c (' ' : s)  = scan l (c + 1) s
        scan l c ('/' : '/' : s) = scan l c (dropWhile (/='\n') s)
        -- Scan graphical tokens
        scan l c ('(' : s)  = retTkn LPar l c (c + 1) s
        scan l c (')' : s)  = retTkn RPar l c (c + 1) s
        scan l c (',' : s)  = retTkn Comma l c (c + 1) s
        scan l c (';' : s)  = retTkn Semicol l c (c + 1) s
        scan l c ('?' : s)  = retTkn QueMark l c (c + 1) s
        -- Scan numeric literals, operators, identifiers, and keywords
        scan l c (x : s) | isDigit x = scanLitInt l c x s
                         | isAlpha x = scanIdOrKwd l c x s
                         | isOpChr x = scanOperator l c x s
                         --when scanner read a ' means it can run into a lit char scan mode.
                         | x == '\'' = scanLitChar l c s
                         | otherwise = do
                                           emitErrD (SrcPos l c)
                                                    ("Lexical error: Illegal \
                                                     \character "
                                                     ++ show x
                                                     ++ " (discarded)")
                                           scan l (c + 1) s

        -- scanLitChar :: Int -> Int -> String -> D a
        -- scanLitChar l c (x : b : xs)    | b == '\''                     = retTkn (LitChar x) l (c+1) (c + 2) xs
        --                                 | otherwise                     = do
        --                                                                        emitErrD (SrcPos l (c+1))
        --                                                                                 ("Lexicalerror: Illegal \
        --                                                                                  \character define\n"
        --                                                                                  ++ show x 
        --                                                                                  ++"\n"
        --                                                                                  ++ show b)
        --                                                                        scan l (c + 1) xs'
        --                                 where 
        --                                     (tail, xs') = span (=='\'') xs
        --when scanner read a ' means it can run into a lit char scan mode.
        scanLitChar l c (x : b : xs)    | x == '\\'                     = scanEscChar l (c+1) (b:xs)
                                        | b == '\'' && x /= '\''        = retTkn (LitChar x) l (c+1) (c + 2) xs
                                        | otherwise                     = do
                                                                               emitErrD (SrcPos l (c+1))
                                                                                        ("Lexicalerror: Illegal \
                                                                                         \character define\n"
                                                                                         ++ show x 
                                                                                         ++"\n"
                                                                                         ++ show b)
                                                                               scan l (c + 1) xs'
                                        where 
                                            (tail, xs') = span (=='\'') xs
        --if the character is accept escape character then cast it to the esc character by function toEscChar 
        --scanEscChar :: Int -> Int -> String -> D a
        scanEscChar l c (x : b :xs)     | elem x ['n','r', 't', '\\', '\''] && b == '\''    = retTkn (LitChar (toEscChar x)) l (c+1) (c + 2) xs
                                        | otherwise                     = do
                                                                               emitErrD (SrcPos l (c+1))
                                                                                        ("Lexicalerror: Illegal \
                                                                                         \character define\n"
                                                                                         ++ show x 
                                                                                         ++"\n"
                                                                                         ++ "\'")
                                                                               scan l (c + 1) xs'
                                        where 
                                            (tail, xs') = span (=='\'') xs
            
        -- scanLitInt :: Int -> Int -> Char -> String -> D a
        scanLitInt l c x s = retTkn (LitInt (read (x : tail))) l c c' s'
            where
                (tail, s') = span isDigit s
                c'         = c + 1 + length tail

        -- Allows multi-character operators.
        -- scanOperator :: Int -> Int -> Char -> String -> D a
        scanOperator l c x s = retTkn (mkOpOrSpecial (x:tail)) l c c' s'
            where
                (tail, s') = span isOpChr s
                c'         = c + 1 + length tail

        mkOpOrSpecial :: String -> Token
        mkOpOrSpecial ":"  = Colon
        mkOpOrSpecial ":=" = ColEq
        mkOpOrSpecial "="  = Equals
        mkOpOrSpecial name = Op {opName = name}

        -- scanIdOrKwd :: Int -> Int -> Char -> String -> D a
        scanIdOrKwd l c x s = retTkn (mkIdOrKwd (x : tail)) l c c' s'
            where
                (tail, s') = span isAlphaNum s
                c'         = c + 1 + length tail

        mkIdOrKwd :: String -> Token
        mkIdOrKwd "begin" = Begin
        mkIdOrKwd "const" = Const
        mkIdOrKwd "do"    = Do
        mkIdOrKwd "else"  = Else
        mkIdOrKwd "end"   = End
        mkIdOrKwd "if"    = If
        mkIdOrKwd "in"    = In
        mkIdOrKwd "let"   = Let
        mkIdOrKwd "then"  = Then
        mkIdOrKwd "var"   = Var
        mkIdOrKwd "while" = While
        mkIdOrKwd "repeat" = Repeat
        mkIdOrKwd "until" = Until
        mkIdOrKwd "elseif" = ElseIf
        mkIdOrKwd name    = Id {idName = name}

        -- Return token, position of token, updated position, and remaning
        -- input. We assume tnat no MiniTriangle token span multiple
        -- lines. Hence only one line number argument is needed.
        -- retTkn :: Token -> Int -> Int -> Int -> String -> D a
        retTkn t l c c' = unP (cont (t, SrcPos {spLine = l, spCol = c})) l c'


-- | Scans the input and returns the resulting tokens paired with position.

scan :: String -> D [(Token, SrcPos)]
scan s = runP (scanner (acceptToken [])) s

--return the esc char by the escape character with out \ in front of it 
toEscChar :: Char -> Char
toEscChar x     | x == 'n' = '\n'
                | x == 'r' = '\r'
                | x == 't' = '\t'
                | x == '\\'= '\\'
                | x == '\''= '\''

-- | Test utility. Scans the input and, if successful, prints the resulting
-- tokens.

testScanner :: String -> IO ()
testScanner s = do
    putStrLn "Diagnostics:"
    mapM_ (putStrLn . ppDMsg) (snd result)
    putStrLn ""
    case fst result of
        Just tss -> do
                        putStrLn "Tokens:"
                        mapM_ (putStrLn . show) tss
        Nothing -> putStrLn "Scanning produced no result."
    putStrLn ""
    where
        result :: (Maybe [(Token,SrcPos)], [DMsg])
        result = runD (runP (scanner (acceptToken [])) s)

acceptToken :: [(Token,SrcPos)] -> (Token,SrcPos) -> P [(Token,SrcPos)]
acceptToken tss (ts@(t,_)) =
    let tss' = ts : tss
    in
        case t of
            EOF -> return (reverse tss')
            _   -> scanner (acceptToken tss')
