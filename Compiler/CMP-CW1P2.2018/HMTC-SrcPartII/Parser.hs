{-# LINE 1 "happy-output.hs" #-}











































































































































































































{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}

{-# OPTIONS_GHC -XPartialTypeSignatures #-}

-- | MiniTriangle parser

module Parser (
    parse,              -- :: String -> DF AST
    testParser          -- :: String -> IO ()
) where

-- HMTC module imports
import SrcPos
import Diagnostics
import Name
import Token
import AST
import PPAST
import ParseMonad
import Scanner
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

newtype HappyAbsSyn t17 t19 t21 t24 = HappyAbsSyn HappyAny

type HappyAny = Happy_GHC_Exts.Any



happyIn4 :: (AST) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn t17 t19 t21 t24) -> (AST)
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
happyIn5 :: ([Command]) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn t17 t19 t21 t24) -> ([Command])
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
happyIn6 :: (Command) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn t17 t19 t21 t24) -> (Command)
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
happyIn7 :: (Maybe Command) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn t17 t19 t21 t24) -> (Maybe Command)
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
happyIn8 :: ([(Expression, Command)]) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn t17 t19 t21 t24) -> ([(Expression, Command)])
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
happyIn9 :: ([Expression]) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn t17 t19 t21 t24) -> ([Expression])
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
happyIn10 :: ([Expression]) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn t17 t19 t21 t24) -> ([Expression])
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
happyIn11 :: (Expression) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn t17 t19 t21 t24) -> (Expression)
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
happyIn12 :: (Expression) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn t17 t19 t21 t24) -> (Expression)
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
happyIn13 :: (Expression) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn t17 t19 t21 t24) -> (Expression)
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
happyIn14 :: (Expression) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn t17 t19 t21 t24) -> (Expression)
happyOut14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut14 #-}
happyIn15 :: (Expression) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn t17 t19 t21 t24) -> (Expression)
happyOut15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut15 #-}
happyIn16 :: (Expression) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn t17 t19 t21 t24) -> (Expression)
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
happyIn17 :: t17 -> (HappyAbsSyn t17 t19 t21 t24)
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn t17 t19 t21 t24) -> t17
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
happyIn18 :: (Expression) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn t17 t19 t21 t24) -> (Expression)
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
happyIn19 :: t19 -> (HappyAbsSyn t17 t19 t21 t24)
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn t17 t19 t21 t24) -> t19
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
happyIn20 :: (Expression) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn t17 t19 t21 t24) -> (Expression)
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
happyIn21 :: t21 -> (HappyAbsSyn t17 t19 t21 t24)
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn t17 t19 t21 t24) -> t21
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
happyIn22 :: (Expression) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn t17 t19 t21 t24) -> (Expression)
happyOut22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut22 #-}
happyIn23 :: (Expression) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn23 #-}
happyOut23 :: (HappyAbsSyn t17 t19 t21 t24) -> (Expression)
happyOut23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut23 #-}
happyIn24 :: t24 -> (HappyAbsSyn t17 t19 t21 t24)
happyIn24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn24 #-}
happyOut24 :: (HappyAbsSyn t17 t19 t21 t24) -> t24
happyOut24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut24 #-}
happyIn25 :: ([(Name, Expression)]) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn25 #-}
happyOut25 :: (HappyAbsSyn t17 t19 t21 t24) -> ([(Name, Expression)])
happyOut25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut25 #-}
happyIn26 :: ([(Name, Expression)]) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn26 #-}
happyOut26 :: (HappyAbsSyn t17 t19 t21 t24) -> ([(Name, Expression)])
happyOut26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut26 #-}
happyIn27 :: ((Name, Expression)) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn27 #-}
happyOut27 :: (HappyAbsSyn t17 t19 t21 t24) -> ((Name, Expression))
happyOut27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut27 #-}
happyIn28 :: ([Declaration]) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn28 #-}
happyOut28 :: (HappyAbsSyn t17 t19 t21 t24) -> ([Declaration])
happyOut28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut28 #-}
happyIn29 :: (Declaration) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn29 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn29 #-}
happyOut29 :: (HappyAbsSyn t17 t19 t21 t24) -> (Declaration)
happyOut29 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut29 #-}
happyIn30 :: ([ArgDecl]) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn30 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn30 #-}
happyOut30 :: (HappyAbsSyn t17 t19 t21 t24) -> ([ArgDecl])
happyOut30 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut30 #-}
happyIn31 :: ([ArgDecl]) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn31 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn31 #-}
happyOut31 :: (HappyAbsSyn t17 t19 t21 t24) -> ([ArgDecl])
happyOut31 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut31 #-}
happyIn32 :: (ArgDecl) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn32 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn32 #-}
happyOut32 :: (HappyAbsSyn t17 t19 t21 t24) -> (ArgDecl)
happyOut32 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut32 #-}
happyIn33 :: (TypeDenoter) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn33 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn33 #-}
happyOut33 :: (HappyAbsSyn t17 t19 t21 t24) -> (TypeDenoter)
happyOut33 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut33 #-}
happyIn34 :: ([(Name, TypeDenoter)]) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn34 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn34 #-}
happyOut34 :: (HappyAbsSyn t17 t19 t21 t24) -> ([(Name, TypeDenoter)])
happyOut34 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut34 #-}
happyIn35 :: ([(Name, TypeDenoter)]) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn35 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn35 #-}
happyOut35 :: (HappyAbsSyn t17 t19 t21 t24) -> ([(Name, TypeDenoter)])
happyOut35 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut35 #-}
happyIn36 :: ((Name, TypeDenoter)) -> (HappyAbsSyn t17 t19 t21 t24)
happyIn36 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn36 #-}
happyOut36 :: (HappyAbsSyn t17 t19 t21 t24) -> ((Name, TypeDenoter))
happyOut36 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut36 #-}
happyInTok :: ((Token, SrcPos)) -> (HappyAbsSyn t17 t19 t21 t24)
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn t17 t19 t21 t24) -> ((Token, SrcPos))
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x00\x00\x00\x02\x25\x12\x00\x00\x00\x00\x00\x00\x00\x20\x50\x22\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x85\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x25\x12\x00\x00\x00\x00\x00\x00\x15\x00\x00\xc0\x05\x40\x00\x00\x00\x00\x00\x00\x84\x10\x01\x00\x00\x00\x00\x00\x00\x00\x20\x50\x22\x01\x00\x00\x00\x00\x00\x50\x01\x00\x00\x5c\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x90\x00\x00\xfe\x3f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x85\x00\x00\x00\x00\x00\x00\x00\x00\x00\x50\x01\x00\x00\x5c\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x50\x01\x00\x00\x5c\x00\x04\x00\x00\x00\x00\x15\x00\x00\xc0\x05\x40\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x01\x40\xe0\xff\x03\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\xc0\x05\x40\x00\x00\x00\x00\x50\x01\x00\x00\x5c\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x50\x01\x00\x00\x5c\x00\x04\x00\x00\x00\x00\x00\x10\x00\x00\xfe\x3f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x10\x00\x00\xfe\x3f\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x01\x00\xe0\xff\x03\x00\x00\x00\x00\x00\x20\x50\x22\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\xc0\x05\x40\x00\x00\x00\x00\x50\x01\x00\x00\x5c\x00\x04\x00\x00\x00\x00\x15\x00\x00\xc0\x05\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\xc0\x05\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\xc0\x05\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\xc0\x05\x40\x00\x00\x00\x00\x50\x01\x00\x00\x5c\x00\x04\x00\x00\x00\x00\x00\x20\x50\x22\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x08\x11\x00\x00\x00\x00\x00\x00\x00\x00\x02\x25\x12\x00\x00\x00\x00\x00\x00\x15\x00\x00\xc0\x05\x40\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x10\x00\x00\xfe\x3f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\xc0\x05\x40\x00\x00\x00\x00\x00\x00\x02\x25\x12\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\xc0\x05\x40\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\xe0\xff\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x0a\x11\x00\x00\x00\x00\x00\x00\x00\x00\xa0\x10\x01\x00\x00\x00\x00\x00\x00\x01\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x01\x00\xe0\xff\x03\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x38\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfe\x0f\x00\x00\x00\x00\x00\x00\x00\x00\xe0\xff\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x50\x01\x00\x00\x5c\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x50\x01\x00\x00\x5c\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x50\x01\x00\x00\x5c\x00\x04\x00\x00\x00\x00\x04\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\xe0\xff\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x15\x00\x00\xc0\x05\x40\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa0\x10\x01\x00\x00\x00\x00\x00\x00\x00\x02\x25\x12\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\xc0\x05\x40\x00\x00\x00\x00\x00\x00\x01\x40\xe0\xff\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x25\x12\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\xfe\x3f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x50\x22\x01\x00\x00\x00\x00\x00\x00\x00\x01\x00\xe0\xff\x03\x00\x00\x00\x00\x10\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x10\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x01\x00\x00\x10\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\xfe\x3f\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x50\x01\x00\x00\x5c\x00\x04\x00\x00\x00\x00\x00\x10\x00\x00\xfe\x3f\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseAux","program","commands","command","optelse","elsifs","expressions","expressions1","expression","primary_expression","var_expression","opclass_disjunctive","opclass_conjunctive","opclass_relational","relational_op","opclass_additive","additive_op","opclass_multiplicative","multiplicative_op","opclass_exponential","opclass_unary","unary_op","field_defs","field_defs1","field_def","declarations","declaration","arg_decls","arg_decls1","arg_decl","type_denoter","field_types","field_types1","field_type","'('","')'","'['","']'","'{'","'}'","','","'.'","';'","':'","':='","'='","'?'","BEGIN","CONST","DO","ELSE","ELSIF","END","FUN","IF","IN","LET","OUT","PROC","REPEAT","THEN","UNTIL","VAR","WHILE","LITINT","LITCHR","ID","'+'","'-'","'*'","'/'","'^'","'<'","'<='","'=='","'!='","'>='","'>'","'&&'","'||'","'!'","%eof"]
        bit_start = st * 84
        bit_end = (st + 1) * 84
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..83]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\xf5\xff\xf5\xff\x00\x00\x7c\x01\xf5\xff\x01\x00\xd3\x00\xf5\xff\x01\x00\x00\x00\xd5\xff\x76\x00\x00\x00\x5f\x00\x01\x00\x00\x00\x01\x00\x01\x00\xf4\xff\x00\x00\x00\x00\x00\x00\x00\x00\x49\x00\x6e\x00\x22\x00\xc8\x00\xd6\x00\xda\x00\xdb\x00\x8a\x00\xfd\x00\xdd\x00\x01\x00\x01\x00\xf2\x00\x01\x00\xad\x00\x00\x00\x1f\x00\x14\x01\x00\x00\x47\x00\xf5\xff\x00\x00\x01\x00\x01\x00\x01\x00\x00\x00\x01\x00\x00\x00\x01\x00\x00\x00\x01\x00\x01\x00\xf5\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x1d\x01\x3d\x01\x51\x01\x20\x01\xd3\x00\xf5\xff\x01\x00\x27\x01\x00\x00\x3a\x01\x38\x01\x4c\x01\x0f\x00\x00\x00\x01\x00\xf5\xff\x00\x00\x53\x01\x00\x00\x00\x00\x01\x00\x5d\x01\x00\x00\xad\x00\x00\x00\x00\x00\xfc\xff\xf1\xff\xf1\xff\xfc\xff\x6e\x01\x54\x00\x5b\x01\x5b\x01\x1a\x00\x45\x01\x50\x01\x39\x01\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x01\x00\x71\x01\x01\x00\x05\x00\x62\x01\x00\x00\x83\x01\x00\x00\x7f\x01\x73\x01\x74\x01\x75\x01\x8d\x01\x99\x01\x5a\x00\x00\x00\xad\x00\x00\x00\x7d\x01\x01\x00\x93\x01\xfc\xff\x94\x01\x95\x01\x96\x01\xf1\xff\xf5\xff\x9b\x01\x00\x00\x9c\x01\x98\x01\x01\x00\x9e\x00\x00\x00\xf5\xff\xad\x00\x00\x00\xf5\xff\xad\x00\xfc\xff\x84\x01\x00\x00\x00\x00\x00\x00\xfc\xff\xfc\xff\xfc\xff\xa1\x01\xfc\xff\xad\x00\xa2\x01\x00\x00\x5c\x00\xa4\x01\xa4\x01\xa4\x01\x00\x00\xa4\x01\x97\x01\x00\x00\x01\x00\xad\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x0b\x00\x83\x00\x00\x00\x00\x00\x26\x00\x48\x00\x15\x00\x8b\x00\xe6\x00\x00\x00\x00\x00\x7e\x01\x00\x00\x00\x00\x16\x00\x00\x00\xea\x00\x12\x00\x79\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7e\x01\x00\x00\x00\x00\x50\x00\xed\x00\x00\x00\xfb\x00\x7e\x01\x00\x00\x7e\x01\x00\x00\x00\x00\x7e\x01\x51\x00\x00\x00\xfe\x00\x01\x01\x04\x01\x00\x00\x12\x01\x00\x00\x15\x01\x00\x00\x18\x01\x1b\x01\xdf\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x91\x00\xf6\x00\x29\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7e\x01\x00\x00\x82\x00\x4f\x01\x00\x00\x00\x00\x00\x00\x00\x00\x2c\x01\x7c\x00\x00\x00\x7e\x01\x00\x00\x00\x00\x8b\x01\x8c\x00\xa1\x00\x8e\x01\xa6\x01\x7e\x01\x7e\x01\x7e\x01\x7e\x01\x7e\x01\x7e\x01\x7e\x01\x00\x00\xd7\x00\x00\x00\x00\x00\x00\x00\x2f\x01\xa9\x01\x32\x01\x00\x00\xc5\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7e\x01\x00\x00\x00\x00\x40\x01\x00\x00\x92\x01\x00\x00\x00\x00\x00\x00\xa3\x00\x8f\x01\x00\x00\x00\x00\x00\x00\x00\x00\x43\x01\x7e\x01\x00\x00\x90\x01\x7e\x01\x00\x00\x91\x01\x7e\x01\x9a\x01\xae\x00\x00\x00\x00\x00\x00\x00\x9d\x01\x9e\x01\x9f\x01\x00\x00\xa0\x01\x7e\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xaa\x01\x00\x00\x46\x01\x7e\x01\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\xfe\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xdc\xff\x00\x00\x00\x00\xec\xff\xe2\xff\x00\x00\xc9\xff\x00\x00\xf0\xff\xc6\xff\xe4\xff\xe3\xff\xc7\xff\xc8\xff\x00\x00\x00\x00\xc1\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfd\xff\xf0\xff\x00\x00\x00\x00\x00\x00\xfb\xff\xda\xff\x00\x00\x00\x00\xef\xff\xee\xff\x00\x00\xf5\xff\x00\x00\x00\x00\x00\x00\xd7\xff\x00\x00\xd0\xff\x00\x00\xcd\xff\x00\x00\x00\x00\x00\x00\xcf\xff\xce\xff\xcc\xff\xcb\xff\xca\xff\xd6\xff\xd5\xff\xd4\xff\xd3\xff\xd2\xff\xd1\xff\xd8\xff\xd9\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc5\xff\xc4\xff\x00\x00\x00\x00\x00\x00\xe1\xff\xf0\xff\x00\x00\xf8\xff\x00\x00\xdd\xff\xdf\xff\x00\x00\xc6\xff\xde\xff\xf7\xff\xf6\xff\xc0\xff\x00\x00\xba\xff\xba\xff\x00\x00\xf2\xff\x00\x00\xe5\xff\xe6\xff\xe7\xff\xe8\xff\xe9\xff\xea\xff\xfc\xff\xf0\xff\xfa\xff\xdb\xff\xed\xff\x00\x00\xf4\xff\x00\x00\xbe\xff\xaf\xff\xb2\xff\x00\x00\xb9\xff\xb8\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc3\xff\xc2\xff\xe0\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xae\xff\xad\xff\x00\x00\x00\x00\x00\x00\xf9\xff\x00\x00\xeb\xff\xf3\xff\x00\x00\xbd\xff\x00\x00\x00\x00\xb0\xff\xbb\xff\xb7\xff\x00\x00\x00\x00\x00\x00\xb6\xff\x00\x00\xbf\xff\x00\x00\xb1\xff\x00\x00\xb3\xff\xb4\xff\xb5\xff\xac\xff\xab\xff\xf2\xff\xf1\xff\x00\x00\xbc\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x05\x00\x01\x00\x0e\x00\x03\x00\x30\x00\x05\x00\x16\x00\x03\x00\x18\x00\x15\x00\x00\x00\x17\x00\x02\x00\x1d\x00\x1a\x00\x0b\x00\x02\x00\x21\x00\x1e\x00\x09\x00\x21\x00\x21\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x0d\x00\x21\x00\x08\x00\x09\x00\x1f\x00\x20\x00\x21\x00\x04\x00\x23\x00\x13\x00\x14\x00\x01\x00\x02\x00\x13\x00\x14\x00\x09\x00\x0d\x00\x18\x00\x19\x00\x09\x00\x2f\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x24\x00\x25\x00\x26\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x07\x00\x07\x00\x08\x00\x09\x00\x01\x00\x02\x00\x0d\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x09\x00\x13\x00\x14\x00\x03\x00\x0a\x00\x03\x00\x01\x00\x0d\x00\x03\x00\x13\x00\x14\x00\x1c\x00\x0c\x00\x08\x00\x0c\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x0d\x00\x16\x00\x02\x00\x10\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x09\x00\x02\x00\x15\x00\x16\x00\x17\x00\x15\x00\x16\x00\x17\x00\x09\x00\x13\x00\x14\x00\x0d\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x1b\x00\x1a\x00\x1b\x00\x1c\x00\x18\x00\x19\x00\x0d\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x1b\x00\x0d\x00\x1a\x00\x1b\x00\x1c\x00\x1b\x00\x1c\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x1f\x00\x20\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x02\x00\x0f\x00\x1e\x00\x1f\x00\x20\x00\x09\x00\x14\x00\x09\x00\x21\x00\x13\x00\x14\x00\x19\x00\x07\x00\x08\x00\x09\x00\x1d\x00\x07\x00\x08\x00\x09\x00\x07\x00\x08\x00\x09\x00\x21\x00\x02\x00\x13\x00\x14\x00\x21\x00\x21\x00\x13\x00\x14\x00\x09\x00\x13\x00\x14\x00\x07\x00\x08\x00\x09\x00\x07\x00\x08\x00\x09\x00\x07\x00\x08\x00\x09\x00\x07\x00\x08\x00\x09\x00\x13\x00\x14\x00\x13\x00\x13\x00\x14\x00\x21\x00\x13\x00\x14\x00\x02\x00\x13\x00\x14\x00\x07\x00\x08\x00\x09\x00\x07\x00\x08\x00\x09\x00\x07\x00\x08\x00\x09\x00\x07\x00\x08\x00\x09\x00\x13\x00\x14\x00\x0a\x00\x13\x00\x14\x00\x0a\x00\x13\x00\x14\x00\x06\x00\x13\x00\x14\x00\x07\x00\x08\x00\x09\x00\x07\x00\x08\x00\x09\x00\x07\x00\x08\x00\x09\x00\x07\x00\x08\x00\x09\x00\x13\x00\x14\x00\x01\x00\x13\x00\x14\x00\x07\x00\x13\x00\x14\x00\x0c\x00\x13\x00\x14\x00\x07\x00\x08\x00\x09\x00\x07\x00\x08\x00\x09\x00\x07\x00\x08\x00\x09\x00\x04\x00\x02\x00\x01\x00\x13\x00\x14\x00\x02\x00\x13\x00\x14\x00\x09\x00\x13\x00\x14\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x01\x00\x21\x00\x03\x00\x12\x00\x26\x00\x11\x00\x21\x00\x08\x00\x02\x00\x07\x00\x0b\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x02\x00\x02\x00\x02\x00\x21\x00\x21\x00\x21\x00\x0a\x00\x09\x00\x09\x00\x09\x00\x02\x00\x1f\x00\x0a\x00\x0a\x00\x0a\x00\x0a\x00\x06\x00\x0a\x00\x07\x00\x03\x00\x21\x00\x04\x00\x03\x00\x1d\x00\x12\x00\x04\x00\x1d\x00\x03\x00\xff\xff\x04\x00\x1d\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x1d\x00\xff\xff\xff\xff\x1d\x00\x1d\x00\x1d\x00\x1d\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x75\x00\x11\x00\x05\x00\x12\x00\xff\xff\x13\x00\x7a\x00\x83\x00\x7b\x00\x06\x00\x0a\x00\x07\x00\x02\x00\x7c\x00\x08\x00\x90\x00\x58\x00\x7d\x00\x09\x00\x03\x00\x50\x00\x0a\x00\x50\x00\x29\x00\x2a\x00\x0c\x00\x0d\x00\x37\x00\x76\x00\x52\x00\x0d\x00\x14\x00\x15\x00\x0a\x00\x6f\x00\x16\x00\x0e\x00\x0f\x00\x1f\x00\x20\x00\x0e\x00\x0f\x00\x4a\x00\x37\x00\x18\x00\x19\x00\x03\x00\x17\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x3b\x00\x3c\x00\x3d\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x6d\x00\x1e\x00\x0c\x00\x0d\x00\x6b\x00\x20\x00\x37\x00\x28\x00\x29\x00\x2a\x00\x0c\x00\x0d\x00\x03\x00\x0e\x00\x0f\x00\x83\x00\x71\x00\x83\x00\x54\x00\x37\x00\x23\x00\x0e\x00\x0f\x00\x4c\x00\x84\x00\x24\x00\xad\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x37\x00\x4b\x00\x02\x00\x55\x00\x56\x00\x29\x00\x2a\x00\x0c\x00\x0d\x00\x03\x00\x17\x00\x4c\x00\x4d\x00\x4e\x00\x7f\x00\x4d\x00\x4e\x00\x03\x00\x0e\x00\x0f\x00\x37\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x38\x00\x7d\x00\x77\x00\x78\x00\x5e\x00\x19\x00\x37\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x96\x00\x37\x00\x76\x00\x77\x00\x78\x00\x9b\x00\x78\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\xa8\x00\x8d\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x45\x00\x6f\x00\x29\x00\x2a\x00\x0c\x00\x0d\x00\x63\x00\x1b\x00\x8b\x00\x8c\x00\x8d\x00\x2c\x00\x1c\x00\x03\x00\x49\x00\x0e\x00\x0f\x00\x1d\x00\x0b\x00\x0c\x00\x0d\x00\x1e\x00\x51\x00\x0c\x00\x0d\x00\x27\x00\x0c\x00\x0d\x00\x48\x00\x5d\x00\x0e\x00\x0f\x00\x47\x00\x46\x00\x0e\x00\x0f\x00\x03\x00\x0e\x00\x0f\x00\x25\x00\x0c\x00\x0d\x00\x6a\x00\x0c\x00\x0d\x00\x69\x00\x0c\x00\x0d\x00\x68\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x2d\x00\x0e\x00\x0f\x00\x27\x00\x0e\x00\x0f\x00\x6e\x00\x0e\x00\x0f\x00\x67\x00\x0c\x00\x0d\x00\x66\x00\x0c\x00\x0d\x00\x65\x00\x0c\x00\x0d\x00\x64\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x63\x00\x0e\x00\x0f\x00\x60\x00\x0e\x00\x0f\x00\x5c\x00\x0e\x00\x0f\x00\x5c\x00\x0c\x00\x0d\x00\x80\x00\x0c\x00\x0d\x00\x93\x00\x0c\x00\x0d\x00\x90\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x62\x00\x0e\x00\x0f\x00\x5b\x00\x0e\x00\x0f\x00\x5a\x00\x0e\x00\x0f\x00\xa1\x00\x0c\x00\x0d\x00\x96\x00\x0c\x00\x0d\x00\xad\x00\x0c\x00\x0d\x00\x59\x00\x55\x00\x61\x00\x0e\x00\x0f\x00\x82\x00\x0e\x00\x0f\x00\x03\x00\x0e\x00\x0f\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x44\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x3d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x3d\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x22\x00\x50\x00\x23\x00\x73\x00\x3d\x00\x93\x00\x8f\x00\x24\x00\x8b\x00\x8a\x00\x25\x00\x2d\x00\x2e\x00\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x9a\x00\x94\x00\xaa\x00\x89\x00\x88\x00\x87\x00\x86\x00\x03\x00\x03\x00\x03\x00\x85\x00\xa3\x00\xa1\x00\x9f\x00\x9e\x00\x9d\x00\x9a\x00\x98\x00\x99\x00\x83\x00\x8f\x00\xa4\x00\x83\x00\x7e\x00\x73\x00\x71\x00\x73\x00\x91\x00\x00\x00\xab\x00\x9f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa9\x00\x00\x00\x00\x00\xa7\x00\xa6\x00\xa5\x00\xa4\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 84) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71),
	(72 , happyReduce_72),
	(73 , happyReduce_73),
	(74 , happyReduce_74),
	(75 , happyReduce_75),
	(76 , happyReduce_76),
	(77 , happyReduce_77),
	(78 , happyReduce_78),
	(79 , happyReduce_79),
	(80 , happyReduce_80),
	(81 , happyReduce_81),
	(82 , happyReduce_82),
	(83 , happyReduce_83),
	(84 , happyReduce_84)
	]

