{-# LINE 1 "happy-output.hs" #-}











































































































































































































{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}

{-# OPTIONS_GHC -XPartialTypeSignatures #-}

-- | Parser for TAM code

module TAMCodeParser (
    parseTC             -- :: String -> DF [TAMInst]
) where

-- Standard library imports
import Data.Char (isDigit, isAlpha, isAlphaNum)

-- HMTC module imports
import SrcPos
import Diagnostics
import Name
import Type (MTInt, isMTInt)
import ParseMonad
import TAMCode
import PPTAMCode
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

newtype HappyAbsSyn  = HappyAbsSyn HappyAny

type HappyAny = Happy_GHC_Exts.Any



happyIn4 :: ([TAMInst]) -> (HappyAbsSyn )
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn ) -> ([TAMInst])
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
happyIn5 :: ([TAMInst]) -> (HappyAbsSyn )
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn ) -> ([TAMInst])
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
happyIn6 :: (TAMInst) -> (HappyAbsSyn )
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn ) -> (TAMInst)
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
happyIn7 :: (TAMInst) -> (HappyAbsSyn )
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn ) -> (TAMInst)
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
happyIn8 :: (Name) -> (HappyAbsSyn )
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn ) -> (Name)
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
happyIn9 :: (Addr) -> (HappyAbsSyn )
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn ) -> (Addr)
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
happyIn10 :: (MTInt) -> (HappyAbsSyn )
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn ) -> (MTInt)
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
happyIn11 :: (MTInt) -> (HappyAbsSyn )
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn ) -> (MTInt)
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
happyIn12 :: (MTInt) -> (HappyAbsSyn )
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn ) -> (MTInt)
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
happyIn13 :: (MTInt) -> (HappyAbsSyn )
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn ) -> (MTInt)
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
happyIn14 :: (MTInt) -> (HappyAbsSyn )
happyIn14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn ) -> (MTInt)
happyOut14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut14 #-}
happyInTok :: ((Token, SrcPos)) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> ((Token, SrcPos))
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfc\xff\xff\xff\x17\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x80\x01\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x01\x00\x01\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x80\x01\x00\x00\x00\x20\x00\x40\x00\x00\x00\x00\x00\x00\x00\x18\x00\x00\x00\x00\x02\x00\x60\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x60\x00\x00\x00\x00\x00\x00\x80\x01\x00\x00\x00\x00\x00\x00\x06\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseAux","program","lines","labeldef","instruction","label","addr","disp","size","litint","slitint","ulitint","'['","']'","':'","'+'","'-'","SB","LB","ST","LOADL","LOADCA","LOAD","LOADA","LOADI","STORE","STOREI","LOADLB","LOADIB","STOREIB","POP","ADD","SUB","MUL","DIV","NEG","LSS","EQL","GTR","AND","OR","NOT","JUMP","JUMPIFZ","JUMPIFNZ","CALL","CALLI","RETURN","PUTINT","PUTCHR","GETINT","GETCHR","HALT","LITINT","ID","%eof"]
        bit_start = st * 58
        bit_end = (st + 1) * 58
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..57]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x00\x00\x00\x00\xfa\xff\xf8\xff\x00\x00\x00\x00\x46\x00\xfd\xff\x01\x00\x4e\x00\x4e\x00\xfd\xff\x4e\x00\xfd\xff\xfd\xff\x26\x00\x26\x00\x26\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x27\x00\x27\x00\x27\x00\x27\x00\x00\x00\x2c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x2c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x2c\x00\x00\x00\x00\x00\x2c\x00\x00\x00\x00\x00\x2d\x00\x2e\x00\x00\x00\x00\x00\x00\x00\x3a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x39\x00\x39\x00\x39\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4f\x00\x51\x00\x52\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x4d\x00\x54\x00\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x55\x00\x56\x00\x57\x00\x20\x00\x58\x00\x25\x00\x42\x00\x29\x00\x2a\x00\x2b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x5a\x00\x5b\x00\x5c\x00\x5d\x00\x00\x00\x2f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x31\x00\x00\x00\x00\x00\x35\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x59\x00\x5e\x00\x5f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\xfd\xff\x00\x00\xfe\xff\x00\x00\xfc\xff\xfb\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xee\xff\xed\xff\xec\xff\xeb\xff\xea\xff\xe9\xff\xe8\xff\xe7\xff\xe6\xff\xe5\xff\xe4\xff\x00\x00\x00\x00\x00\x00\x00\x00\xdf\xff\x00\x00\xdd\xff\xdc\xff\xdb\xff\xda\xff\xd9\xff\xd8\xff\x00\x00\xd3\xff\xce\xff\xe0\xff\xe1\xff\xe2\xff\xe3\xff\x00\x00\xf0\xff\xf1\xff\x00\x00\xd1\xff\xd2\xff\x00\x00\x00\x00\xf3\xff\xd4\xff\xf4\xff\x00\x00\xf5\xff\xf6\xff\xf7\xff\xf8\xff\xf9\xff\xfa\xff\x00\x00\x00\x00\x00\x00\xcf\xff\xd0\xff\xf2\xff\xef\xff\xde\xff\x00\x00\x00\x00\x00\x00\xd7\xff\xd6\xff\xd5\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x04\x00\x05\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2c\x00\x2b\x00\x06\x00\x2a\x00\x08\x00\x09\x00\x0a\x00\x06\x00\x2b\x00\x08\x00\x09\x00\x0a\x00\x07\x00\x07\x00\x07\x00\x0a\x00\x0a\x00\x0a\x00\x07\x00\x07\x00\x07\x00\x0a\x00\x0a\x00\x0a\x00\x07\x00\x04\x00\x05\x00\x0a\x00\x06\x00\x07\x00\x08\x00\x02\x00\x03\x00\x04\x00\x08\x00\x09\x00\x0a\x00\x03\x00\x08\x00\x09\x00\x0a\x00\x00\x00\x01\x00\x01\x00\x2a\x00\x02\x00\x2b\x00\x02\x00\x02\x00\x01\x00\x2a\x00\x2a\x00\x2a\x00\x04\x00\xff\xff\x05\x00\x05\x00\x05\x00\x04\x00\x04\x00\x04\x00\x04\x00\x09\x00\xff\xff\xff\xff\xff\xff\xff\xff\x09\x00\x09\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x37\x00\x38\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\xff\xff\x29\x00\x3c\x00\x2c\x00\x39\x00\x34\x00\x35\x00\x38\x00\x29\x00\x39\x00\x34\x00\x35\x00\x32\x00\x31\x00\x30\x00\x2a\x00\x2a\x00\x2a\x00\x29\x00\x49\x00\x48\x00\x2a\x00\x2a\x00\x2a\x00\x47\x00\x37\x00\x38\x00\x2a\x00\x43\x00\x44\x00\x45\x00\x04\x00\x05\x00\x06\x00\x40\x00\x34\x00\x35\x00\x42\x00\x33\x00\x34\x00\x35\x00\x03\x00\x02\x00\x3c\x00\x2c\x00\x50\x00\x29\x00\x4f\x00\x4e\x00\x02\x00\x2c\x00\x47\x00\x46\x00\x3f\x00\x00\x00\x3e\x00\x3d\x00\x3a\x00\x2f\x00\x2e\x00\x2d\x00\x2c\x00\x4c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4b\x00\x4a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 49) [
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
	(49 , happyReduce_49)
	]

