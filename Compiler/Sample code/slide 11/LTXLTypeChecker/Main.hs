-- ***************************************************************************
-- *									     *
-- *		     Less Trivial eXpression Language (LTXL)		     *
-- *									     *
-- *	Module:		Main						     *
-- *	Purpose:	Main module: driver for the type checker	     *
-- *			Adapted to work with Diagnostics from HMTC	     *
-- *	Author:		Henrik Nilsson					     *
-- *									     *
-- *           Example for G53CMP, lectures 10, November 2017		     *
-- *									     *
-- ***************************************************************************
module Main where

import System.Environment (getArgs)

import Type
import Diagnostics (DMsg, ppDMsg, runD)
import AbstractSyntax
import Parser (parse)
import Environment
import GlobalEnvironment
import TypeChecker


-- Parses, prints and runs the type checker on test programs and reports
-- resulting type or encountered errors.

tcProg :: String -> IO ()
tcProg prog = do
    let exp = parse prog
    putStrLn "Program to be type checked:"
    putStrLn ""
    putStrLn (ppExp exp)
    putStrLn ""
    case typeCheck exp of
        (Just t, []) ->
            do
                putStr "Type of the program: "
                putStrLn (ppType t)
        (_, dmsgs) ->
            do
                putStrLn "There were errors:"
                mapM_ (putStrLn . ppDMsg) dmsgs


-- Reads program from file and then parses, prints and runs the type checker
-- on it and reports resulting type or encountered errors.

tcFile :: String -> IO ()
tcFile fileName = do
    prog <- readFile (fileName)
    tcProg prog


-- Test environments

Left env1 = enterVar "x" 1 TpInt glblEnv

Left env2 = enterVar "y" 1 TpBool env1

Left env3 = enterVar "x" 2 TpBool env2


-- Type check program fragments in given environment (for testing)

tcFrag :: Env -> String -> IO ()
tcFrag env frag = do
    let exp = parse frag
    putStrLn "Fragment to be type checked:"
    putStrLn ""
    putStrLn (ppExp exp)
    putStrLn ""
    case runD (tcAux 0 env exp) of
        (Just t, []) ->
            do
                putStr "Type of the fragment: "
                putStrLn (ppType t)
        (_, dmsgs) ->
            do
                putStrLn "There were errors:"
                mapM_ (putStrLn . ppDMsg) dmsgs


------------------------------------------------------------------------------
-- Main
------------------------------------------------------------------------------

-- Usage:
--     tcltxl file.ltxl	Parse "file.ltxl", type check it, and write result
--                      to standard output.
--     tcltxl		Read input from standard input, type check it,
--                      and write result to standard output.
--			(Could be confusing!)

main = do
    args <- getArgs
    prog <- if null args
             then getContents
             else readFile (head args)
    tcProg prog
