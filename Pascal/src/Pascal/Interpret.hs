module Interpret 
(
    interpret,
    biOp2,
    intExp
)
where

import Data

-- TODO: define auxiliary functions to aid interpretation
-- Feel free to put them here or in different modules
-- Hint: write separate evaluators for numeric and
-- boolean expressions and for statements

biOp2 :: String -> Float -> Float -> Float
biOp2 "+" v1 v2 = v1 + v2

intExp :: Exp -> Float
intExp (Op2 op e1 e2) = biOp2 op (intExp e1) (intExp e2)

-- make sure you write test unit cases for all functions

interpret :: Program -> String
-- TODO: write the interpreter
interpret _ = "Not implemented"

{-
-- inner function for foldl
-- Takes the current stack and an input and 
-- computes the next stack
evalF :: ([Val], String) -> Val -> ([Val], String)
evalF s (Id op) = evalOut op s
-- cannot run, put on the stack and preserve output
evalF (s, out) x = (x:s,out)

-- function to interpret a string into a stack and 
-- an output string
interpret :: String -> ([Val], String)
interpret text = text |>
    words |> -- brake text into words
    map strToVal |> -- strings to instructions
    foldl evalF ([], "") -- perform evaluation
-}