happy_n_terms = 45 :: Int
happy_n_nonterms = 11 :: Int

happyReduce_1 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_1 = happySpecReduce_1  0# happyReduction_1
happyReduction_1 happy_x_1
	 =  case happyOut5 happy_x_1 of { happy_var_1 -> 
	happyIn4
		 (reverse happy_var_1
	)}

happyReduce_2 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_2 = happySpecReduce_0  1# happyReduction_2
happyReduction_2  =  happyIn5
		 ([]
	)

happyReduce_3 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_3 = happySpecReduce_2  1# happyReduction_3
happyReduction_3 happy_x_2
	happy_x_1
	 =  case happyOut5 happy_x_1 of { happy_var_1 -> 
	case happyOut6 happy_x_2 of { happy_var_2 -> 
	happyIn5
		 (happy_var_2 : happy_var_1
	)}}

happyReduce_4 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_4 = happySpecReduce_2  1# happyReduction_4
happyReduction_4 happy_x_2
	happy_x_1
	 =  case happyOut5 happy_x_1 of { happy_var_1 -> 
	case happyOut7 happy_x_2 of { happy_var_2 -> 
	happyIn5
		 (happy_var_2 : happy_var_1
	)}}

happyReduce_5 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_5 = happySpecReduce_2  2# happyReduction_5
happyReduction_5 happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { happy_var_1 -> 
	happyIn6
		 (Label happy_var_1
	)}