happy_n_terms = 49 :: Int
happy_n_nonterms = 33 :: Int


happyReduce_1 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_1 = happySpecReduce_1  0# happyReduction_1
happyReduction_1 happy_x_1
	 =  case happyOut6 happy_x_1 of { happy_var_1 -> 
	happyIn4
		 (AST happy_var_1
	)}


happyReduce_2 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_2 = happySpecReduce_1  1# happyReduction_2
happyReduction_2 happy_x_1
	 =  case happyOut6 happy_x_1 of { happy_var_1 -> 
	happyIn5
		 ([happy_var_1]
	)}


happyReduce_3 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_3 = happySpecReduce_3  1# happyReduction_3
happyReduction_3 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut6 happy_x_1 of { happy_var_1 -> 
	case happyOut5 happy_x_3 of { happy_var_3 -> 
	happyIn5
		 (happy_var_1 : happy_var_3
	)}}


happyReduce_4 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_4 = happySpecReduce_3  2# happyReduction_4
happyReduction_4 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut13 happy_x_1 of { happy_var_1 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn6
		 (CmdAssign {caVar = happy_var_1, caVal=happy_var_3, cmdSrcPos = srcPos happy_var_1}
	)}}


happyReduce_5 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_5 = happyReduce 4# 2# happyReduction_5
happyReduction_5 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut13 happy_x_1 of { happy_var_1 -> 
	case happyOut9 happy_x_3 of { happy_var_3 -> 
	happyIn6
		 (CmdCall {ccProc = happy_var_1, ccArgs = happy_var_3, cmdSrcPos = srcPos happy_var_1}
	) `HappyStk` happyRest}}


