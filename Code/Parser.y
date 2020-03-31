{
module Parser where

import Base
import Data
import Lexer
}

--THIS IS THE ALEX FILE

%name happyParser
%tokentype { Token }


%monad { Parser } { thenP } { returnP }
%lexer { lexer } { Token _ TokenEOF }

-- TokenK is for keyword
-- TokenOp is for operator
%token
        int             { Token _ (TokenInt $$) }
        float           { Token _ (TokenFloat $$) }
        ID              { Token _ (TokenID $$)  }
        '<'             { Token _ (TokenOp "<")   }
        '>'             { Token _ (TokenOp ">")   }
        '<='            { Token _ (TokenOp "<=")   }
        '>='            { Token _ (TokenOp ">=")   }
        '+'             { Token _ (TokenOp "+")   }
        '-'             { Token _ (TokenOp "-")   }
        '*'             { Token _ (TokenOp "*")   }
        '/'             { Token _ (TokenOp "/")   }
        '='             { Token _ (TokenOp "=")   }
        ':='            { Token _ (TokenOp ":=")   }
        '('             { Token _ (TokenK  "(")   }
        ')'             { Token _ (TokenK  ")")   }
        'begin'         { Token _ (TokenK "begin") }
        'end'           { Token _ (TokenK "end")  }
        'true'          { Token _ (TokenK "true") }
        'false'         { Token _ (TokenK "false") }
        'sqrt'          { Token _ (TokenK "sqrt") } 
        'ln'            { Token _ (TokenK "ln") }
        'sin'           { Token _ (TokenK "sin")  }
        'exp'           { Token _ (TokenK "exp")  }
        'cos'           { Token _ (TokenK "false")}
        'AND'           { Token _ (TokenK "AND") }
        'OR'            { Token _ (TokenK "OR") }
        'not'           { Token _ (TokenK "not") }
        'for'           { Token _ (TokenK "for") }
        'to'            { Token _ (TokenK "to") }
        'while'         { Token _ (TokenK "while") }
        'do'            { Token _ (TokenK "do") }
        'var'           { Token _ (TokenK "var") }
        ':'             { Token _ (TokenK ":") }
        ';'             { Token _ (TokenK ";") }
        'boolean'       { Token _ (TokenK "bool") }
        'real'          { Token _ (TokenK "real") }
        'const'         { Token _ (TokenK "const") }
        'string'        { Token _ (TokenK "string") }
        ','             { Token _ (TokenK ",") }
        'ID_List'       { Token _ (TokenK "ID_List") }
        'program'       { Token _ (TokenK "program") }
        'writeln'       { Token _ (TokenK "writeln") }
        'if'            { Token _ (TokenK "if")      }
        'then'          { Token _ (TokenK "then")    }


-- associativity of operators in reverse precedence order
%nonassoc '>' '>=' '<' '<=' '==' '!='
%left '+' '-'
%left '*' '/'
%nonassoc ':='
%%

-- Entry point
--TODO if you run into problems, the user is trying to do stuff before begin
Program :: {Program}
    : Defs 'begin' Statements 'end' { $3 }

Defs :: {[Definition]}
    : { [] } -- nothing; make empty list
    | Definition Defs { $1:$2 } -- put statement as first element of statements

-- Variable Definitions
Definition :: {Definition}
-- The first line is temporary
    : 'var' ID ':' Type { VarDef $2 $4 } 
    | 'var' ID_List ':' Type { VarDefList $2 $4 }


Type :: {VType}
    : 'boolean' { BOOL }
    | 'real' { REAL }
    | 'const' { CONST }

ID_List :: {[String]}
    : ID {[$1]}
    | ID ',' ID_List { $1:$3 }

-- Expressions
Exp :: {Exp}
    : '+' Exp { $2 } -- ignore Plus
    | '-' Exp { Op1 "-" $2}
    | 'sqrt' Exp  { Op1 "sqrt" $2 }
    | 'ln' Exp  { Op1 "ln" $2 }
    | 'sin' Exp  { Op1 "sin" $2 }
    | 'cos' Exp  { Op1 "cos" $2 }
    | 'exp' Exp  { Op1 "exp" $2 }
    | Exp '/' Exp { Op2 "/" $1 $3 }
    | Exp '-' Exp { Op2 "-" $1 $3 }
    | Exp '+' Exp { Op2 "+" $1 $3 }
    | Exp '*' Exp { Op2 "*" $1 $3 }
    | '(' Exp ')' { $2 } -- ignore brackets
    | ID { Var $1 }
    | float { Real $1 }
    |'true' { True_C }
    | 'false' { False_C }
    | 'not' Exp { Not $2 }
    | Exp '<' Exp { Comp "<" $1 $3 }
    | Exp '>' Exp { Comp ">" $1 $3 }
    | Exp '<=' Exp { Comp "<=" $1 $3 }
    | Exp '>=' Exp { Comp ">=" $1 $3 }
    | Exp 'AND' Exp { OpB "AND" $1 $3 }
    | Exp 'OR' Exp { OpB "OR" $1 $3 }


Statements :: {[Statement]}
    : { [] } -- nothing; make empty list
    | Statement Statements { $1:$2 } -- put statement as first element of statements

--This needs to be added to
Statement :: {Statement}
    : ID ':=' '(' Exp ')' ';' { Assign $1 $4 }
    | ID ':=' Exp ';' { Assign $1 $3 }
    | Definition {SomeDefinition $1}
    | 'writeln' '(' Exp ')' ';' {Write $3}
    | 'if' '(' Exp ')'  'then' 'begin' Statements  'end' {If $3 $7}
    | 'while' '(' Exp ')' 'do' 'begin' Statements 'end' {While $3 $7}
    | 'for' ID ':=' Exp 'to' Exp 'do' 'begin' Statements 'end' {For $2 $4 $6 $9 }
{}