happyReduce_6 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_6 = happySpecReduce_2  3# happyReduction_6
happyReduction_6 happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (LOADL happy_var_2
	)}

happyReduce_7 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_7 = happySpecReduce_2  3# happyReduction_7
happyReduction_7 happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (LOADCA happy_var_2
	)}

happyReduce_8 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_8 = happySpecReduce_2  3# happyReduction_8
happyReduction_8 happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (LOAD happy_var_2
	)}

happyReduce_9 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_9 = happySpecReduce_2  3# happyReduction_9
happyReduction_9 happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (LOADA happy_var_2
	)}

happyReduce_10 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_10 = happySpecReduce_2  3# happyReduction_10
happyReduction_10 happy_x_2
	happy_x_1
	 =  case happyOut10 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (LOADI happy_var_2
	)}

happyReduce_11 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_11 = happySpecReduce_2  3# happyReduction_11
happyReduction_11 happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (STORE happy_var_2
	)}

happyReduce_12 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_12 = happySpecReduce_2  3# happyReduction_12
happyReduction_12 happy_x_2
	happy_x_1
	 =  case happyOut10 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (STOREI happy_var_2
	)}

happyReduce_13 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_13 = happySpecReduce_3  3# happyReduction_13
happyReduction_13 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_2 of { happy_var_2 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn7
		 (LOADLB happy_var_2 happy_var_3
	)}}

happyReduce_14 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_14 = happySpecReduce_2  3# happyReduction_14
happyReduction_14 happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (LOADIB happy_var_2
	)}

happyReduce_15 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_15 = happySpecReduce_2  3# happyReduction_15
happyReduction_15 happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (STOREIB happy_var_2
	)}

happyReduce_16 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_16 = happySpecReduce_3  3# happyReduction_16
happyReduction_16 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_2 of { happy_var_2 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn7
		 (POP happy_var_2 happy_var_3
	)}}

happyReduce_17 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_17 = happySpecReduce_1  3# happyReduction_17
happyReduction_17 happy_x_1
	 =  happyIn7
		 (ADD
	)

happyReduce_18 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_18 = happySpecReduce_1  3# happyReduction_18
happyReduction_18 happy_x_1
	 =  happyIn7
		 (SUB
	)

happyReduce_19 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_19 = happySpecReduce_1  3# happyReduction_19
happyReduction_19 happy_x_1
	 =  happyIn7
		 (MUL
	)

happyReduce_20 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_20 = happySpecReduce_1  3# happyReduction_20
happyReduction_20 happy_x_1
	 =  happyIn7
		 (DIV
	)

happyReduce_21 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_21 = happySpecReduce_1  3# happyReduction_21
happyReduction_21 happy_x_1
	 =  happyIn7
		 (NEG
	)

happyReduce_22 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_22 = happySpecReduce_1  3# happyReduction_22
happyReduction_22 happy_x_1
	 =  happyIn7
		 (LSS
	)

happyReduce_23 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_23 = happySpecReduce_1  3# happyReduction_23
happyReduction_23 happy_x_1
	 =  happyIn7
		 (EQL
	)

happyReduce_24 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_24 = happySpecReduce_1  3# happyReduction_24
happyReduction_24 happy_x_1
	 =  happyIn7
		 (GTR
	)

happyReduce_25 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_25 = happySpecReduce_1  3# happyReduction_25
happyReduction_25 happy_x_1
	 =  happyIn7
		 (AND
	)

happyReduce_26 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_26 = happySpecReduce_1  3# happyReduction_26
happyReduction_26 happy_x_1
	 =  happyIn7
		 (OR
	)

happyReduce_27 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_27 = happySpecReduce_1  3# happyReduction_27
happyReduction_27 happy_x_1
	 =  happyIn7
		 (NOT
	)

