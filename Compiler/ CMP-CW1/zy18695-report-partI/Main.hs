{-
******************************************************************************
*                                  H M T C                                   *
*                                                                            *
*       Module:         Main                                                 *
*       Purpose:        Main MiniTriangle compiler driver for Part I         *
*       Authors:        Henrik Nilsson                                       *
*                                                                            *
*                 Copyright (c) Henrik Nilsson, 2006 - 2014                  *
*                                                                            *
******************************************************************************
-}

-- | Main MiniTriangle compiler driver.

module Main (main) where

-- Standard library imports
import Data.Maybe (isJust, fromJust)
import Control.Monad (when)
import System.Environment (getArgs)

-- HMTC module imports
import SrcPos (SrcPos(..))
import Diagnostics
import Token (Token)
import AST (AST)
import PPAST
import Scanner
import Parser


version :: String
version = "Haskell Mini Triangle Compiler (HMTC) version 1.10 (Part I)"


------------------------------------------------------------------------------
-- Options
------------------------------------------------------------------------------

data Options =
    Options {
        optHelp       :: Bool,
        optSAScanning :: Bool,
        optPAScanning :: Bool,
        optSAParsing  :: Bool,
        optPAParsing  :: Bool,
        optSAChecking :: Bool,
        optPAChecking :: Bool,
        optVersion    :: Bool
    }
    deriving Show


defaultOptions :: Options
defaultOptions =
    Options {
        optHelp       = False,
        optSAScanning = False,
        optPAScanning = False,
        optSAParsing  = False,
        optPAParsing  = False,
        optSAChecking = False,
        optPAChecking = False,
        optVersion    = False
    }


------------------------------------------------------------------------------
-- Main
------------------------------------------------------------------------------

-- | Usage (command line):
--
--      [hmtc \[options\] file.mt]      Compile \"file.mt\"
--
--      [hmtc \[options\]]              Read program to compile from standard
--                                      input. (Could be confusing!)
--
-- Options:
--
--      [--help]                        Print help message and stop.
--
--      [--stop-after-scanning]         Stop after scanning.
--                                      Implies \"--print-after-scanning\".
--
--      [--print-after-scanning]        Print intermediate representation after
--                                      scanning.
--
--      [--stop-after-parsing]          Stop after parsing.
--                                      Implies \"--print-after-parsing\".
--
--      [--print-after-parsing]         Print intermediate representation after
--                                      parsing.
--
--      [--stop-after-checking]         Stop after type checking.
--                                      Implies \"--print-after-checking\".
--
--      [--print-after-checking]        Print intermediate representation after
--                                      type checking.
--
--      [--version]                     Print HMTC version and stop.

main :: IO ()
main = do
    (opts, mfn) <- parseCmdLine
    if optHelp opts then
        printHelp
     else if optVersion opts then
        putStrLn version
     else do
        prog <- case mfn of
                    Nothing -> getContents
                    Just fn -> readFile fn
        let (mc, msgs) = runD (compile opts prog)
        mapM_ (putStrLn . ppDMsg) msgs
        when (isJust mc) (putStrLn ("\nCode:\n" ++ show (fromJust mc)))


------------------------------------------------------------------------------
-- Parse the command line
------------------------------------------------------------------------------

parseCmdLine :: IO (Options, Maybe String)
parseCmdLine = do
    args <- getArgs
    let (mof, msgs) = runD (processOptions defaultOptions args)
    mapM_ (putStrLn . ppDMsg) msgs
    case mof of
        Just (opts, as) -> return (opts,
                                   if null as then
                                       Nothing
                                   else
                                       (Just (head as)))
        Nothing -> ioError (userError "Aborted.")


processOptions :: Options -> [String] -> D (Options, [String])
processOptions opts as = do
    oas <- posAux opts as
    failIfErrorsD
    return oas
    where
        posAux :: Options -> [String] -> D (Options, [String])
        posAux opts [] = return (opts, [])
        posAux opts aas@(a:as)
            | take 2 a /= "--" = return (opts, aas)
            | otherwise        = do
                opts' <- poAux opts (drop 2 a)
                posAux opts' as

        poAux :: Options -> String -> D Options
        poAux opts o
            | o == "help" =
                return (opts {optHelp = True})
            | o == "stop-after-scanning" =
                return (opts {optSAScanning = True, optPAScanning = True})
            | o == "print-after-scanning" =
                return (opts {optPAScanning = True})
            | o == "stop-after-parsing" =
                return (opts {optSAParsing = True, optPAParsing = True})
            | o == "print-after-parsing" =
                return (opts {optPAParsing = True})
            | o == "stop-after-checking" =
                return (opts {optSAChecking = True, optPAChecking = True})
            | o == "print-after-checking" =
                return (opts {optPAChecking = True})
            | o == "version" =
                return (opts {optVersion = True})
            | otherwise = do
                emitErrD NoSrcPos ("Unknown option \"--" ++ o ++ "\"")
                return opts


------------------------------------------------------------------------------
-- Compiler
------------------------------------------------------------------------------

-- This version of the compiler driver if for Part I of the coursework.
-- It reports any errors from scanning and parsing and then stops, optionally
-- printing the AST.

compile :: Options -> String -> D ()
compile opts src = do
    -- Scanning
    -- The scanner and parser operate in a tightly interleaved fashion. Thus
    -- to see the result of scanning only, we need to invoke the scanner
    -- separately. (The result of scanning is then discarded.)
    when (optPAScanning opts) $ do
        tss <- scan src
        emitInfoD NoSrcPos (ppTSs tss)
        failIfErrorsD
    when (optSAScanning opts) stopD

    -- Parsing
    ast <- parse src
    when (optPAParsing opts) (emitInfoD NoSrcPos (ppAST ast))
    failIfErrorsD
    when (optSAParsing opts) stopD

    -- Type checking here (For Part II)
    -- mtir <- typeCheck ast
    -- when (optPAChecking opts) (emitInfoD NoSrcPos (ppMTIR mtir))
    -- failIfErrorsD
    -- when (optSAChecking opts) stopD

    -- Code generation here (For Part II)

    return ()

    where
        ppTSs :: [(Token, SrcPos)] -> String
        ppTSs tss = (foldr (.)
                           id
                           (map (\ts -> shows ts . showChar '\n') tss)) ""


------------------------------------------------------------------------------
-- Print Help Text
------------------------------------------------------------------------------

helpText = "\
\Usage:\n\
\    hmtc [options] file.mt      Compile \"file.mt\"\n\
\    hmtc [options]              Read input from standard input.\n\
\                                (Could be confusing!)\n\
\Options:\n\
\    --help                      Print help message and stop.\n\
\    --stop-after-scanning       Stop after scanning.\n\
\                                Implies \"--print-after-scanning\".\n\
\    --print-after-scanning      Print intermediate representation after\n\
\                                scanning.\n\
\    --stop-after-parsing        Stop after parsing.\n\
\                                Implies \"--print-after-parsing\".\n\
\    --print-after-parsing       Print intermediate representation after\n\
\                                parsing.\n\
\    --stop-after-checking       Stop after type checking.\n\
\                                Implies \"--print-after-checking\".\n\
\    --print-after-checking      Print intermediate representation after\n\
\                                type checking.\n\
\    --version                   Print HMTC version and stop.\n\
\"

printHelp :: IO ()
printHelp = putStr helpText
