module Interpret 
(
    interpret,
    biOp2,
    biOp1,
    bibOp1,
    bibOp2,
    intExp
)
where

import Data

-- TODO: define auxiliary functions to aid interpretation
-- Feel free to put them here or in different modules
-- Hint: write separate evaluators for numeric and
-- boolean expressions and for statements

--THIS IS LIKELY WHERE YOU WILL INTERPRET THE INFO
biOp1 :: String -> Float -> Float
biOp1 "-" v1 = (-v1)

-- Gets called by intExp
uniOp1 :: String -> Float -> Float
uniOp1 "-" v1 = (-v1)
uniOp1 "sqrt" v1 = sqrt v1
uniOp1 "ln" v1 = log v1
uniOp1 "sin" v1 = sin v1	
uniOp1 "cos" v1 = cos v1
uniOp1 "exp" v1 = exp v1

-- Gets called by intExp
biOp2 :: String -> Float -> Float -> Float
biOp2 "+" v1 v2 = v1 + v2
biOp2 "-" v1 v2 = v1 - v2
biOp2 "*" v1 v2 = v1 * v2
biOp2 "/" v1 v2 = v1 / v2

-- data Exp in data.hs
intExp :: Exp -> Float
intExp (Real v1) = v1 
intExp (Op1 op e1) = uniOp1 op (intExp e1)
intExp (Op2 op e1 e2) = biOp2 op (intExp e1) (intExp e2)

bibOp1 :: String -> Bool -> Bool
bibOp1 "Not" True = False
bibOp1 "Not" False = True

bibOp2 :: String -> Bool -> Bool -> Bool
bibOp2 "AND" b1 b2 = b1 && b2
bibOp2 "<" b1 b2 = b1 < b2	
bibOp2 "OR" b1 b2 = b1 || b2

-- relational binary operator( takes in 2 values)
relBiOp :: String -> Float -> Float -> Bool
relBiOp "<" b1 b2 = b1 < b2
relBiOp ">" b1 b2 = b1 > b2
relBiOp "<=" b1 b2 = b1 <= b2
relBiOp ">=" b1 b2 = b1 >= b2
relBiOp "=" b1 b2 = b1 = b2

-- boolean operations for top one -- and/or
boolIntExp :: BoolExp -> Bool 
boolIntExp True_C = True
boolIntExp False_C = False
boolIntExp (Not e1) = bibOp1 "NOT" (boolIntExp e1)
boolIntExp (OpB op v1 v2) = bibOp2 op (intExp v1) (intExp v2) 
boolIntExp (Comp op e1 e2) = relBiOp op (intExp e1) (intExp e2)
-- make sure you write test unit cases for all functions

interpret :: Program -> String
-- TODO: write the interpreter
interpret _ = "Not implemented"