happyReduce_6 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_6 = happyReduce 6# 2# happyReduction_6
happyReduction_6 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { ((If, happy_var_1)) -> 
	case happyOut11 happy_x_2 of { happy_var_2 -> 
	case happyOut6 happy_x_4 of { happy_var_4 -> 
	case happyOut8 happy_x_5 of { happy_var_5 -> 
	case happyOut7 happy_x_6 of { happy_var_6 -> 
	happyIn6
		 (CmdIf {ciCondThens = (happy_var_2,happy_var_4) : happy_var_5, ciMbElse = happy_var_6, cmdSrcPos = happy_var_1}
	) `HappyStk` happyRest}}}}}


happyReduce_7 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_7 = happyReduce 4# 2# happyReduction_7
happyReduction_7 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { ((While, happy_var_1)) -> 
	case happyOut11 happy_x_2 of { happy_var_2 -> 
	case happyOut6 happy_x_4 of { happy_var_4 -> 
	happyIn6
		 (CmdWhile {cwCond = happy_var_2, cwBody = happy_var_4, cmdSrcPos = happy_var_1}
	) `HappyStk` happyRest}}}


happyReduce_8 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_8 = happyReduce 4# 2# happyReduction_8
happyReduction_8 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { ((Repeat, happy_var_1)) -> 
	case happyOut6 happy_x_2 of { happy_var_2 -> 
	case happyOut11 happy_x_4 of { happy_var_4 -> 
	happyIn6
		 (CmdRepeat {crBody = happy_var_2, crCond = happy_var_4, cmdSrcPos = happy_var_1}
	) `HappyStk` happyRest}}}