happyReduce_28 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_28 = happySpecReduce_2  3# happyReduction_28
happyReduction_28 happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (JUMP happy_var_2
	)}

happyReduce_29 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_29 = happySpecReduce_2  3# happyReduction_29
happyReduction_29 happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (JUMPIFZ happy_var_2
	)}

happyReduce_30 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_30 = happySpecReduce_2  3# happyReduction_30
happyReduction_30 happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (JUMPIFNZ happy_var_2
	)}

happyReduce_31 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_31 = happySpecReduce_2  3# happyReduction_31
happyReduction_31 happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (CALL happy_var_2
	)}

happyReduce_32 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_32 = happySpecReduce_1  3# happyReduction_32
happyReduction_32 happy_x_1
	 =  happyIn7
		 (CALLI
	)

happyReduce_33 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_33 = happySpecReduce_3  3# happyReduction_33
happyReduction_33 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_2 of { happy_var_2 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn7
		 (RETURN happy_var_2 happy_var_3
	)}}

happyReduce_34 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_34 = happySpecReduce_1  3# happyReduction_34
happyReduction_34 happy_x_1
	 =  happyIn7
		 (PUTINT
	)

happyReduce_35 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_35 = happySpecReduce_1  3# happyReduction_35
happyReduction_35 happy_x_1
	 =  happyIn7
		 (PUTCHR
	)

happyReduce_36 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_36 = happySpecReduce_1  3# happyReduction_36
happyReduction_36 happy_x_1
	 =  happyIn7
		 (GETINT
	)

happyReduce_37 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_37 = happySpecReduce_1  3# happyReduction_37
happyReduction_37 happy_x_1
	 =  happyIn7
		 (GETCHR
	)

happyReduce_38 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_38 = happySpecReduce_1  3# happyReduction_38
happyReduction_38 happy_x_1
	 =  happyIn7
		 (HALT
	)

happyReduce_39 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_39 = happySpecReduce_1  4# happyReduction_39
happyReduction_39 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn8
		 (tspIdName happy_var_1
	)}

happyReduce_40 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_40 = happyReduce 4# 5# happyReduction_40
happyReduction_40 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut13 happy_x_3 of { happy_var_3 -> 
	happyIn9
		 (SB happy_var_3
	) `HappyStk` happyRest}

happyReduce_41 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_41 = happyReduce 4# 5# happyReduction_41
happyReduction_41 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut13 happy_x_3 of { happy_var_3 -> 
	happyIn9
		 (LB happy_var_3
	) `HappyStk` happyRest}

happyReduce_42 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_42 = happyReduce 4# 5# happyReduction_42
happyReduction_42 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut13 happy_x_3 of { happy_var_3 -> 
	happyIn9
		 (ST happy_var_3
	) `HappyStk` happyRest}

happyReduce_43 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_43 = happySpecReduce_1  6# happyReduction_43
happyReduction_43 happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	happyIn10
		 (happy_var_1
	)}

happyReduce_44 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_44 = happySpecReduce_1  7# happyReduction_44
happyReduction_44 happy_x_1
	 =  case happyOut14 happy_x_1 of { happy_var_1 -> 
	happyIn11
		 (happy_var_1
	)}

happyReduce_45 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_45 = happySpecReduce_1  8# happyReduction_45
happyReduction_45 happy_x_1
	 =  case happyOut14 happy_x_1 of { happy_var_1 -> 
	happyIn12
		 (happy_var_1
	)}

happyReduce_46 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_46 = happySpecReduce_1  8# happyReduction_46
happyReduction_46 happy_x_1
	 =  case happyOut13 happy_x_1 of { happy_var_1 -> 
	happyIn12
		 (happy_var_1
	)}

happyReduce_47 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_47 = happyMonadReduce 2# 9# happyReduction_47
happyReduction_47 (happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest) tk
	 = happyThen ((case happyOutTok happy_x_2 of { happy_var_2 -> 
	( toMTInt (tspLIVal happy_var_2))})
	) (\r -> happyReturn (happyIn13 r))

happyReduce_48 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_48 = happyMonadReduce 2# 9# happyReduction_48
happyReduction_48 (happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest) tk
	 = happyThen ((case happyOutTok happy_x_2 of { happy_var_2 -> 
	( toMTInt (-(tspLIVal happy_var_2)))})
	) (\r -> happyReturn (happyIn13 r))

