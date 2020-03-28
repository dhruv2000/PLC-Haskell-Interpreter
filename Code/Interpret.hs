module Interpret 
(
    interpret,
    interpretStart,
    unOp1,
    biOp2,
    bibOp1,
    bibOp2,
    intExp,
    relBiOp,
    boolIntExp

)
where

import Data
import Data.Maybe (isNothing)
import qualified Data.Map.Strict as Map
import Debug.Trace

-- TODO: define auxiliary functions to aid interpretation
-- Feel free to put them here or in different modules
-- Hint: write separate evaluators for numeric and
-- boolean expressions and for statements

evalFloatExp :: Exp -> [Map.Map String (String, String)] -> String
evalFloatExp (Real x) m = (show x);
evalFloatExp (Var s) m = if isNothing $ Map.lookup s $ head m
                                  then evalFloatExp (Var s) $ tail m
                                  else show $ Map.lookup s $ head m
evalFloatExp (Var s) [m] = if isNothing $ Map.lookup s m
                                  then error("Variable " ++ s ++ " is undefined")
                                  else show $ Map.lookup s m

--THIS IS LIKELY WHERE YOU WILL INTERPRET THE INFO

-- Gets called by intExp
unOp1 :: String -> Float -> Float
unOp1 "-" v1 = (-v1)
unOp1 "sqrt" v1 = sqrt v1
unOp1 "ln" v1 = log v1
unOp1 "sin" v1 = sin v1
unOp1 "cos" v1 = cos v1
unOp1 "exp" v1 = exp v1

-- Gets called by intExp
biOp2 :: String -> Float -> Float -> Float
biOp2 "+" v1 v2 = v1 + v2
biOp2 "-" v1 v2 = v1 - v2
biOp2 "*" v1 v2 = v1 * v2
biOp2 "/" v1 v2 = v1 / v2

-- data Exp in data.hs
intExp :: Exp -> Float
intExp (Real v1) = v1 
intExp (Op1 op e1) = unOp1 op (intExp e1)
intExp (Op2 op e1 e2) = biOp2 op (intExp e1) (intExp e2)

--Negation of the boolean
bibOp1 :: String -> Bool -> Bool
bibOp1 "NOT" True = False
bibOp1 "NOT" False = True

bibOp2 :: String -> Bool -> Bool -> Bool
bibOp2 "AND" b1 b2 = b1 && b2
bibOp2 "OR" b1 b2 = b1 || b2


-- relational binary operator( takes in 2 values)
relBiOp :: String -> Float -> Float -> Bool
relBiOp "<" b1 b2 = b1 < b2
relBiOp ">" b1 b2 = b1 > b2
relBiOp "<=" b1 b2 = b1 <= b2
relBiOp ">=" b1 b2 = b1 >= b2
relBiOp "=" b1 b2 = b1 == b2

-- boolean operations for top one -- and/or
boolIntExp :: BoolExp -> Bool 
boolIntExp True_C = True
boolIntExp False_C = False
boolIntExp (Not e1) = bibOp1 "NOT" (boolIntExp e1)
boolIntExp (OpB op v1 v2) = bibOp2 op (boolIntExp v1) (boolIntExp v2) 
boolIntExp (Comp op e1 e2) = relBiOp op (intExp e1) (intExp e2)
-- make sure you write test unit cases for all functions

interpret :: Program -> String;
-- Initiates interpreting with an empty global scope
interpret [] = "";
interpret x = interpretStart x [Map.empty]

--Starting point after gettign a global scope
interpretStart :: Program -> [Map.Map String (String, String)] -> String
interpretStart [] m = ""
interpretStart (x:xs) m = let curr = interpretStatement x m in
      (fst curr) ++ (interpretStart xs $ snd curr)

interpretStatement :: Statement -> [Map.Map String (String, String)] -> (String, [Map.Map String (String, String)])
interpretStatement (Write a) m = case a of
    FloatExp e -> let evaluated = evalFloatExp e m in
        trace ("e is " ++ evaluated) (evaluated ++ "\n", m) 
-- TODO: Add bools
interpretStatement (Assign a b) maps = case b of
    FloatExp e -> let evaluated = evalFloatExp e maps in
                   ("", Map.insert a ("Float", evaluated) (head maps) : tail maps)
