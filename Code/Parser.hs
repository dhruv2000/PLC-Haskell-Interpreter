{-# OPTIONS_GHC -w #-}
module Parser where

import Base
import Data
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn 
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 (Program)
	| HappyAbsSyn5 ([Definition])
	| HappyAbsSyn6 (Definition)
	| HappyAbsSyn7 (VType)
	| HappyAbsSyn8 ([String])
	| HappyAbsSyn9 (Exp)
	| HappyAbsSyn10 ([Statement])
	| HappyAbsSyn11 (Statement)

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m = 
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> m HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> m HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> m HappyAbsSyn
-}

action_0,
 action_1,
 action_2,
 action_3,
 action_4,
 action_5,
 action_6,
 action_7,
 action_8,
 action_9,
 action_10,
 action_11,
 action_12,
 action_13,
 action_14,
 action_15,
 action_16,
 action_17,
 action_18,
 action_19,
 action_20,
 action_21,
 action_22,
 action_23,
 action_24,
 action_25,
 action_26,
 action_27,
 action_28,
 action_29,
 action_30,
 action_31,
 action_32,
 action_33,
 action_34,
 action_35,
 action_36,
 action_37,
 action_38,
 action_39,
 action_40,
 action_41,
 action_42,
 action_43,
 action_44,
 action_45,
 action_46,
 action_47,
 action_48,
 action_49,
 action_50,
 action_51,
 action_52,
 action_53,
 action_54,
 action_55,
 action_56,
 action_57,
 action_58,
 action_59,
 action_60,
 action_61,
 action_62,
 action_63,
 action_64,
 action_65,
 action_66,
 action_67,
 action_68,
 action_69,
 action_70,
 action_71,
 action_72,
 action_73,
 action_74,
 action_75,
 action_76,
 action_77,
 action_78,
 action_79,
 action_80,
 action_81,
 action_82,
 action_83,
 action_84,
 action_85,
 action_86,
 action_87,
 action_88,
 action_89,
 action_90,
 action_91,
 action_92,
 action_93,
 action_94,
 action_95,
 action_96,
 action_97,
 action_98,
 action_99,
 action_100,
 action_101,
 action_102,
 action_103,
 action_104,
 action_105,
 action_106,
 action_107,
 action_108,
 action_109,
 action_110,
 action_111,
 action_112,
 action_113,
 action_114 :: () => Int -> ({-HappyReduction (Parser) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> (Parser) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> (Parser) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> (Parser) HappyAbsSyn)

happyReduce_1,
 happyReduce_2,
 happyReduce_3,
 happyReduce_4,
 happyReduce_5,
 happyReduce_6,
 happyReduce_7,
 happyReduce_8,
 happyReduce_9,
 happyReduce_10,
 happyReduce_11,
 happyReduce_12,
 happyReduce_13,
 happyReduce_14,
 happyReduce_15,
 happyReduce_16,
 happyReduce_17,
 happyReduce_18,
 happyReduce_19,
 happyReduce_20,
 happyReduce_21,
 happyReduce_22,
 happyReduce_23,
 happyReduce_24,
 happyReduce_25,
 happyReduce_26,
 happyReduce_27,
 happyReduce_28,
 happyReduce_29,
 happyReduce_30,
 happyReduce_31,
 happyReduce_32,
 happyReduce_33,
 happyReduce_34,
 happyReduce_35,
 happyReduce_36,
 happyReduce_37,
 happyReduce_38,
 happyReduce_39,
 happyReduce_40,
 happyReduce_41,
 happyReduce_42,
 happyReduce_43,
 happyReduce_44,
 happyReduce_45 :: () => ({-HappyReduction (Parser) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> (Parser) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> (Parser) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> (Parser) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,309) ([0,0,1024,0,0,0,4,0,1024,0,0,0,0,4,8192,0,0,0,0,0,0,0,0,2048,0,0,0,512,0,0,0,0,32,16384,12293,0,0,0,0,0,8,0,8192,0,1344,48,32768,0,0,8192,0,0,0,0,1,0,0,256,0,0,0,1,0,0,0,57344,0,32,0,0,0,0,57344,0,32768,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,32768,0,16,12288,61708,39,0,3120,10225,0,12288,61708,39,0,32768,0,0,12288,61708,39,0,0,0,0,0,0,0,0,16320,6144,16,0,0,0,0,0,0,0,12288,61708,39,0,3120,10225,0,12288,61708,39,0,0,0,0,0,0,0,0,3120,10225,0,12288,61708,39,0,3120,10225,0,12288,61708,39,0,3120,10225,0,12288,61708,39,0,3120,10225,0,49152,575,24,0,3120,10225,0,49152,575,24,0,16320,6146,0,12288,61708,39,0,0,0,0,12288,61708,39,0,0,0,0,49152,63,4120,0,16320,6144,16,12288,61708,39,0,3120,10225,0,12288,61708,39,0,3120,10225,0,12288,61708,39,0,3120,10225,0,12288,61708,39,0,3120,10225,0,0,0,0,64,3120,10225,0,12288,61708,39,0,0,0,16,49152,575,24,0,0,0,2,49152,63,152,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16320,6146,0,0,48,0,0,12288,0,0,0,0,0,0,0,0,0,12288,61708,39,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,12288,0,0,0,48,0,0,15360,0,0,0,60,0,0,15360,0,0,0,60,0,0,0,0,0,0,0,0,0,32,16384,12293,8192,0,1344,48,16320,6144,2,0,0,0,0,0,4,0,0,2048,0,0,0,8,0,0,0,0,0,0,0,0,8192,0,1344,48,0,8,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParser","Program","Defs","Definition","Type","ID_List","Exp","Statements","Statement","int","float","ID","'<'","'>'","'<='","'>='","'+'","'-'","'*'","'/'","'='","':='","'('","')'","'begin'","'end'","'true'","'false'","'sqrt'","'ln'","'sin'","'exp'","'cos'","'AND'","'OR'","'not'","'for'","'to'","'while'","'do'","'var'","':'","';'","'boolean'","'real'","'const'","'string'","','","'ID_List'","'program'","'writeln'","'if'","'then'","%eof"]
        bit_start = st * 56
        bit_end = (st + 1) * 56
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..55]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (43) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 _ = happyReduce_2

action_1 (43) = happyShift action_4
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (27) = happyShift action_9
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (43) = happyShift action_4
action_3 (5) = happyGoto action_8
action_3 (6) = happyGoto action_3
action_3 _ = happyReduce_2

action_4 (14) = happyShift action_7
action_4 (8) = happyGoto action_6
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (56) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (44) = happyShift action_20
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (44) = happyShift action_18
action_7 (50) = happyShift action_19
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_3

action_9 (14) = happyShift action_13
action_9 (39) = happyShift action_14
action_9 (41) = happyShift action_15
action_9 (43) = happyShift action_4
action_9 (53) = happyShift action_16
action_9 (54) = happyShift action_17
action_9 (6) = happyGoto action_10
action_9 (10) = happyGoto action_11
action_9 (11) = happyGoto action_12
action_9 _ = happyReduce_36

action_10 _ = happyReduce_38

action_11 (28) = happyShift action_34
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (14) = happyShift action_13
action_12 (39) = happyShift action_14
action_12 (41) = happyShift action_15
action_12 (43) = happyShift action_4
action_12 (53) = happyShift action_16
action_12 (54) = happyShift action_17
action_12 (6) = happyGoto action_10
action_12 (10) = happyGoto action_33
action_12 (11) = happyGoto action_12
action_12 _ = happyReduce_36

action_13 (24) = happyShift action_32
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (14) = happyShift action_31
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (25) = happyShift action_30
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (25) = happyShift action_29
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (25) = happyShift action_28
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (46) = happyShift action_22
action_18 (47) = happyShift action_23
action_18 (48) = happyShift action_24
action_18 (7) = happyGoto action_27
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (14) = happyShift action_26
action_19 (8) = happyGoto action_25
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (46) = happyShift action_22
action_20 (47) = happyShift action_23
action_20 (48) = happyShift action_24
action_20 (7) = happyGoto action_21
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (24) = happyShift action_56
action_21 (45) = happyShift action_57
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_8

action_23 _ = happyReduce_9

action_24 _ = happyReduce_10

action_25 _ = happyReduce_12

action_26 (50) = happyShift action_19
action_26 _ = happyReduce_11

action_27 (24) = happyShift action_54
action_27 (45) = happyShift action_55
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (13) = happyShift action_36
action_28 (14) = happyShift action_37
action_28 (19) = happyShift action_38
action_28 (20) = happyShift action_39
action_28 (25) = happyShift action_51
action_28 (29) = happyShift action_41
action_28 (30) = happyShift action_42
action_28 (31) = happyShift action_43
action_28 (32) = happyShift action_44
action_28 (33) = happyShift action_45
action_28 (34) = happyShift action_46
action_28 (35) = happyShift action_47
action_28 (38) = happyShift action_48
action_28 (9) = happyGoto action_53
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (13) = happyShift action_36
action_29 (14) = happyShift action_37
action_29 (19) = happyShift action_38
action_29 (20) = happyShift action_39
action_29 (25) = happyShift action_51
action_29 (29) = happyShift action_41
action_29 (30) = happyShift action_42
action_29 (31) = happyShift action_43
action_29 (32) = happyShift action_44
action_29 (33) = happyShift action_45
action_29 (34) = happyShift action_46
action_29 (35) = happyShift action_47
action_29 (38) = happyShift action_48
action_29 (9) = happyGoto action_52
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (13) = happyShift action_36
action_30 (14) = happyShift action_37
action_30 (19) = happyShift action_38
action_30 (20) = happyShift action_39
action_30 (25) = happyShift action_51
action_30 (29) = happyShift action_41
action_30 (30) = happyShift action_42
action_30 (31) = happyShift action_43
action_30 (32) = happyShift action_44
action_30 (33) = happyShift action_45
action_30 (34) = happyShift action_46
action_30 (35) = happyShift action_47
action_30 (38) = happyShift action_48
action_30 (9) = happyGoto action_50
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (24) = happyShift action_49
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (13) = happyShift action_36
action_32 (14) = happyShift action_37
action_32 (19) = happyShift action_38
action_32 (20) = happyShift action_39
action_32 (25) = happyShift action_40
action_32 (29) = happyShift action_41
action_32 (30) = happyShift action_42
action_32 (31) = happyShift action_43
action_32 (32) = happyShift action_44
action_32 (33) = happyShift action_45
action_32 (34) = happyShift action_46
action_32 (35) = happyShift action_47
action_32 (38) = happyShift action_48
action_32 (9) = happyGoto action_35
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_37

action_34 _ = happyReduce_1

action_35 (15) = happyShift action_60
action_35 (16) = happyShift action_61
action_35 (17) = happyShift action_62
action_35 (18) = happyShift action_63
action_35 (19) = happyShift action_64
action_35 (20) = happyShift action_65
action_35 (21) = happyShift action_66
action_35 (22) = happyShift action_67
action_35 (36) = happyShift action_69
action_35 (37) = happyShift action_70
action_35 (45) = happyShift action_84
action_35 _ = happyFail (happyExpListPerState 35)

action_36 _ = happyReduce_26

action_37 _ = happyReduce_25

action_38 (13) = happyShift action_36
action_38 (14) = happyShift action_37
action_38 (19) = happyShift action_38
action_38 (20) = happyShift action_39
action_38 (25) = happyShift action_51
action_38 (29) = happyShift action_41
action_38 (30) = happyShift action_42
action_38 (31) = happyShift action_43
action_38 (32) = happyShift action_44
action_38 (33) = happyShift action_45
action_38 (34) = happyShift action_46
action_38 (35) = happyShift action_47
action_38 (38) = happyShift action_48
action_38 (9) = happyGoto action_83
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (13) = happyShift action_36
action_39 (14) = happyShift action_37
action_39 (19) = happyShift action_38
action_39 (20) = happyShift action_39
action_39 (25) = happyShift action_51
action_39 (29) = happyShift action_41
action_39 (30) = happyShift action_42
action_39 (31) = happyShift action_43
action_39 (32) = happyShift action_44
action_39 (33) = happyShift action_45
action_39 (34) = happyShift action_46
action_39 (35) = happyShift action_47
action_39 (38) = happyShift action_48
action_39 (9) = happyGoto action_82
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (13) = happyShift action_36
action_40 (14) = happyShift action_37
action_40 (19) = happyShift action_38
action_40 (20) = happyShift action_39
action_40 (25) = happyShift action_51
action_40 (29) = happyShift action_41
action_40 (30) = happyShift action_42
action_40 (31) = happyShift action_43
action_40 (32) = happyShift action_44
action_40 (33) = happyShift action_45
action_40 (34) = happyShift action_46
action_40 (35) = happyShift action_47
action_40 (38) = happyShift action_48
action_40 (9) = happyGoto action_81
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_27

action_42 _ = happyReduce_28

action_43 (13) = happyShift action_36
action_43 (14) = happyShift action_37
action_43 (19) = happyShift action_38
action_43 (20) = happyShift action_39
action_43 (25) = happyShift action_51
action_43 (29) = happyShift action_41
action_43 (30) = happyShift action_42
action_43 (31) = happyShift action_43
action_43 (32) = happyShift action_44
action_43 (33) = happyShift action_45
action_43 (34) = happyShift action_46
action_43 (35) = happyShift action_47
action_43 (38) = happyShift action_48
action_43 (9) = happyGoto action_80
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (13) = happyShift action_36
action_44 (14) = happyShift action_37
action_44 (19) = happyShift action_38
action_44 (20) = happyShift action_39
action_44 (25) = happyShift action_51
action_44 (29) = happyShift action_41
action_44 (30) = happyShift action_42
action_44 (31) = happyShift action_43
action_44 (32) = happyShift action_44
action_44 (33) = happyShift action_45
action_44 (34) = happyShift action_46
action_44 (35) = happyShift action_47
action_44 (38) = happyShift action_48
action_44 (9) = happyGoto action_79
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (13) = happyShift action_36
action_45 (14) = happyShift action_37
action_45 (19) = happyShift action_38
action_45 (20) = happyShift action_39
action_45 (25) = happyShift action_51
action_45 (29) = happyShift action_41
action_45 (30) = happyShift action_42
action_45 (31) = happyShift action_43
action_45 (32) = happyShift action_44
action_45 (33) = happyShift action_45
action_45 (34) = happyShift action_46
action_45 (35) = happyShift action_47
action_45 (38) = happyShift action_48
action_45 (9) = happyGoto action_78
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (13) = happyShift action_36
action_46 (14) = happyShift action_37
action_46 (19) = happyShift action_38
action_46 (20) = happyShift action_39
action_46 (25) = happyShift action_51
action_46 (29) = happyShift action_41
action_46 (30) = happyShift action_42
action_46 (31) = happyShift action_43
action_46 (32) = happyShift action_44
action_46 (33) = happyShift action_45
action_46 (34) = happyShift action_46
action_46 (35) = happyShift action_47
action_46 (38) = happyShift action_48
action_46 (9) = happyGoto action_77
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (13) = happyShift action_36
action_47 (14) = happyShift action_37
action_47 (19) = happyShift action_38
action_47 (20) = happyShift action_39
action_47 (25) = happyShift action_51
action_47 (29) = happyShift action_41
action_47 (30) = happyShift action_42
action_47 (31) = happyShift action_43
action_47 (32) = happyShift action_44
action_47 (33) = happyShift action_45
action_47 (34) = happyShift action_46
action_47 (35) = happyShift action_47
action_47 (38) = happyShift action_48
action_47 (9) = happyGoto action_76
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (13) = happyShift action_36
action_48 (14) = happyShift action_37
action_48 (19) = happyShift action_38
action_48 (20) = happyShift action_39
action_48 (25) = happyShift action_51
action_48 (29) = happyShift action_41
action_48 (30) = happyShift action_42
action_48 (31) = happyShift action_43
action_48 (32) = happyShift action_44
action_48 (33) = happyShift action_45
action_48 (34) = happyShift action_46
action_48 (35) = happyShift action_47
action_48 (38) = happyShift action_48
action_48 (9) = happyGoto action_75
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (13) = happyShift action_36
action_49 (14) = happyShift action_37
action_49 (19) = happyShift action_38
action_49 (20) = happyShift action_39
action_49 (25) = happyShift action_51
action_49 (29) = happyShift action_41
action_49 (30) = happyShift action_42
action_49 (31) = happyShift action_43
action_49 (32) = happyShift action_44
action_49 (33) = happyShift action_45
action_49 (34) = happyShift action_46
action_49 (35) = happyShift action_47
action_49 (38) = happyShift action_48
action_49 (9) = happyGoto action_74
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (15) = happyShift action_60
action_50 (16) = happyShift action_61
action_50 (17) = happyShift action_62
action_50 (18) = happyShift action_63
action_50 (19) = happyShift action_64
action_50 (20) = happyShift action_65
action_50 (21) = happyShift action_66
action_50 (22) = happyShift action_67
action_50 (26) = happyShift action_73
action_50 (36) = happyShift action_69
action_50 (37) = happyShift action_70
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (13) = happyShift action_36
action_51 (14) = happyShift action_37
action_51 (19) = happyShift action_38
action_51 (20) = happyShift action_39
action_51 (25) = happyShift action_51
action_51 (29) = happyShift action_41
action_51 (30) = happyShift action_42
action_51 (31) = happyShift action_43
action_51 (32) = happyShift action_44
action_51 (33) = happyShift action_45
action_51 (34) = happyShift action_46
action_51 (35) = happyShift action_47
action_51 (38) = happyShift action_48
action_51 (9) = happyGoto action_72
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (15) = happyShift action_60
action_52 (16) = happyShift action_61
action_52 (17) = happyShift action_62
action_52 (18) = happyShift action_63
action_52 (19) = happyShift action_64
action_52 (20) = happyShift action_65
action_52 (21) = happyShift action_66
action_52 (22) = happyShift action_67
action_52 (26) = happyShift action_71
action_52 (36) = happyShift action_69
action_52 (37) = happyShift action_70
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (15) = happyShift action_60
action_53 (16) = happyShift action_61
action_53 (17) = happyShift action_62
action_53 (18) = happyShift action_63
action_53 (19) = happyShift action_64
action_53 (20) = happyShift action_65
action_53 (21) = happyShift action_66
action_53 (22) = happyShift action_67
action_53 (26) = happyShift action_68
action_53 (36) = happyShift action_69
action_53 (37) = happyShift action_70
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (13) = happyShift action_36
action_54 (14) = happyShift action_37
action_54 (19) = happyShift action_38
action_54 (20) = happyShift action_39
action_54 (25) = happyShift action_51
action_54 (29) = happyShift action_41
action_54 (30) = happyShift action_42
action_54 (31) = happyShift action_43
action_54 (32) = happyShift action_44
action_54 (33) = happyShift action_45
action_54 (34) = happyShift action_46
action_54 (35) = happyShift action_47
action_54 (38) = happyShift action_48
action_54 (9) = happyGoto action_59
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_4

action_56 (13) = happyShift action_36
action_56 (14) = happyShift action_37
action_56 (19) = happyShift action_38
action_56 (20) = happyShift action_39
action_56 (25) = happyShift action_51
action_56 (29) = happyShift action_41
action_56 (30) = happyShift action_42
action_56 (31) = happyShift action_43
action_56 (32) = happyShift action_44
action_56 (33) = happyShift action_45
action_56 (34) = happyShift action_46
action_56 (35) = happyShift action_47
action_56 (38) = happyShift action_48
action_56 (9) = happyGoto action_58
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_6

action_58 (15) = happyShift action_60
action_58 (16) = happyShift action_61
action_58 (17) = happyShift action_62
action_58 (18) = happyShift action_63
action_58 (19) = happyShift action_64
action_58 (20) = happyShift action_65
action_58 (21) = happyShift action_66
action_58 (22) = happyShift action_67
action_58 (36) = happyShift action_69
action_58 (37) = happyShift action_70
action_58 (45) = happyShift action_102
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (15) = happyShift action_60
action_59 (16) = happyShift action_61
action_59 (17) = happyShift action_62
action_59 (18) = happyShift action_63
action_59 (19) = happyShift action_64
action_59 (20) = happyShift action_65
action_59 (21) = happyShift action_66
action_59 (22) = happyShift action_67
action_59 (36) = happyShift action_69
action_59 (37) = happyShift action_70
action_59 (45) = happyShift action_101
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (13) = happyShift action_36
action_60 (14) = happyShift action_37
action_60 (19) = happyShift action_38
action_60 (20) = happyShift action_39
action_60 (25) = happyShift action_51
action_60 (29) = happyShift action_41
action_60 (30) = happyShift action_42
action_60 (31) = happyShift action_43
action_60 (32) = happyShift action_44
action_60 (33) = happyShift action_45
action_60 (34) = happyShift action_46
action_60 (35) = happyShift action_47
action_60 (38) = happyShift action_48
action_60 (9) = happyGoto action_100
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (13) = happyShift action_36
action_61 (14) = happyShift action_37
action_61 (19) = happyShift action_38
action_61 (20) = happyShift action_39
action_61 (25) = happyShift action_51
action_61 (29) = happyShift action_41
action_61 (30) = happyShift action_42
action_61 (31) = happyShift action_43
action_61 (32) = happyShift action_44
action_61 (33) = happyShift action_45
action_61 (34) = happyShift action_46
action_61 (35) = happyShift action_47
action_61 (38) = happyShift action_48
action_61 (9) = happyGoto action_99
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (13) = happyShift action_36
action_62 (14) = happyShift action_37
action_62 (19) = happyShift action_38
action_62 (20) = happyShift action_39
action_62 (25) = happyShift action_51
action_62 (29) = happyShift action_41
action_62 (30) = happyShift action_42
action_62 (31) = happyShift action_43
action_62 (32) = happyShift action_44
action_62 (33) = happyShift action_45
action_62 (34) = happyShift action_46
action_62 (35) = happyShift action_47
action_62 (38) = happyShift action_48
action_62 (9) = happyGoto action_98
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (13) = happyShift action_36
action_63 (14) = happyShift action_37
action_63 (19) = happyShift action_38
action_63 (20) = happyShift action_39
action_63 (25) = happyShift action_51
action_63 (29) = happyShift action_41
action_63 (30) = happyShift action_42
action_63 (31) = happyShift action_43
action_63 (32) = happyShift action_44
action_63 (33) = happyShift action_45
action_63 (34) = happyShift action_46
action_63 (35) = happyShift action_47
action_63 (38) = happyShift action_48
action_63 (9) = happyGoto action_97
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (13) = happyShift action_36
action_64 (14) = happyShift action_37
action_64 (19) = happyShift action_38
action_64 (20) = happyShift action_39
action_64 (25) = happyShift action_51
action_64 (29) = happyShift action_41
action_64 (30) = happyShift action_42
action_64 (31) = happyShift action_43
action_64 (32) = happyShift action_44
action_64 (33) = happyShift action_45
action_64 (34) = happyShift action_46
action_64 (35) = happyShift action_47
action_64 (38) = happyShift action_48
action_64 (9) = happyGoto action_96
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (13) = happyShift action_36
action_65 (14) = happyShift action_37
action_65 (19) = happyShift action_38
action_65 (20) = happyShift action_39
action_65 (25) = happyShift action_51
action_65 (29) = happyShift action_41
action_65 (30) = happyShift action_42
action_65 (31) = happyShift action_43
action_65 (32) = happyShift action_44
action_65 (33) = happyShift action_45
action_65 (34) = happyShift action_46
action_65 (35) = happyShift action_47
action_65 (38) = happyShift action_48
action_65 (9) = happyGoto action_95
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (13) = happyShift action_36
action_66 (14) = happyShift action_37
action_66 (19) = happyShift action_38
action_66 (20) = happyShift action_39
action_66 (25) = happyShift action_51
action_66 (29) = happyShift action_41
action_66 (30) = happyShift action_42
action_66 (31) = happyShift action_43
action_66 (32) = happyShift action_44
action_66 (33) = happyShift action_45
action_66 (34) = happyShift action_46
action_66 (35) = happyShift action_47
action_66 (38) = happyShift action_48
action_66 (9) = happyGoto action_94
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (13) = happyShift action_36
action_67 (14) = happyShift action_37
action_67 (19) = happyShift action_38
action_67 (20) = happyShift action_39
action_67 (25) = happyShift action_51
action_67 (29) = happyShift action_41
action_67 (30) = happyShift action_42
action_67 (31) = happyShift action_43
action_67 (32) = happyShift action_44
action_67 (33) = happyShift action_45
action_67 (34) = happyShift action_46
action_67 (35) = happyShift action_47
action_67 (38) = happyShift action_48
action_67 (9) = happyGoto action_93
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (55) = happyShift action_92
action_68 _ = happyReduce_41

action_69 (13) = happyShift action_36
action_69 (14) = happyShift action_37
action_69 (19) = happyShift action_38
action_69 (20) = happyShift action_39
action_69 (25) = happyShift action_51
action_69 (29) = happyShift action_41
action_69 (30) = happyShift action_42
action_69 (31) = happyShift action_43
action_69 (32) = happyShift action_44
action_69 (33) = happyShift action_45
action_69 (34) = happyShift action_46
action_69 (35) = happyShift action_47
action_69 (38) = happyShift action_48
action_69 (9) = happyGoto action_91
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (13) = happyShift action_36
action_70 (14) = happyShift action_37
action_70 (19) = happyShift action_38
action_70 (20) = happyShift action_39
action_70 (25) = happyShift action_51
action_70 (29) = happyShift action_41
action_70 (30) = happyShift action_42
action_70 (31) = happyShift action_43
action_70 (32) = happyShift action_44
action_70 (33) = happyShift action_45
action_70 (34) = happyShift action_46
action_70 (35) = happyShift action_47
action_70 (38) = happyShift action_48
action_70 (9) = happyGoto action_90
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (45) = happyShift action_89
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (15) = happyShift action_60
action_72 (16) = happyShift action_61
action_72 (17) = happyShift action_62
action_72 (18) = happyShift action_63
action_72 (19) = happyShift action_64
action_72 (20) = happyShift action_65
action_72 (21) = happyShift action_66
action_72 (22) = happyShift action_67
action_72 (26) = happyShift action_88
action_72 (36) = happyShift action_69
action_72 (37) = happyShift action_70
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (42) = happyShift action_87
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (15) = happyShift action_60
action_74 (16) = happyShift action_61
action_74 (17) = happyShift action_62
action_74 (18) = happyShift action_63
action_74 (19) = happyShift action_64
action_74 (20) = happyShift action_65
action_74 (21) = happyShift action_66
action_74 (22) = happyShift action_67
action_74 (36) = happyShift action_69
action_74 (37) = happyShift action_70
action_74 (40) = happyShift action_86
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (15) = happyShift action_60
action_75 (16) = happyShift action_61
action_75 (17) = happyShift action_62
action_75 (18) = happyShift action_63
action_75 (19) = happyShift action_64
action_75 (20) = happyShift action_65
action_75 (21) = happyShift action_66
action_75 (22) = happyShift action_67
action_75 (36) = happyShift action_69
action_75 (37) = happyShift action_70
action_75 _ = happyReduce_29

action_76 (15) = happyShift action_60
action_76 (16) = happyShift action_61
action_76 (17) = happyShift action_62
action_76 (18) = happyShift action_63
action_76 (19) = happyShift action_64
action_76 (20) = happyShift action_65
action_76 (21) = happyShift action_66
action_76 (22) = happyShift action_67
action_76 (36) = happyShift action_69
action_76 (37) = happyShift action_70
action_76 _ = happyReduce_18

action_77 (15) = happyShift action_60
action_77 (16) = happyShift action_61
action_77 (17) = happyShift action_62
action_77 (18) = happyShift action_63
action_77 (19) = happyShift action_64
action_77 (20) = happyShift action_65
action_77 (21) = happyShift action_66
action_77 (22) = happyShift action_67
action_77 (36) = happyShift action_69
action_77 (37) = happyShift action_70
action_77 _ = happyReduce_19

action_78 (15) = happyShift action_60
action_78 (16) = happyShift action_61
action_78 (17) = happyShift action_62
action_78 (18) = happyShift action_63
action_78 (19) = happyShift action_64
action_78 (20) = happyShift action_65
action_78 (21) = happyShift action_66
action_78 (22) = happyShift action_67
action_78 (36) = happyShift action_69
action_78 (37) = happyShift action_70
action_78 _ = happyReduce_17

action_79 (15) = happyShift action_60
action_79 (16) = happyShift action_61
action_79 (17) = happyShift action_62
action_79 (18) = happyShift action_63
action_79 (19) = happyShift action_64
action_79 (20) = happyShift action_65
action_79 (21) = happyShift action_66
action_79 (22) = happyShift action_67
action_79 (36) = happyShift action_69
action_79 (37) = happyShift action_70
action_79 _ = happyReduce_16

action_80 (15) = happyShift action_60
action_80 (16) = happyShift action_61
action_80 (17) = happyShift action_62
action_80 (18) = happyShift action_63
action_80 (19) = happyShift action_64
action_80 (20) = happyShift action_65
action_80 (21) = happyShift action_66
action_80 (22) = happyShift action_67
action_80 (36) = happyShift action_69
action_80 (37) = happyShift action_70
action_80 _ = happyReduce_15

action_81 (15) = happyShift action_60
action_81 (16) = happyShift action_61
action_81 (17) = happyShift action_62
action_81 (18) = happyShift action_63
action_81 (19) = happyShift action_64
action_81 (20) = happyShift action_65
action_81 (21) = happyShift action_66
action_81 (22) = happyShift action_67
action_81 (26) = happyShift action_85
action_81 (36) = happyShift action_69
action_81 (37) = happyShift action_70
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (21) = happyShift action_66
action_82 (22) = happyShift action_67
action_82 (36) = happyShift action_69
action_82 (37) = happyShift action_70
action_82 _ = happyReduce_14

action_83 (21) = happyShift action_66
action_83 (22) = happyShift action_67
action_83 (36) = happyShift action_69
action_83 (37) = happyShift action_70
action_83 _ = happyReduce_13

action_84 _ = happyReduce_40

action_85 (45) = happyShift action_106
action_85 _ = happyReduce_24

action_86 (13) = happyShift action_36
action_86 (14) = happyShift action_37
action_86 (19) = happyShift action_38
action_86 (20) = happyShift action_39
action_86 (25) = happyShift action_51
action_86 (29) = happyShift action_41
action_86 (30) = happyShift action_42
action_86 (31) = happyShift action_43
action_86 (32) = happyShift action_44
action_86 (33) = happyShift action_45
action_86 (34) = happyShift action_46
action_86 (35) = happyShift action_47
action_86 (38) = happyShift action_48
action_86 (9) = happyGoto action_105
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (27) = happyShift action_104
action_87 _ = happyFail (happyExpListPerState 87)

action_88 _ = happyReduce_24

action_89 _ = happyReduce_42

action_90 (15) = happyShift action_60
action_90 (16) = happyShift action_61
action_90 (17) = happyShift action_62
action_90 (18) = happyShift action_63
action_90 (19) = happyShift action_64
action_90 (20) = happyShift action_65
action_90 (21) = happyShift action_66
action_90 (22) = happyShift action_67
action_90 (36) = happyShift action_69
action_90 (37) = happyShift action_70
action_90 _ = happyReduce_35

action_91 (15) = happyShift action_60
action_91 (16) = happyShift action_61
action_91 (17) = happyShift action_62
action_91 (18) = happyShift action_63
action_91 (19) = happyShift action_64
action_91 (20) = happyShift action_65
action_91 (21) = happyShift action_66
action_91 (22) = happyShift action_67
action_91 (36) = happyShift action_69
action_91 (37) = happyShift action_70
action_91 _ = happyReduce_34

action_92 (27) = happyShift action_103
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (36) = happyShift action_69
action_93 (37) = happyShift action_70
action_93 _ = happyReduce_20

action_94 (36) = happyShift action_69
action_94 (37) = happyShift action_70
action_94 _ = happyReduce_23

action_95 (21) = happyShift action_66
action_95 (22) = happyShift action_67
action_95 (36) = happyShift action_69
action_95 (37) = happyShift action_70
action_95 _ = happyReduce_21

action_96 (21) = happyShift action_66
action_96 (22) = happyShift action_67
action_96 (36) = happyShift action_69
action_96 (37) = happyShift action_70
action_96 _ = happyReduce_22

action_97 (15) = happyFail []
action_97 (16) = happyFail []
action_97 (17) = happyFail []
action_97 (18) = happyFail []
action_97 (19) = happyShift action_64
action_97 (20) = happyShift action_65
action_97 (21) = happyShift action_66
action_97 (22) = happyShift action_67
action_97 (36) = happyShift action_69
action_97 (37) = happyShift action_70
action_97 _ = happyReduce_33

action_98 (15) = happyFail []
action_98 (16) = happyFail []
action_98 (17) = happyFail []
action_98 (18) = happyFail []
action_98 (19) = happyShift action_64
action_98 (20) = happyShift action_65
action_98 (21) = happyShift action_66
action_98 (22) = happyShift action_67
action_98 (36) = happyShift action_69
action_98 (37) = happyShift action_70
action_98 _ = happyReduce_32

action_99 (15) = happyFail []
action_99 (16) = happyFail []
action_99 (17) = happyFail []
action_99 (18) = happyFail []
action_99 (19) = happyShift action_64
action_99 (20) = happyShift action_65
action_99 (21) = happyShift action_66
action_99 (22) = happyShift action_67
action_99 (36) = happyShift action_69
action_99 (37) = happyShift action_70
action_99 _ = happyReduce_31

action_100 (15) = happyFail []
action_100 (16) = happyFail []
action_100 (17) = happyFail []
action_100 (18) = happyFail []
action_100 (19) = happyShift action_64
action_100 (20) = happyShift action_65
action_100 (21) = happyShift action_66
action_100 (22) = happyShift action_67
action_100 (36) = happyShift action_69
action_100 (37) = happyShift action_70
action_100 _ = happyReduce_30

action_101 _ = happyReduce_5

action_102 _ = happyReduce_7

action_103 (14) = happyShift action_13
action_103 (39) = happyShift action_14
action_103 (41) = happyShift action_15
action_103 (43) = happyShift action_4
action_103 (53) = happyShift action_16
action_103 (54) = happyShift action_17
action_103 (6) = happyGoto action_10
action_103 (10) = happyGoto action_109
action_103 (11) = happyGoto action_12
action_103 _ = happyReduce_36

action_104 (14) = happyShift action_13
action_104 (39) = happyShift action_14
action_104 (41) = happyShift action_15
action_104 (43) = happyShift action_4
action_104 (53) = happyShift action_16
action_104 (54) = happyShift action_17
action_104 (6) = happyGoto action_10
action_104 (10) = happyGoto action_108
action_104 (11) = happyGoto action_12
action_104 _ = happyReduce_36

action_105 (15) = happyShift action_60
action_105 (16) = happyShift action_61
action_105 (17) = happyShift action_62
action_105 (18) = happyShift action_63
action_105 (19) = happyShift action_64
action_105 (20) = happyShift action_65
action_105 (21) = happyShift action_66
action_105 (22) = happyShift action_67
action_105 (36) = happyShift action_69
action_105 (37) = happyShift action_70
action_105 (42) = happyShift action_107
action_105 _ = happyFail (happyExpListPerState 105)

action_106 _ = happyReduce_39

action_107 (27) = happyShift action_112
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (28) = happyShift action_111
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (28) = happyShift action_110
action_109 _ = happyFail (happyExpListPerState 109)

action_110 _ = happyReduce_43

action_111 _ = happyReduce_44

action_112 (14) = happyShift action_13
action_112 (39) = happyShift action_14
action_112 (41) = happyShift action_15
action_112 (43) = happyShift action_4
action_112 (53) = happyShift action_16
action_112 (54) = happyShift action_17
action_112 (6) = happyGoto action_10
action_112 (10) = happyGoto action_113
action_112 (11) = happyGoto action_12
action_112 _ = happyReduce_36

action_113 (28) = happyShift action_114
action_113 _ = happyFail (happyExpListPerState 113)

action_114 _ = happyReduce_45

happyReduce_1 = happyReduce 4 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_0  5 happyReduction_2
happyReduction_2  =  HappyAbsSyn5
		 ([]
	)

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1:happy_var_2
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 5 6 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Token _ (TokenID happy_var_2))) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (VarDef1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 7 6 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Token _ (TokenID happy_var_2))) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (VarDef2 happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 5 6 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (VarDefList1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 7 6 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (VarDefList2 happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_1  7 happyReduction_8
happyReduction_8 _
	 =  HappyAbsSyn7
		 (BOOL
	)

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn7
		 (REAL
	)

happyReduce_10 = happySpecReduce_1  7 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn7
		 (CONST
	)

happyReduce_11 = happySpecReduce_1  8 happyReduction_11
happyReduction_11 (HappyTerminal (Token _ (TokenID happy_var_1)))
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  8 happyReduction_12
happyReduction_12 (HappyAbsSyn8  happy_var_3)
	_
	(HappyTerminal (Token _ (TokenID happy_var_1)))
	 =  HappyAbsSyn8
		 (happy_var_1:happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  9 happyReduction_13
happyReduction_13 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (happy_var_2
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  9 happyReduction_14
happyReduction_14 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Op1 "-" happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  9 happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Op1 "sqrt" happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  9 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Op1 "ln" happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  9 happyReduction_17
happyReduction_17 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Op1 "sin" happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  9 happyReduction_18
happyReduction_18 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Op1 "cos" happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  9 happyReduction_19
happyReduction_19 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Op1 "exp" happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  9 happyReduction_20
happyReduction_20 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Op2 "/" happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  9 happyReduction_21
happyReduction_21 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Op2 "-" happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  9 happyReduction_22
happyReduction_22 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Op2 "+" happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  9 happyReduction_23
happyReduction_23 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Op2 "*" happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  9 happyReduction_24
happyReduction_24 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (happy_var_2
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  9 happyReduction_25
happyReduction_25 (HappyTerminal (Token _ (TokenID happy_var_1)))
	 =  HappyAbsSyn9
		 (Var happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  9 happyReduction_26
happyReduction_26 (HappyTerminal (Token _ (TokenFloat happy_var_1)))
	 =  HappyAbsSyn9
		 (Real happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  9 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn9
		 (True_C
	)

happyReduce_28 = happySpecReduce_1  9 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn9
		 (False_C
	)

happyReduce_29 = happySpecReduce_2  9 happyReduction_29
happyReduction_29 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Not happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  9 happyReduction_30
happyReduction_30 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Comp "<" happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  9 happyReduction_31
happyReduction_31 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Comp ">" happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  9 happyReduction_32
happyReduction_32 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Comp "<=" happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  9 happyReduction_33
happyReduction_33 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Comp ">=" happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  9 happyReduction_34
happyReduction_34 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (OpB "AND" happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  9 happyReduction_35
happyReduction_35 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (OpB "OR" happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_0  10 happyReduction_36
happyReduction_36  =  HappyAbsSyn10
		 ([]
	)

happyReduce_37 = happySpecReduce_2  10 happyReduction_37
happyReduction_37 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1:happy_var_2
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  11 happyReduction_38
happyReduction_38 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 (VariableDefinition happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happyReduce 6 11 happyReduction_39
happyReduction_39 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Token _ (TokenID happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Assign happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_40 = happyReduce 4 11 happyReduction_40
happyReduction_40 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Token _ (TokenID happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Assign happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_41 = happyReduce 4 11 happyReduction_41
happyReduction_41 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Write happy_var_3
	) `HappyStk` happyRest

happyReduce_42 = happyReduce 5 11 happyReduction_42
happyReduction_42 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Write happy_var_3
	) `HappyStk` happyRest

happyReduce_43 = happyReduce 8 11 happyReduction_43
happyReduction_43 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (If happy_var_3 happy_var_7
	) `HappyStk` happyRest

happyReduce_44 = happyReduce 8 11 happyReduction_44
happyReduction_44 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (While happy_var_3 happy_var_7
	) `HappyStk` happyRest

happyReduce_45 = happyReduce 10 11 happyReduction_45
happyReduction_45 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Token _ (TokenID happy_var_2))) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (For happy_var_2 happy_var_4 happy_var_6 happy_var_9
	) `HappyStk` happyRest

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	Token _ TokenEOF -> action 56 56 tk (HappyState action) sts stk;
	Token _ (TokenInt happy_dollar_dollar) -> cont 12;
	Token _ (TokenFloat happy_dollar_dollar) -> cont 13;
	Token _ (TokenID happy_dollar_dollar) -> cont 14;
	Token _ (TokenOp "<") -> cont 15;
	Token _ (TokenOp ">") -> cont 16;
	Token _ (TokenOp "<=") -> cont 17;
	Token _ (TokenOp ">=") -> cont 18;
	Token _ (TokenOp "+") -> cont 19;
	Token _ (TokenOp "-") -> cont 20;
	Token _ (TokenOp "*") -> cont 21;
	Token _ (TokenOp "/") -> cont 22;
	Token _ (TokenOp "=") -> cont 23;
	Token _ (TokenOp ":=") -> cont 24;
	Token _ (TokenK  "(") -> cont 25;
	Token _ (TokenK  ")") -> cont 26;
	Token _ (TokenK "begin") -> cont 27;
	Token _ (TokenK "end") -> cont 28;
	Token _ (TokenK "true") -> cont 29;
	Token _ (TokenK "false") -> cont 30;
	Token _ (TokenK "sqrt") -> cont 31;
	Token _ (TokenK "ln") -> cont 32;
	Token _ (TokenK "sin") -> cont 33;
	Token _ (TokenK "exp") -> cont 34;
	Token _ (TokenK "false") -> cont 35;
	Token _ (TokenK "AND") -> cont 36;
	Token _ (TokenK "OR") -> cont 37;
	Token _ (TokenK "not") -> cont 38;
	Token _ (TokenK "for") -> cont 39;
	Token _ (TokenK "to") -> cont 40;
	Token _ (TokenK "while") -> cont 41;
	Token _ (TokenK "do") -> cont 42;
	Token _ (TokenK "var") -> cont 43;
	Token _ (TokenK ":") -> cont 44;
	Token _ (TokenK ";") -> cont 45;
	Token _ (TokenK "boolean") -> cont 46;
	Token _ (TokenK "real") -> cont 47;
	Token _ (TokenK "const") -> cont 48;
	Token _ (TokenK "string") -> cont 49;
	Token _ (TokenK ",") -> cont 50;
	Token _ (TokenK "ID_List") -> cont 51;
	Token _ (TokenK "program") -> cont 52;
	Token _ (TokenK "writeln") -> cont 53;
	Token _ (TokenK "if") -> cont 54;
	Token _ (TokenK "then") -> cont 55;
	_ -> happyError' (tk, [])
	})

happyError_ explist 56 tk = happyError' (tk, explist)
happyError_ explist _ tk = happyError' (tk, explist)

happyThen :: () => Parser a -> (a -> Parser b) -> Parser b
happyThen = (thenP)
happyReturn :: () => a -> Parser a
happyReturn = (returnP)
happyThen1 :: () => Parser a -> (a -> Parser b) -> Parser b
happyThen1 = happyThen
happyReturn1 :: () => a -> Parser a
happyReturn1 = happyReturn
happyError' :: () => ((Token), [String]) -> Parser a
happyError' tk = (\(tokens, explist) -> happyError) tk
happyParser = happySomeParser where
 happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq



{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "D:/GitHub/haskell-platform/build/ghc-bindist/local/lib/include/ghcversion.h" #-}















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "F:/Users/randy/AppData/Local/Temp/ghc1900_0/ghc_2.h" #-}


























































































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates\\\\GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 75 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 84 "templates\\\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 147 "templates\\\\GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates\\\\GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







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

{-# LINE 333 "templates\\\\GenericTemplate.hs" #-}
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