happyReduce_49 :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_49 = happyMonadReduce 1# 10# happyReduction_49
happyReduction_49 (happy_x_1 `HappyStk`
	happyRest) tk
	 = happyThen ((case happyOutTok happy_x_1 of { happy_var_1 -> 
	( toMTInt (tspLIVal happy_var_1))})
	) (\r -> happyReturn (happyIn14 r))

happyNewToken action sts stk
	= scanner(\tk -> 
	let cont i = happyDoAction i tk action sts stk in
	case tk of {
	(T_EOF, _) -> happyDoAction 44# tk action sts stk;
	(T_LBrk, happy_dollar_dollar) -> cont 1#;
	(T_RBrk, happy_dollar_dollar) -> cont 2#;
	(T_Colon, happy_dollar_dollar) -> cont 3#;
	(T_Plus, happy_dollar_dollar) -> cont 4#;
	(T_Minus, happy_dollar_dollar) -> cont 5#;
	(T_SB, happy_dollar_dollar) -> cont 6#;
	(T_LB, happy_dollar_dollar) -> cont 7#;
	(T_ST, happy_dollar_dollar) -> cont 8#;
	(T_LOADL, happy_dollar_dollar) -> cont 9#;
	(T_LOADCA, happy_dollar_dollar) -> cont 10#;
	(T_LOAD, happy_dollar_dollar) -> cont 11#;
	(T_LOADA, happy_dollar_dollar) -> cont 12#;
	(T_LOADI, happy_dollar_dollar) -> cont 13#;
	(T_STORE, happy_dollar_dollar) -> cont 14#;
	(T_STOREI, happy_dollar_dollar) -> cont 15#;
	(T_LOADLB, happy_dollar_dollar) -> cont 16#;
	(T_LOADIB, happy_dollar_dollar) -> cont 17#;
	(T_STOREIB, happy_dollar_dollar) -> cont 18#;
	(T_POP, happy_dollar_dollar) -> cont 19#;
	(T_ADD, happy_dollar_dollar) -> cont 20#;
	(T_SUB, happy_dollar_dollar) -> cont 21#;
	(T_MUL, happy_dollar_dollar) -> cont 22#;
	(T_DIV, happy_dollar_dollar) -> cont 23#;
	(T_NEG, happy_dollar_dollar) -> cont 24#;
	(T_LSS, happy_dollar_dollar) -> cont 25#;
	(T_EQL, happy_dollar_dollar) -> cont 26#;
	(T_GTR, happy_dollar_dollar) -> cont 27#;
	(T_AND, happy_dollar_dollar) -> cont 28#;
	(T_OR, happy_dollar_dollar) -> cont 29#;
	(T_NOT, happy_dollar_dollar) -> cont 30#;
	(T_JUMP, happy_dollar_dollar) -> cont 31#;
	(T_JUMPIFZ, happy_dollar_dollar) -> cont 32#;
	(T_JUMPIFNZ, happy_dollar_dollar) -> cont 33#;
	(T_CALL, happy_dollar_dollar) -> cont 34#;
	(T_CALLI, happy_dollar_dollar) -> cont 35#;
	(T_RETURN, happy_dollar_dollar) -> cont 36#;
	(T_PUTINT, happy_dollar_dollar) -> cont 37#;
	(T_PUTCHR, happy_dollar_dollar) -> cont 38#;
	(T_GETINT, happy_dollar_dollar) -> cont 39#;
	(T_GETCHR, happy_dollar_dollar) -> cont 40#;
	(T_HALT, happy_dollar_dollar) -> cont 41#;
	(T_LitInt {}, _) -> cont 42#;
	(T_Id {}, _) -> cont 43#;
	_ -> happyError' (tk, [])
	})

happyError_ explist 44# tk = happyError' (tk, explist)
happyError_ explist _ tk = happyError' (tk, explist)

happyThen :: () => P a -> (a -> P b) -> P b
happyThen = (>>=)
happyReturn :: () => a -> P a
happyReturn = (return)
happyParse :: () => Happy_GHC_Exts.Int# -> P (HappyAbsSyn )