happyReduce_9 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_9 = happyReduce 4# 2# happyReduction_9
happyReduction_9 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { ((Let, happy_var_1)) -> 
	case happyOut28 happy_x_2 of { happy_var_2 -> 
	case happyOut6 happy_x_4 of { happy_var_4 -> 
	happyIn6
		 (CmdLet {clDecls = happy_var_2, clBody = happy_var_4, cmdSrcPos = happy_var_1}
	) `HappyStk` happyRest}}}


happyReduce_10 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_10 = happySpecReduce_3  2# happyReduction_10
happyReduction_10 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut5 happy_x_2 of { happy_var_2 -> 
	happyIn6
		 (if length happy_var_2 == 1 then
              head happy_var_2
          else
              CmdSeq {csCmds = happy_var_2, cmdSrcPos = srcPos happy_var_2}
	)}


happyReduce_11 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_11 = happySpecReduce_0  3# happyReduction_11
happyReduction_11  =  happyIn7
		 (Nothing
	)


happyReduce_12 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_12 = happySpecReduce_2  3# happyReduction_12
happyReduction_12 happy_x_2
	happy_x_1
	 =  case happyOut6 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (Just happy_var_2
	)}


happyReduce_13 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_13 = happySpecReduce_0  4# happyReduction_13
happyReduction_13  =  happyIn8
		 ([]
	)


