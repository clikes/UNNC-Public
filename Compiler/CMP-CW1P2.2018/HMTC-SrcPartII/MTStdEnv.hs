
{-
******************************************************************************
*                                  H M T C                                   *
*                                                                            *
*       Module:         MTStdEnv                                             *
*       Purpose:        MiniTriangle Initial Environment                     *
*       Authors:        Henrik Nilsson                                       *
*                                                                            *
*                 Copyright (c) Henrik Nilsson, 2006 - 2013                  *
*                                                                            *
******************************************************************************
-}

-- | MiniTriangle initial environment

module MTStdEnv (
    Env,        -- Re-exported
    mtStdEnv    -- :: Env
) where


-- HMTC module imports
import Name
import TAMCode (MTInt)
import Type
import Symbol (ExtSymVal (..))
import Env


-- | The MiniTriangle initial environment.
--
-- [Types:] Boolean, Integer
--
-- [Constants:]
--
--   * false, true : Boolean
--
--   * minint, maxint : Integer
--
-- [Functions (binary and unary operators):]
--
--   * (+), (-), (*), (\/), (\^) : (Integer, Integer) -> Integer
--
--   * (neg) : Integer -> Integer
--
--   * (\<), (\<=), (==), (!=), (>=), (>) : (Integer, Integer) -> Boolean
--
--   * (&&), (||) : (Boolean, Boolean) -> Boolean
--
--   * (!) : Boolean -> Boolean
--
-- [Procedures:]
--
--   * getint : (Snk Integer) -> Void
--
--   * putint : Integer -> Void
--
--   * skip : () -> Void
--
-- Note that lables have to agree with the code in "LibMT".

mtStdEnv :: Env
mtStdEnv =
    mkTopLvlEnv
        [("Boolean", Boolean),
         ("Integer", Integer),
         ("Character", Character)]
        [("false",   Boolean, ESVBool False),
         ("true",    Boolean, ESVBool True),
         ("minint",  Integer, ESVInt (minBound :: MTInt)),
         ("maxint",  Integer, ESVInt (maxBound :: MTInt)),
         ("+",       Arr [Integer, Integer] Integer, ESVLbl "add"),
         ("-",       Arr [Integer, Integer] Integer, ESVLbl "sub"),
         ("*",       Arr [Integer, Integer] Integer, ESVLbl "mul"),
         ("/",       Arr [Integer, Integer] Integer, ESVLbl "div"),
         ("^",       Arr [Integer, Integer] Integer, ESVLbl "pow"),
         ("neg",     Arr [Integer] Integer,          ESVLbl "neg"),
         ("<",       Arr [Integer, Integer] Boolean, ESVLbl "lt"),
         ("<=",      Arr [Integer, Integer] Boolean, ESVLbl "le"),
         ("==",      Arr [Integer, Integer] Boolean, ESVLbl "eq"),
         ("!=",      Arr [Integer, Integer] Boolean, ESVLbl "ne"),
         (">=",      Arr [Integer, Integer] Boolean, ESVLbl "ge"),
         (">",       Arr [Integer, Integer] Boolean, ESVLbl "gt"),
         ("&&",      Arr [Boolean, Boolean] Boolean, ESVLbl "and"),
         ("||",      Arr [Boolean, Boolean] Boolean, ESVLbl "or"),
         ("!",       Arr [Boolean] Boolean,          ESVLbl "not"),
         ("getint",  Arr [Snk Integer] Void,         ESVLbl "getint"), 
         ("putint",  Arr [Integer] Void,             ESVLbl "putint"),
         ("getchr",  Arr [Snk Character] Void,       ESVLbl "getchr"), 
         ("putchr",  Arr [Character] Void,           ESVLbl "putchr"),
         ("skip",    Arr [] Void,                    ESVLbl "skip")]
