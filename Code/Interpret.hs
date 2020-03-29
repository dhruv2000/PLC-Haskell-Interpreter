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


-- Variable name, (variable type, variable value being assigned)
-- Need to do them for add subtrac, etc
evalFloatExp :: Exp -> [Map.Map String (String, String)] -> String
evalFloatExp (Real x) m = trace ("EvalFloatExp called: " ++ (show x)) (show x);
evalFloatExp (Var s) m = let f = (Map.lookup s (head m)) in
                                case f of
                                Just f -> (snd f);
                                Nothing -> evalFloatExp (Var s) (tail m);
evalFloatExp (Var s) [m] = let f = (Map.lookup s m) in
                                case f of
                                Just f -> (snd f);
                                Nothing -> error("Variable " ++ s ++ " is undefined");
evalFloatExp (Op2 op e1 e2) m = (show (intExp (Op2 op e1 e2) m));
-- evalBoolExp :: BoolExp -> [Map.Map String (String, String)] -> String
-- evalBoolExp True_C m = (show True_C);
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
intExp :: Exp -> [Map.Map String (String, String)] -> Float
-- trace ("The intExp Called: " ++ (show v1))
intExp (Real v1) m = v1
intExp (Op1 op e1) m = unOp1 op (intExp e1 m)
intExp (Op2 op e1 e2) m = biOp2 op (intExp e1 m) (intExp e2 m)
intExp (Var s) m = evalVarExp s m
-- TODO FUNCTIONS HERE FUNCALL String [Exp]

evalVarExp :: String -> [Map.Map String (String, String)] -> Float
evalVarExp s m = let f =  (Map.lookup s (head m)) in
                                case f of
                                Just f -> (read(snd f));
                                Nothing -> evalVarExp s (tail m);

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
boolIntExp :: BoolExp -> [Map.Map String (String, String)] -> Bool 
boolIntExp True_C m = True
boolIntExp False_C m = False
boolIntExp (Not e1) m = bibOp1 "NOT" (boolIntExp e1 m)
boolIntExp (OpB op v1 v2) m = bibOp2 op (boolIntExp v1 m) (boolIntExp v2 m) 
boolIntExp (Comp op e1 e2) m = relBiOp op (intExp e1 m) (intExp e2 m)
-- make sure you write test unit cases for all functions

interpret :: Program -> String;
-- Initiates interpreting with an empty global scope
interpret [] = "";
interpret x = interpretStart x [Map.empty]

--Starting point after getting a global scope
interpretStart :: Program -> [Map.Map String (String, String)] -> String
interpretStart [] m = ""
interpretStart (x:xs) m = let curr = interpretStatement x m in
      (fst curr) ++ (interpretStart xs $ snd curr)

-- Variable name, (variable type, variable value being assigned)
interpretStatement :: Statement -> [Map.Map String (String, String)] -> (String, [Map.Map String (String, String)])
interpretStatement (Write a) m = case a of
    FloatExp e -> let evaluated = evalFloatExp e m in
        ("writeln: >> " ++ evaluated ++ "\n", m)
        -- trace ("e is " ++ evaluated) (evaluated ++ "\n", m) 
        --This is something that you just added to the code 
   -- BExp e -> let evaluated = evalBoolExp e m in
        -- ("writeln: >> " ++ evaluated ++ "\n", m)
         -- trace ("e is " ++ evaluated) (evaluated ++ "\n", m) 
-- TODO: Add bools
interpretStatement (Assign a b) maps = 
    (
        case b of
            FloatExp e -> let evaluated = evalFloatExp e maps in
                (a ++ " is assigned to " ++ evaluated ++ "\n", Map.insert a ("Real", evaluated) (head maps) : tail maps)
            --BExp e -> let evaluated = evalFloatExp e maps in
              --  (a ++ " is bool to " ++ evaluated ++ "\n", Map.insert a ("Real", evaluated) (head maps) : tail maps)
    )

-- interpretDefinition :: [String] -> VType -> String
-- interpretDefinition (VarDef [s] type) = 