happyReduce_14 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_14 = happyReduce 5# 4# happyReduction_14
happyReduction_14 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut11 happy_x_2 of { happy_var_2 -> 
	case happyOut6 happy_x_4 of { happy_var_4 -> 
	case happyOut8 happy_x_5 of { happy_var_5 -> 
	happyIn8
		 ((happy_var_2,happy_var_4) : happy_var_5
	) `HappyStk` happyRest}}}


happyReduce_15 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_15 = happySpecReduce_0  5# happyReduction_15
happyReduction_15  =  happyIn9
		 ([]
	)


happyReduce_16 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_16 = happySpecReduce_1  5# happyReduction_16
happyReduction_16 happy_x_1
	 =  case happyOut10 happy_x_1 of { happy_var_1 -> 
	happyIn9
		 (happy_var_1
	)}


happyReduce_17 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_17 = happySpecReduce_1  6# happyReduction_17
happyReduction_17 happy_x_1
	 =  case happyOut11 happy_x_1 of { happy_var_1 -> 
	happyIn10
		 ([happy_var_1]
	)}


happyReduce_18 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_18 = happySpecReduce_3  6# happyReduction_18
happyReduction_18 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_1 of { happy_var_1 -> 
	case happyOut9 happy_x_3 of { happy_var_3 -> 
	happyIn10
		 (happy_var_1 : happy_var_3
	)}}


happyReduce_19 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_19 = happySpecReduce_1  7# happyReduction_19
happyReduction_19 happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	happyIn11
		 (happy_var_1
	)}


happyReduce_20 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_20 = happyReduce 5# 7# happyReduction_20
happyReduction_20 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut11 happy_x_1 of { happy_var_1 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	case happyOut11 happy_x_5 of { happy_var_5 -> 
	happyIn11
		 (ExpCond {ecCond    = happy_var_1,
                   ecTrue    = happy_var_3,
                   ecFalse   = happy_var_5,
                   expSrcPos = srcPos happy_var_1}
	) `HappyStk` happyRest}}}


happyReduce_21 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_21 = happySpecReduce_3  7# happyReduction_21
happyReduction_21 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_1 of { happy_var_1 -> 
	case happyOut14 happy_x_2 of { happy_var_2 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn11
		 (ExpApp {eaFun     = happy_var_2,
                  eaArgs    = [happy_var_1,happy_var_3],
                  expSrcPos = srcPos happy_var_1}
	)}}}


happyReduce_22 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_22 = happySpecReduce_3  7# happyReduction_22
happyReduction_22 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_2 of { happy_var_2 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn11
		 (ExpApp {eaFun     = happy_var_2,
                  eaArgs    = [happy_var_1,happy_var_3],
                  expSrcPos = srcPos happy_var_1}
	)}}}


happyReduce_23 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_23 = happySpecReduce_3  7# happyReduction_23
happyReduction_23 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_1 of { happy_var_1 -> 
	case happyOut16 happy_x_2 of { happy_var_2 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn11
		 (ExpApp {eaFun     = happy_var_2,
                  eaArgs    = [happy_var_1,happy_var_3],
                  expSrcPos = srcPos happy_var_1}
	)}}}


happyReduce_24 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_24 = happySpecReduce_3  7# happyReduction_24
happyReduction_24 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_1 of { happy_var_1 -> 
	case happyOut18 happy_x_2 of { happy_var_2 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn11
		 (ExpApp {eaFun     = happy_var_2,
                  eaArgs    = [happy_var_1,happy_var_3],
                  expSrcPos = srcPos happy_var_1}
	)}}}


happyReduce_25 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_25 = happySpecReduce_3  7# happyReduction_25
happyReduction_25 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_1 of { happy_var_1 -> 
	case happyOut20 happy_x_2 of { happy_var_2 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn11
		 (ExpApp {eaFun     = happy_var_2,
                  eaArgs    = [happy_var_1,happy_var_3],
                  expSrcPos = srcPos happy_var_1}
	)}}}


happyReduce_26 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_26 = happySpecReduce_3  7# happyReduction_26
happyReduction_26 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_1 of { happy_var_1 -> 
	case happyOut22 happy_x_2 of { happy_var_2 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn11
		 (ExpApp {eaFun     = happy_var_2,
                  eaArgs    = [happy_var_1,happy_var_3],
                  expSrcPos = srcPos happy_var_1}
	)}}}


happyReduce_27 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_27 = happySpecReduce_1  8# happyReduction_27
happyReduction_27 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn12
		 (ExpLitInt {eliVal = tspLIVal happy_var_1, expSrcPos = tspSrcPos happy_var_1}
	)}


happyReduce_28 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_28 = happySpecReduce_1  8# happyReduction_28
happyReduction_28 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn12
		 (ExpLitChr {elcVal = tspLCVal happy_var_1, expSrcPos = tspSrcPos happy_var_1}
	)}


happyReduce_29 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_29 = happySpecReduce_1  8# happyReduction_29
happyReduction_29 happy_x_1
	 =  case happyOut13 happy_x_1 of { happy_var_1 -> 
	happyIn12
		 (happy_var_1
	)}


happyReduce_30 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_30 = happySpecReduce_2  8# happyReduction_30
happyReduction_30 happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	case happyOut12 happy_x_2 of { happy_var_2 -> 
	happyIn12
		 (ExpApp {eaFun = happy_var_1, eaArgs = [happy_var_2], expSrcPos = srcPos happy_var_1}
	)}}


happyReduce_31 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_31 = happyReduce 4# 8# happyReduction_31
happyReduction_31 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut13 happy_x_1 of { happy_var_1 -> 
	case happyOut9 happy_x_3 of { happy_var_3 -> 
	happyIn12
		 (ExpApp {eaFun = happy_var_1, eaArgs = happy_var_3, expSrcPos = srcPos happy_var_1}
	) `HappyStk` happyRest}}