happyNewToken :: () => Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )

happyDoAction :: () => Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )

happyReduceArr :: () => Happy_Data_Array.Array Int (Happy_GHC_Exts.Int# -> (Token, SrcPos) -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn ))

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


toMTInt :: Integer -> P MTInt
toMTInt n =
    if isMTInt n then
        return (fromInteger n)
    else
        failP ("The integer " ++ show n
               ++ " is outside the MiniTriangle range.")


-- | Parses a TAM program, building a list of TAM instructions if successful.

parseTC :: String -> DF [TAMInst]
parseTC = runP parseAux


-- Token type for TAM code

data Token
    -- Graphical tokens
    = T_LBrk      -- "["
    | T_RBrk      -- "]"
    | T_Colon     -- ":"
    | T_Plus      -- "+"
    | T_Minus     -- "-"

    -- Registers
    | T_SB
    | T_LB
    | T_ST

    -- Instructions
    | T_LOADL
    | T_LOADCA
    | T_LOAD
    | T_LOADA
    | T_LOADI
    | T_STORE
    | T_STOREI
    | T_LOADLB
    | T_LOADIB
    | T_STOREIB
    | T_POP
    | T_ADD
    | T_SUB
    | T_MUL
    | T_DIV
    | T_NEG
    | T_LSS
    | T_EQL
    | T_GTR
    | T_AND
    | T_OR
    | T_NOT
    | T_JUMP
    | T_JUMPIFZ
    | T_JUMPIFNZ
    | T_CALL
    | T_CALLI
    | T_RETURN
    | T_PUTINT
    | T_PUTCHR
    | T_GETINT
    | T_GETCHR
    | T_HALT

    -- Tokens with variable spellings
    | T_LitInt {liVal :: Integer}
    | T_Id     {idName :: Name}

    -- End Of File marker
    | T_EOF
    deriving (Eq, Show)


-- Projection functions for pairs of token and source position.

tspSrcPos :: (Token,SrcPos) -> SrcPos
tspSrcPos = snd


tspLIVal :: (Token,SrcPos) -> Integer
tspLIVal (T_LitInt {liVal = n}, _) = n
tspLIVal _ = parserErr "tspLIVal" "Not a LitInt"


tspIdName :: (Token,SrcPos) -> Name
tspIdName (T_Id {idName = nm}, _) = nm
tspIdName _ = parserErr "tspIdName" "Not an Id"


tabWidth :: Int
tabWidth = 8


nextTabStop :: Int -> Int
nextTabStop n = n + (tabWidth - (n-1) `mod` tabWidth)


-- TAM code scanner

scanner :: ((Token, SrcPos) -> P a) -> P a
scanner cont = P $ scan
    where
        -- scan :: Int -> Int -> String -> D a
        -- End Of File
        scan l c []         = retTkn T_EOF l c c []
        -- Skip white space and comments, including handling various
        -- line ending conventions (NL, CR+NL, NL+CR) gracefully.
        scan l c ('\n' : s) = scan (l + 1) 1 s
        scan l c ('\r' : s) = scan l 1 s
        scan l c ('\t' : s) = scan l (nextTabStop c) s
        scan l c (' ' : s)  = scan l (c + 1) s
        scan l c (';' : s)  = scan l c (dropWhile (/='\n') s)
        -- Scan graphical tokens
        scan l c ('[' : s)  = retTkn T_LBrk l c (c + 1) s
        scan l c (']' : s)  = retTkn T_RBrk l c (c + 1) s
        scan l c (':' : s)  = retTkn T_Colon l c (c + 1) s
        scan l c ('+' : s)  = retTkn T_Plus l c (c + 1) s
        scan l c ('-' : s)  = retTkn T_Minus l c (c + 1) s
        -- Scan numeric literals, dentifiers, and instructions
        scan l c (x : s) | isDigit x      = scanLitInt l c x s
                         | isIdStartChr x = scanIdOrKwd l c x s
                         | otherwise = do
                                emitErrD (SrcPos l c)
                                         ("Lexical error: Illegal character "
                                           ++ show x  ++ " (discarded)")
                                scan l (c + 1) s

        -- scanLitInt :: Int -> Int -> Char -> String -> D a
        -- Note: We cannot check that the scanned integer literal fits
        -- in an MTInt already here as that would rule out -2^31.
        scanLitInt l c x s = retTkn (T_LitInt (read (x : tail))) l c c' s'
            where
                (tail, s') = span isDigit s
                c'         = c + 1 + length tail

        -- scanIdOrKwd :: Int -> Int -> Char -> String -> D a
        scanIdOrKwd l c x s = retTkn (mkIdOrKwd (x : tail)) l c c' s'
            where
                (tail, s') = span isIdChr s
                c'         = c + 1 + length tail

        mkIdOrKwd :: String -> Token
        mkIdOrKwd "SB"       = T_SB
        mkIdOrKwd "LB"       = T_LB
        mkIdOrKwd "ST"       = T_ST
        mkIdOrKwd "LOADL"    = T_LOADL
        mkIdOrKwd "LOADCA"   = T_LOADCA
        mkIdOrKwd "LOAD"     = T_LOAD
        mkIdOrKwd "LOADA"    = T_LOADA
        mkIdOrKwd "LOADI"    = T_LOADI
        mkIdOrKwd "STORE"    = T_STORE
        mkIdOrKwd "STOREI"   = T_STOREI
        mkIdOrKwd "LOADLB"   = T_LOADLB
        mkIdOrKwd "LOADIB"   = T_LOADIB
        mkIdOrKwd "STOREIB"  = T_STOREIB
        mkIdOrKwd "POP"      = T_POP
        mkIdOrKwd "ADD"      = T_ADD
        mkIdOrKwd "SUB"      = T_SUB
        mkIdOrKwd "MUL"      = T_MUL
        mkIdOrKwd "DIV"      = T_DIV
        mkIdOrKwd "NEG"      = T_NEG
        mkIdOrKwd "LSS"      = T_LSS
        mkIdOrKwd "EQL"      = T_EQL
        mkIdOrKwd "GTR"      = T_GTR
        mkIdOrKwd "AND"      = T_AND
        mkIdOrKwd "OR"       = T_OR
        mkIdOrKwd "NOT"      = T_NOT
        mkIdOrKwd "JUMP"     = T_JUMP
        mkIdOrKwd "JUMPIFZ"  = T_JUMPIFZ
        mkIdOrKwd "JUMPIFNZ" = T_JUMPIFNZ
        mkIdOrKwd "CALL"     = T_CALL
        mkIdOrKwd "CALLI"    = T_CALLI
        mkIdOrKwd "RETURN"   = T_RETURN
        mkIdOrKwd "PUTINT"   = T_PUTINT
        mkIdOrKwd "PUTCHR"   = T_PUTCHR
        mkIdOrKwd "GETINT"   = T_GETINT
        mkIdOrKwd "GETCHR"   = T_GETCHR
        mkIdOrKwd "HALT"     = T_HALT
        mkIdOrKwd name       = T_Id {idName = name}

        -- Return token, position of token, updated position, and remaning
        -- input. We assume tnat no MiniTriangle token span multiple
        -- lines. Hence only one line number argument is needed.
        -- retTkn :: Token -> Int -> Int -> Int -> String -> D a
        retTkn t l c c' = unP (cont (t, SrcPos {spLine = l, spCol = c})) l c'


isIdChr :: Char -> Bool
isIdChr c = isAlphaNum c || c == '#' || c == '$' || c == '@' || c == '_'


isIdStartChr :: Char -> Bool
isIdStartChr c = isAlpha c || c == '#' || c == '$' || c == '@' || c == '_'


-- Test utility. Attempts to parse the given string input and,
-- if successful, pretty-prints the resulting AST.

testTCParser :: String -> IO ()
testTCParser s = do
    putStrLn "Diagnostics:"
    mapM_ (putStrLn . ppDMsg) (snd result)
    putStrLn ""
    case fst result of
        Just is -> do
            putStrLn "TAM Code:"
            putStrLn (ppTAMCode is)
        Nothing ->
            putStrLn "Parsing produced no result."
    putStrLn ""
    where
        result :: (Maybe [TAMInst], [DMsg])
        result = runDF (parseTC s)


-- Internal error reporting

parserErr :: String -> String -> a
parserErr = internalError "TAMCodeParser"
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


