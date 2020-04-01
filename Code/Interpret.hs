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
    -- evalDefinition,
    evalExpression,
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
relBiOp "<" b1 b2 =  (b1 < b2)
relBiOp ">" b1 b2 = b1 > b2
relBiOp "<=" b1 b2 = b1 <= b2
relBiOp ">=" b1 b2 = b1 >= b2
relBiOp "=" b1 b2 = b1 == b2




interpret :: Program -> String;
-- Initiates interpreting with an empty global scope
interpret [] = "";
interpret x = fst (interpretStart x [Map.empty])

--Starting point after getting a global scope
interpretStart :: Program -> [Map.Map String (String, String)] -> (String, [Map.Map String (String, String)])
interpretStart [] m = trace "booop" ("", [Map.empty])
interpretStart [x] m = interpretStatement x m
interpretStart (x:xs) m = let curr = interpretStatement x m
                              next = interpretStart xs (snd curr) in
      ((fst curr) ++ (fst next), (snd next))

-- Variable name, (variable type, variable value being assigned)
interpretStatement :: Statement -> [Map.Map String (String, String)] -> (String, [Map.Map String (String, String)])
interpretStatement (Write a) m =
    let evaluated = evalExpression a m in
        case evaluated of
            Left real -> ("writeln: >> " ++ real ++ "\n", m)
            Right bool -> ("writeln: >> " ++ bool ++ "\n", m)

interpretStatement (Assign a b) maps =
    let evaluated = evalExpression b maps in
        case evaluated of
            Left real -> (a ++ " is assigned REAL to " ++ real ++ "\n", [Map.insert a ("real", real) (head maps)])
            Right bool -> (a ++ " is assigned BOOL to " ++ bool ++ "\n", Map.insert a ("boolean", bool) (head maps) : tail maps)

interpretStatement (If a b c) maps = 
   let evaluated = expression a maps in
       case evaluated of
           Right bool -> 
                case bool of
                    True -> interpretStatement b maps
                    -- Else statement -- needs tweaking
                    False -> case c of 
                        Nothing -> ("", (maps))
                        Just d -> interpretStatement d maps

interpretStatement (While a b) maps = 
        let evaluated = (expression a maps) in
            case evaluated of
                Right bool ->
                    case bool of
                        True -> let (output, newMap) = interpretStatement b maps
                                    (newOutput, newNewMap) = interpretStatement (While a b) newMap in
                                        (output ++ newOutput, maps)
                        False -> ("empty", maps)
                Left real -> ("not bool", maps)

interpretStatement (Block a) maps = interpretStart a maps;

-- This should cover variable defintion
interpretStatement (VariableDefinition d) m = evalDefinition d m

-- This evaluates definitions of variables
evalDefinition :: Definition -> [Map.Map String (String, String)] -> (String, [Map.Map String (String, String)])
evalDefinition (VarDef1 s t) maps = 
        case t of
            BOOL -> (s ++ " is assigned BOOL to NOTHING\n", Map.insert s ("boolean", "") (head maps) : tail maps)
            REAL -> (s ++ " is assigned REAL to NOTHING\n", Map.insert s ("real", "") (head maps) : tail maps)

evalDefinition (VarDef2 s t e) maps = 
        let evaluated = evalExpression e maps in
        case evaluated of
            Left real -> (s ++ " is assigned REAL to " ++ real ++ "\n", Map.insert s ("real", real) (head maps) : tail maps)
            Right bool -> (s ++ " is assigned BOOL to " ++ bool ++ "\n", Map.insert s ("boolean", bool) (head maps) : tail maps)

    -- ((evalTraversal sList), (head maps) : tail maps)
-- case evaluated of
        --     Left real -> forM_ sList $ \s -> do
        --                     forM_ s -> (Map.insert s ("real", real) (head maps) : tail maps)
            --Right bool -> (s ++ " is assigned BOOL to " ++ bool ++ "\n", Map.insert s ("boolean", bool) (head maps) : tail maps)

--evalList :: [String] -> [Map.Map String (String, String)] -> [Map.Map String (String, String)]


-- evalTraversal :: [String] -> String
-- evalTraversal [] = ""
-- evalTraversal (x:xs) = x ++ ", " ++ (evalTraversal xs)

--TODO -- var ID_LIST : real; and for booleans
--TODO - either move on to other things, or quicckly write unit tests for the var definitions
--TODO -- figure out Const


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
expression (Comp op e1 e2) m =  Right (relBiOp op (fromLeft 500.6969 (expression e1 m)) (fromLeft 500.6969 (expression e2 m)))
expression (Var s) m = let evaluated = evalVarExp s m in
        case evaluated of 
            Left real -> Left real
            Right bool -> Right bool
-- TODO FUNCTIONS HERE FUNCALL String [Exp]

-- This traverses the map and looks for the passed in string name 
evalVarExp :: String -> [Map.Map String (String, String)] -> Either Float Bool
evalVarExp s [m] = let f = (Map.lookup s m) in
                            case f of
                                Just f -> 
                                    case (fst f) of 
                                        --read takes the string and makes it a float
                                        "real" ->  Left (read (snd f));
                                        "boolean" -> 
                                            case (snd f) of
                                                "True" -> Right True;
                                                "False" -> Right False;
                                                --This is where WHILE MESSES UP
                                Nothing -> error ("Var: " ++ s ++ " is not in the map")
evalVarExp s m = let f = (Map.lookup s (head m)) in
    --------------------( type  ,  value )------------------------------
    -- f is the element ( String, String )
                                case f of
                                Just f -> 
                                    case (fst f) of 
                                        --read takes the string and makes it a float
                                        "real" ->  Left (read (snd f));
                                        "boolean" -> 
                                            case (snd f) of
                                                "True" -> Right True;
                                                "False" -> Right False;
                                                --This is where WHILE MESSES UP
                                Nothing -> evalVarExp s (tail m);
