-- This file contains the data-structures for the AST
-- The role of the parser is to build the AST (Abstract Syntax Tree) 

module Data
    (
        Exp(..),
        Statement(..),
        VType(..),
        Definition(..),
        Program
    ) where

-- Data-structure for  numeric expressions
data Exp = 
    -- variable: e.g. Var "x"
    Var String
    -- unary operator: Op name expression
    | Op1 String Exp
    -- binary operator: Op name leftExpression rightExpression
    | Op2 String Exp Exp
    -- function call: FunctionCall name ListArguments
    | FunCall String [Exp]
    -- real value: e.g. Real 1.0
    | Real Float
    -- I don't think its necessary - but we agree on it
    | OpB String Exp Exp
    -- negation, the only unary operator
    | Not Exp
    -- comparison operator: Comp name expression expression
    | Comp String Exp Exp
    -- true and false constants
    | True_C
    | False_C

-- -- Data-structure for boolean expressions
-- data BoolExp = 
--     -- binary operator on boolean expressions
   
--     -- DOBRA didnt add that
--     | Var_B String

-- bool Exp gone
-- data GenExp = Expression Exp

-- Data-structure for statements
data Statement = 
    -- TODO: add other statements
    -- Variable assignment
    Assign String Exp
    --Writeln
    | Write Exp
    -- If statement
    | If Exp [Statement]
    -- Block
    --If we get time
    | Block [Statement]
    -- While loop
    | While Exp [Statement]
    -- For loop
    | For String Exp Exp [Statement]

data VType = REAL | BOOL | STRING;

data Definition = 
    -- Variable definition, list of var, type
    VarDef [String] VType
    -- Procedures
    | Proc String [(String, VType)] Statement
 
-- Data-structure for hole program
-- TODO: add declarations and other useful stuff
-- Hint: make a tuple containing the other ingredients
type Program = [Statement]