happyReduce_32 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_32 = happySpecReduce_3  8# happyReduction_32
happyReduction_32 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { ((LBrk, happy_var_1)) -> 
	case happyOut9 happy_x_2 of { happy_var_2 -> 
	happyIn12
		 (ExpAry {eaElts = happy_var_2, expSrcPos = happy_var_1}
	)}}


happyReduce_33 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_33 = happySpecReduce_3  8# happyReduction_33
happyReduction_33 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { ((LBrc, happy_var_1)) -> 
	case happyOut25 happy_x_2 of { happy_var_2 -> 
	happyIn12
		 (ExpRcd {erFldDefs = happy_var_2, expSrcPos = happy_var_1}
	)}}


happyReduce_34 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_34 = happySpecReduce_3  8# happyReduction_34
happyReduction_34 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_2 of { happy_var_2 -> 
	happyIn12
		 (happy_var_2
	)}


happyReduce_35 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_35 = happySpecReduce_1  9# happyReduction_35
happyReduction_35 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn13
		 (ExpVar {evVar = tspIdName happy_var_1, expSrcPos = tspSrcPos happy_var_1}
	)}


happyReduce_36 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_36 = happyReduce 4# 9# happyReduction_36
happyReduction_36 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut13 happy_x_1 of { happy_var_1 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn13
		 (ExpIx {eiAry = happy_var_1, eiIx = happy_var_3, expSrcPos = srcPos happy_var_1}
	) `HappyStk` happyRest}}


happyReduce_37 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_37 = happySpecReduce_3  9# happyReduction_37
happyReduction_37 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut13 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_3 of { happy_var_3 -> 
	happyIn13
		 (ExpPrj {epRcd = happy_var_1, epFld = tspIdName happy_var_3, expSrcPos = srcPos happy_var_1}
	)}}


happyReduce_38 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_38 = happySpecReduce_1  10# happyReduction_38
happyReduction_38 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn14
		 (mkExpVarBinOp happy_var_1
	)}


happyReduce_39 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_39 = happySpecReduce_1  11# happyReduction_39
happyReduction_39 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn15
		 (mkExpVarBinOp happy_var_1
	)}


happyReduce_40 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_40 = happySpecReduce_1  12# happyReduction_40
happyReduction_40 happy_x_1
	 =  case happyOut17 happy_x_1 of { happy_var_1 -> 
	happyIn16
		 (mkExpVarBinOp happy_var_1
	)}


happyReduce_41 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_41 = happySpecReduce_1  13# happyReduction_41
happyReduction_41 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn17
		 (happy_var_1
	)}


happyReduce_42 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_42 = happySpecReduce_1  13# happyReduction_42
happyReduction_42 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn17
		 (happy_var_1
	)}


happyReduce_43 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_43 = happySpecReduce_1  13# happyReduction_43
happyReduction_43 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn17
		 (happy_var_1
	)}


happyReduce_44 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_44 = happySpecReduce_1  13# happyReduction_44
happyReduction_44 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn17
		 (happy_var_1
	)}


happyReduce_45 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_45 = happySpecReduce_1  13# happyReduction_45
happyReduction_45 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn17
		 (happy_var_1
	)}


happyReduce_46 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_46 = happySpecReduce_1  13# happyReduction_46
happyReduction_46 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn17
		 (happy_var_1
	)}


happyReduce_47 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_47 = happySpecReduce_1  14# happyReduction_47
happyReduction_47 happy_x_1
	 =  case happyOut19 happy_x_1 of { happy_var_1 -> 
	happyIn18
		 (mkExpVarBinOp happy_var_1
	)}


happyReduce_48 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_48 = happySpecReduce_1  15# happyReduction_48
happyReduction_48 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn19
		 (happy_var_1
	)}


happyReduce_49 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_49 = happySpecReduce_1  15# happyReduction_49
happyReduction_49 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn19
		 (happy_var_1
	)}


happyReduce_50 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_50 = happySpecReduce_1  16# happyReduction_50
happyReduction_50 happy_x_1
	 =  case happyOut21 happy_x_1 of { happy_var_1 -> 
	happyIn20
		 (mkExpVarBinOp happy_var_1
	)}


happyReduce_51 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_51 = happySpecReduce_1  17# happyReduction_51
happyReduction_51 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn21
		 (happy_var_1
	)}


happyReduce_52 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_52 = happySpecReduce_1  17# happyReduction_52
happyReduction_52 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn21
		 (happy_var_1
	)}


happyReduce_53 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_53 = happySpecReduce_1  18# happyReduction_53
happyReduction_53 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn22
		 (mkExpVarBinOp happy_var_1
	)}


happyReduce_54 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_54 = happySpecReduce_1  19# happyReduction_54
happyReduction_54 happy_x_1
	 =  case happyOut24 happy_x_1 of { happy_var_1 -> 
	happyIn23
		 (mkExpVarUnOp happy_var_1
	)}


happyReduce_55 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_55 = happySpecReduce_1  20# happyReduction_55
happyReduction_55 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn24
		 (happy_var_1
	)}


happyReduce_56 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_56 = happySpecReduce_1  20# happyReduction_56
happyReduction_56 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn24
		 (happy_var_1
	)}


happyReduce_57 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_57 = happySpecReduce_0  21# happyReduction_57
happyReduction_57  =  happyIn25
		 ([]
	)


happyReduce_58 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_58 = happySpecReduce_1  21# happyReduction_58
happyReduction_58 happy_x_1
	 =  case happyOut26 happy_x_1 of { happy_var_1 -> 
	happyIn25
		 (happy_var_1
	)}


happyReduce_59 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_59 = happySpecReduce_1  22# happyReduction_59
happyReduction_59 happy_x_1
	 =  case happyOut27 happy_x_1 of { happy_var_1 -> 
	happyIn26
		 ([happy_var_1]
	)}


happyReduce_60 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_60 = happySpecReduce_3  22# happyReduction_60
happyReduction_60 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut27 happy_x_1 of { happy_var_1 -> 
	case happyOut25 happy_x_3 of { happy_var_3 -> 
	happyIn26
		 (happy_var_1 : happy_var_3
	)}}


happyReduce_61 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_61 = happySpecReduce_3  23# happyReduction_61
happyReduction_61 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn27
		 ((tspIdName happy_var_1, happy_var_3)
	)}}


happyReduce_62 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_62 = happySpecReduce_1  24# happyReduction_62
happyReduction_62 happy_x_1
	 =  case happyOut29 happy_x_1 of { happy_var_1 -> 
	happyIn28
		 ([happy_var_1]
	)}


happyReduce_63 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_63 = happySpecReduce_3  24# happyReduction_63
happyReduction_63 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_1 of { happy_var_1 -> 
	case happyOut28 happy_x_3 of { happy_var_3 -> 
	happyIn28
		 (happy_var_1 : happy_var_3
	)}}


happyReduce_64 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_64 = happyReduce 6# 25# happyReduction_64
happyReduction_64 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { ((Const, happy_var_1)) -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut33 happy_x_4 of { happy_var_4 -> 
	case happyOut11 happy_x_6 of { happy_var_6 -> 
	happyIn29
		 (DeclConst {dcConst = tspIdName happy_var_2, dcType = happy_var_4, dcVal = happy_var_6,
                     declSrcPos = happy_var_1}
	) `HappyStk` happyRest}}}}


