{

{-# LANGUAGE OverloadedStrings                 #-}
{-# LANGUAGE NoMonomorphismRestriction          #-}
{-# LANGUAGE CPP                                #-}
{-# OPTIONS_GHC -fno-warn-unused-binds          #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures    #-}
{-# OPTIONS_GHC -fno-warn-unused-matches        #-}
{-# OPTIONS_GHC -fno-warn-unused-imports        #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing        #-}
{-# OPTIONS_GHC -fno-warn-tabs                  #-}
{-# OPTIONS_GHC -funbox-strict-fields           #-}

module Lexer
  ( Alex(..)
  , AlexPosn(..)
  , AlexState(..)
  , Token(..)
  , TokenClass(..)
  , alexError
  , alexMonadScan
  , runAlex
  , tokenToPosN
  )
where

import System.Exit
import qualified Data.ByteString.Lazy.Char8 as B
}

%wrapper "monadUserState-bytestring"

$digit = 0-9                    -- digits
$alpha = [a-zA-Z]               -- alphabetic characters


-- TODO: Map symbols into token types (with or without parameters)
tokens :-
  $white+                                 ; -- remove multiple white-spaces
  "//".*                                  ; -- skip one line comments
  $digit+\.$digit*                        { tok_read     TokenFloat }
  [\+]|[\-]|[\*]|[\/]|[=]|:=              { tok_string     TokenOp }
  [\<]|[\>]|\<=|\>=                       { tok_string     TokenOp }
  [\(]|[\)]|begin|end|true|false|OR       { tok_string     TokenK }
  [\.]|[\:]|[\;]|AND|not|var|boolean|real { tok_string     TokenK }
  while|do|for|to|writeln|const|string    { tok_string     TokenK }
  [\,]|ID_List|program|if|then|else       { tok_string     TokenK }
  sqrt|ln|sin|cos|exp                     { tok_string     TokenK }
  $alpha [$alpha $digit \_ \']*           { tok_string   TokenID }
{

-- Some action helpers:
tok' f (p, _, input, _) len = return $ Token p (f (B.take (fromIntegral len) input))
tok x = tok' (\s -> x)
tok_string x = tok' (\s -> x (B.unpack s))
tok_read x = tok' (\s -> x (read (B.unpack s)))

-- The token type:
data Token = Token AlexPosn TokenClass
  deriving (Show)

tokenToPosN :: Token -> AlexPosn
tokenToPosN (Token p _) = p


-- TODO: Add your own token types here
-- THIS IS THE GLUE BETWEEN HAPPY AND ALEX
 
data TokenClass
 = TokenOp     String
 | TokenK      String
 | TokenInt    Int
 | TokenFloat   Float
 | TokenID    String
 | TokenEOF
 deriving (Eq, Show)

alexEOF :: Alex Token
alexEOF = do
  (p, _, _, _) <- alexGetInput
  return $ Token p TokenEOF

type AlexUserState = ()
alexInitUserState = ()
}
