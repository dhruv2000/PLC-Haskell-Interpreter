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
    -- variable: e.g. Var "x" - DONE
    Var String
    -- unary operator: Op name expression - DONE
    | Op1 String Exp
    -- binary operator: Op name leftExpression rightExpression - DONE
    | Op2 String Exp Exp
    -- real value: e.g. Real 1.0 - DONE
    | Real Float
    -- I don't think its necessary - but we agree on it - DONE
    | OpB String Exp Exp
    -- negation, the only unary operator - DONE
    | Not Exp
    -- comparison operator: Comp name expression expression - DONE
    | Comp String Exp Exp
    -- true and false constants - DONE
    | True_C
    | False_C
    -- *********************TODO*************************
    -- function call: FunctionCall name ListArguments
    | FunCall String [Exp]

data Statement = 
    -- TODO: add other statements
    -- Variable assignment - DONE
    Assign String Exp
    --Writeln - DONE
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
    | SomeDefinition Definition

data VType = REAL | BOOL | CONST;

data Definition = 
    -- Variable definition, list of var, type
    VarDef String VType
    -- Variable definition, list of var, type
    | VarDefList [String] VType
    -- Procedures
    | Proc String [(String, VType)] Statement
 
-- Data-structure for hole program
-- TODO: add declarations and other useful stuff
-- Hint: make a tuple containing the other ingredients
type Program = [Statement]