happyReduce_65 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_65 = happyReduce 4# 25# happyReduction_65
happyReduction_65 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { ((Var, happy_var_1)) -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut33 happy_x_4 of { happy_var_4 -> 
	happyIn29
		 (DeclVar {dvVar = tspIdName happy_var_2, dvType = happy_var_4, dvMbVal = Nothing,
          declSrcPos = happy_var_1}
	) `HappyStk` happyRest}}}


happyReduce_66 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_66 = happyReduce 6# 25# happyReduction_66
happyReduction_66 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { ((Var, happy_var_1)) -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut33 happy_x_4 of { happy_var_4 -> 
	case happyOut11 happy_x_6 of { happy_var_6 -> 
	happyIn29
		 (DeclVar {dvVar = tspIdName happy_var_2, dvType = happy_var_4, dvMbVal = Just happy_var_6,
          declSrcPos = happy_var_1}
	) `HappyStk` happyRest}}}}


happyReduce_67 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_67 = happyReduce 9# 25# happyReduction_67
happyReduction_67 (happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { ((Fun, happy_var_1)) -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut30 happy_x_4 of { happy_var_4 -> 
	case happyOut33 happy_x_7 of { happy_var_7 -> 
	case happyOut11 happy_x_9 of { happy_var_9 -> 
	happyIn29
		 (DeclFun {dfFun = tspIdName happy_var_2, dfArgDecls = happy_var_4, dfType = happy_var_7,
                   dfBody = happy_var_9, declSrcPos = happy_var_1}
	) `HappyStk` happyRest}}}}}


happyReduce_68 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_68 = happyReduce 6# 25# happyReduction_68
happyReduction_68 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { ((Proc, happy_var_1)) -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut30 happy_x_4 of { happy_var_4 -> 
	case happyOut6 happy_x_6 of { happy_var_6 -> 
	happyIn29
		 (DeclProc {dpProc = tspIdName happy_var_2, dpArgDecls = happy_var_4, dpBody = happy_var_6,
                    declSrcPos = happy_var_1}
	) `HappyStk` happyRest}}}}


happyReduce_69 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_69 = happySpecReduce_0  26# happyReduction_69
happyReduction_69  =  happyIn30
		 ([]
	)


happyReduce_70 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_70 = happySpecReduce_1  26# happyReduction_70
happyReduction_70 happy_x_1
	 =  case happyOut31 happy_x_1 of { happy_var_1 -> 
	happyIn30
		 (happy_var_1
	)}


happyReduce_71 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_71 = happySpecReduce_1  27# happyReduction_71
happyReduction_71 happy_x_1
	 =  case happyOut32 happy_x_1 of { happy_var_1 -> 
	happyIn31
		 ([happy_var_1]
	)}


happyReduce_72 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_72 = happySpecReduce_3  27# happyReduction_72
happyReduction_72 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut32 happy_x_1 of { happy_var_1 -> 
	case happyOut31 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (happy_var_1 : happy_var_3
	)}}


happyReduce_73 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_73 = happySpecReduce_3  28# happyReduction_73
happyReduction_73 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut33 happy_x_3 of { happy_var_3 -> 
	happyIn32
		 (ArgDecl {adArg = tspIdName happy_var_1, adArgMode = ByValue, adType = happy_var_3,
                   adSrcPos = tspSrcPos happy_var_1}
	)}}


happyReduce_74 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_74 = happyReduce 4# 28# happyReduction_74
happyReduction_74 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { ((In, happy_var_1)) -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut33 happy_x_4 of { happy_var_4 -> 
	happyIn32
		 (ArgDecl {adArg = tspIdName happy_var_2, adArgMode = ByRefIn, adType = happy_var_4,
                   adSrcPos = happy_var_1}
	) `HappyStk` happyRest}}}


happyReduce_75 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_75 = happyReduce 4# 28# happyReduction_75
happyReduction_75 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { ((Out, happy_var_1)) -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut33 happy_x_4 of { happy_var_4 -> 
	happyIn32
		 (ArgDecl {adArg = tspIdName happy_var_2, adArgMode = ByRefOut, adType = happy_var_4,
                   adSrcPos = happy_var_1}
	) `HappyStk` happyRest}}}


happyReduce_76 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_76 = happyReduce 4# 28# happyReduction_76
happyReduction_76 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { ((Var, happy_var_1)) -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut33 happy_x_4 of { happy_var_4 -> 
	happyIn32
		 (ArgDecl {adArg = tspIdName happy_var_2, adArgMode = ByRefVar, adType = happy_var_4,
                   adSrcPos = happy_var_1}
	) `HappyStk` happyRest}}}


happyReduce_77 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_77 = happySpecReduce_1  29# happyReduction_77
happyReduction_77 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn33
		 (TDBaseType { tdbtName = tspIdName happy_var_1, tdSrcPos = tspSrcPos happy_var_1 }
	)}


happyReduce_78 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_78 = happyReduce 4# 29# happyReduction_78
happyReduction_78 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut33 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_3 of { happy_var_3 -> 
	happyIn33
		 (TDArray { tdaEltType = happy_var_1, tdaSize = tspLIVal happy_var_3,
                    tdSrcPos = srcPos happy_var_1 }
	) `HappyStk` happyRest}}


happyReduce_79 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_79 = happySpecReduce_3  29# happyReduction_79
happyReduction_79 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { ((LBrc, happy_var_1)) -> 
	case happyOut34 happy_x_2 of { happy_var_2 -> 
	happyIn33
		 (TDRecord { tdrFldTypes = happy_var_2, tdSrcPos = happy_var_1 }
	)}}


happyReduce_80 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_80 = happySpecReduce_0  30# happyReduction_80
happyReduction_80  =  happyIn34
		 ([]
	)


happyReduce_81 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_81 = happySpecReduce_1  30# happyReduction_81
happyReduction_81 happy_x_1
	 =  case happyOut35 happy_x_1 of { happy_var_1 -> 
	happyIn34
		 (happy_var_1
	)}


happyReduce_82 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_82 = happySpecReduce_1  31# happyReduction_82
happyReduction_82 happy_x_1
	 =  case happyOut36 happy_x_1 of { happy_var_1 -> 
	happyIn35
		 ([happy_var_1]
	)}


happyReduce_83 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_83 = happySpecReduce_3  31# happyReduction_83
happyReduction_83 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut36 happy_x_1 of { happy_var_1 -> 
	case happyOut35 happy_x_3 of { happy_var_3 -> 
	happyIn35
		 (happy_var_1 : happy_var_3
	)}}


happyReduce_84 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduce_84 = happySpecReduce_3  32# happyReduction_84
happyReduction_84 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut33 happy_x_3 of { happy_var_3 -> 
	happyIn36
		 ((tspIdName happy_var_1, happy_var_3)
	)}}

