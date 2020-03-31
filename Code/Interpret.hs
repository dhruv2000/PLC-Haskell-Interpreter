module Interpret 
(
    interpret,
    interpretStart,
    unOp1,
    biOp2,
    bibOp1,
    bibOp2,
    relBiOp,
    expression,

)
where

import Data
import Data.Maybe (isNothing)
import qualified Data.Map.Strict as Map
import Debug.Trace
import Data.Either(fromRight)
import Data.Either(fromLeft)

-- TODO: define auxiliary functions to aid interpretation
-- Feel free to put them here or in different modules
-- Hint: write separate evaluators for numeric and
-- boolean expressions and for statements


--THIS IS LIKELY WHERE YOU WILL INTERPRET THE INFO

--THis is called by intExp

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



interpret :: Program -> String;
-- Initiates interpreting with an empty global scope
interpret [] = "";
interpret x = interpretStart x [Map.empty]

--Starting point after getting a global scope
interpretStart :: Program -> [Map.Map String (String, String)] -> String
interpretStart [] m = ""
interpretStart (x:xs) m = let curr = interpretStatement x m in
      (fst curr) ++ (interpretStart xs (snd curr))

-- Variable name, (variable type, variable value being assigned)
interpretStatement :: Statement -> [Map.Map String (String, String)] -> (String, [Map.Map String (String, String)])
interpretStatement (Write a) m = 
    let evaluated = evalExpression a m in
        case evaluated of 
            Left real -> ("writeln: >> " ++ real ++ "\n", m)
            Right bool -> ("writeln: >> " ++ bool ++ "\n", m)   
        
        -- trace ("e is " ++ evaluated) (evaluated ++ "\n", m) 

interpretStatement (Assign a b) maps = 
    let evaluated = evalExpression b maps in
        case evaluated of
            Left real -> (a ++ " is assigned REAL to " ++ real ++ "\n", Map.insert a ("real", real) (head maps) : tail maps)
            Right bool -> (a ++ " is assigned BOOL to " ++ bool ++ "\n", Map.insert a ("boolean", bool) (head maps) : tail maps)


-- Variable name, (variable type, variable value being assigned)
-- Need to do them for add subtrac, etc

--This returns a float or a bool depending on the passed in thing

-- This either statement is two strings that represent real and boolean
evalExpression :: Exp -> [Map.Map String (String, String)] -> Either String String
evalExpression (Real x) m = Left (show x);
evalExpression (Var s) [m] = let f = (Map.lookup s m) in
                                case f of
                                Just f -> 
                                    case (fst f) of 
                                        "real" -> Left (snd f);
                                        "boolean" -> Right (snd f);
                                Nothing ->  error("Variable " ++ s ++ " is undefined");
evalExpression (Var s) m = let f =  (Map.lookup s (head m)) in
                                case f of
                                Just f -> 
                                    case (fst f) of 
                                        "real" -> Left (snd f);
                                        "boolean" -> Right (snd f);
                                Nothing -> evalExpression (Var s) (tail m);
evalExpression (Op2 op e1 e2) m = Left (either show show (expression (Op2 op e1 e2) m));
evalExpression (OpB op e1 e2) m = Right (either show show (expression (OpB op e1 e2) m));
evalExpression (Comp op e1 e2) m = Right (either show show (expression (Comp op e1 e2) m));
evalExpression (True_C) m = Right "True"
evalExpression (False_C) m = Right "False"



-- data Exp in data.hs
expression :: Exp -> [Map.Map String (String, String)] -> Either Float Bool
-- float Expressions
expression (Real v1) m = Left v1
expression (Op1 op e1) m = Left (unOp1 op (fromLeft 500.6969 (expression e1 m)))
expression (Op2 op e1 e2) m = (Left (biOp2 op (fromLeft 500.6969 (expression e1 m)) (fromLeft 500.6969 (expression e2 m))))
expression True_C m = Right True
expression False_C m = Right False

--boolean Expressions
expression (Not e1) m = Right (bibOp1 "NOT" (fromRight True (expression e1 m)))
expression (OpB op v1 v2) m = Right (bibOp2 op (fromRight True (expression v1 m)) (fromRight True (expression v2 m)))
expression (Comp op e1 e2) m = Right (relBiOp op (fromLeft 500.6969 (expression e1 m)) (fromLeft 500.6969 (expression e2 m)))
expression (Var s) m = let evaluated = evalVarExp s m in
        case evaluated of 
            Left real -> Left real
            Right bool -> Right bool
-- TODO FUNCTIONS HERE FUNCALL String [Exp]

-- This traverses the map and looks for the passed in string name 
evalVarExp :: String -> [Map.Map String (String, String)] -> Either Float Bool
evalVarExp s m = let f =  (Map.lookup s (head m)) in
    --------------------( type  ,  value )------------------------------
    -- f is the element ( String, String )
                                case f of
                                Just f -> 
                                    case (fst f) of 
                                        --read takes the string and makes it a float
                                        "real" -> Left (read (snd f));
                                        "boolean" -> 
                                            case (snd f) of
                                                "True" -> Right True;
                                                "False" -> Right False;
                                Nothing -> evalVarExp s (tail m);