happyNewToken action sts stk
	= scanner(\tk -> 
	let cont i = happyDoAction i tk action sts stk in
	case tk of {
	(EOF, _) -> happyDoAction 48# tk action sts stk;
	(LPar, happy_dollar_dollar) -> cont 1#;
	(RPar, happy_dollar_dollar) -> cont 2#;
	(LBrk, happy_dollar_dollar) -> cont 3#;
	(RBrk, happy_dollar_dollar) -> cont 4#;
	(LBrc, happy_dollar_dollar) -> cont 5#;
	(RBrc, happy_dollar_dollar) -> cont 6#;
	(Comma, happy_dollar_dollar) -> cont 7#;
	(Period, happy_dollar_dollar) -> cont 8#;
	(Semicol, happy_dollar_dollar) -> cont 9#;
	(Colon, happy_dollar_dollar) -> cont 10#;
	(ColEq, happy_dollar_dollar) -> cont 11#;
	(Equals, happy_dollar_dollar) -> cont 12#;
	(Cond, happy_dollar_dollar) -> cont 13#;
	(Begin, happy_dollar_dollar) -> cont 14#;
	(Const, happy_dollar_dollar) -> cont 15#;
	(Do, happy_dollar_dollar) -> cont 16#;
	(Else, happy_dollar_dollar) -> cont 17#;
	(Elsif, happy_dollar_dollar) -> cont 18#;
	(End, happy_dollar_dollar) -> cont 19#;
	(Fun, happy_dollar_dollar) -> cont 20#;
	(If, happy_dollar_dollar) -> cont 21#;
	(In, happy_dollar_dollar) -> cont 22#;
	(Let, happy_dollar_dollar) -> cont 23#;
	(Out, happy_dollar_dollar) -> cont 24#;
	(Proc, happy_dollar_dollar) -> cont 25#;
	(Repeat, happy_dollar_dollar) -> cont 26#;
	(Then, happy_dollar_dollar) -> cont 27#;
	(Until, happy_dollar_dollar) -> cont 28#;
	(Var, happy_dollar_dollar) -> cont 29#;
	(While, happy_dollar_dollar) -> cont 30#;
	(LitInt {}, _) -> cont 31#;
	(LitChr {}, _) -> cont 32#;
	(Id {}, _) -> cont 33#;
	(Op {opName="+"},   _) -> cont 34#;
	(Op {opName="-"},   _) -> cont 35#;
	(Op {opName="*"},   _) -> cont 36#;
	(Op {opName="/"},   _) -> cont 37#;
	(Op {opName="^"},   _) -> cont 38#;
	(Op {opName="<"},   _) -> cont 39#;
	(Op {opName="<="},  _) -> cont 40#;
	(Op {opName="=="},  _) -> cont 41#;
	(Op {opName="!="},  _) -> cont 42#;
	(Op {opName=">="},  _) -> cont 43#;
	(Op {opName=">"},   _) -> cont 44#;
	(Op {opName="&&"},  _) -> cont 45#;
	(Op {opName="||"},  _) -> cont 46#;
	(Op {opName="!"},   _) -> cont 47#;
	_ -> happyError' (tk, [])
	})

happyError_ explist 48# tk = happyError' (tk, explist)
happyError_ explist _ tk = happyError' (tk, explist)

happyThen :: () => P a -> (a -> P b) -> P b
happyThen = (>>=)
happyReturn :: () => a -> P a
happyReturn = (return)

happyParse :: () => Happy_GHC_Exts.Int# -> P (HappyAbsSyn _ _ _ _)

happyNewToken :: () => Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyDoAction :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _)

happyReduceArr :: () => Happy_Data_Array.Array Int (Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn _ _ _ _) -> P (HappyAbsSyn _ _ _ _))


happyThen1 :: () => P a -> (a -> P b) -> P b
happyThen1 = happyThen
happyReturn1 :: () => a -> P a
happyReturn1 = happyReturn
happyError' :: () => (((Token, SrcPos)), [String]) -> P a
happyError' tk = (\(tokens, explist) -> happyError) tk
parseAux = happySomeParser where
 happySomeParser = happyThen (happyParse 0#) (\x -> happyReturn (happyOut4 x))

happySeq = happyDontSeq


happyError :: P a
happyError = failP "Parse error"


-- | Parses a MiniTriangle program, building an AST representation of it
-- if successful.

parse :: String -> DF AST
parse = runP parseAux


-- Projection functions for pairs of token and source position.

tspSrcPos :: (Token,SrcPos) -> SrcPos
tspSrcPos = snd


tspLIVal :: (Token,SrcPos) -> Integer
tspLIVal (LitInt {liVal = n}, _) = n
tspLIVal _ = parserErr "tspLIVal" "Not a LitInt"


tspLCVal :: (Token,SrcPos) -> Char
tspLCVal (LitChr {lcVal = c}, _) = c
tspLCVal _ = parserErr "tspLCVal" "Not a LitChr"


tspIdName :: (Token,SrcPos) -> Name
tspIdName (Id {idName = nm}, _) = nm
tspIdName _ = parserErr "tspIdName" "Not an Id"


tspOpName :: (Token,SrcPos) -> Name
tspOpName (Op {opName = nm}, _) = nm
tspOpName _ = parserErr "tspOpName" "Not an Op"


-- Helper functions for building ASTs.

-- Builds ExpVar from pair of Binary Operator Token and SrcPos.
mkExpVarBinOp :: (Token,SrcPos) -> Expression
mkExpVarBinOp otsp =
    ExpVar {evVar = tspOpName otsp, expSrcPos = tspSrcPos otsp}


-- Builds ExpVar from pair of Unary Operator Token and SrcPos.
-- As a special case, the unary operator "-" is substituted for the name
-- "neg" to avoid confusion with the binary operator "-" later.
mkExpVarUnOp :: (Token,SrcPos) -> Expression
mkExpVarUnOp otsp =
    ExpVar {evVar = nm, expSrcPos = tspSrcPos otsp}
    where
        onm = tspOpName otsp
        nm  = if onm == "-" then "neg" else onm


-- | Test utility. Attempts to parse the given string input and,
-- if successful, pretty-prints the resulting AST.

testParser :: String -> IO ()
testParser s = do
    putStrLn "Diagnostics:"
    mapM_ (putStrLn . ppDMsg) (snd result)
    putStrLn ""
    case fst result of
        Just ast -> do
                        putStrLn "AST:"
                        putStrLn (ppAST ast)
        Nothing -> putStrLn "Parsing produced no result."
    putStrLn ""
    where
        result :: (Maybe AST, [DMsg])
        result = runDF (parse s)


parserErr :: String -> String -> a
parserErr = internalError "Parser"
{-# LINE 1 "templates/GenericTemplate.hs" #-}





































































































































































































-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.



data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList




















infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 0#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}
          

          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# (0# :: Happy_GHC_Exts.Int#))) :: Bool) -> {- nothing -}
                                                   
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}
                                     

                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+#  i)
         check  = if ((Happy_GHC_Exts.tagToEnum# (off_i Happy_GHC_Exts.>=# (0# :: Happy_GHC_Exts.Int#))) :: Bool)
                  then ((Happy_GHC_Exts.tagToEnum# (indexShortOffAddr happyCheck off_i Happy_GHC_Exts.==#  i)) :: Bool)
                  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = ((Happy_GHC_Exts.tagToEnum# (x Happy_GHC_Exts.<# y)) :: Bool)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+#  nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+#  nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (0# is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  0# tk old_st (HappyCons ((action)) (sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        happyDoAction 0# tk action sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ( (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.


