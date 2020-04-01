module Main where

import Pascal
import System.Environment
import Debug.Trace(trace)

main :: IO ()
main = do
    (fileName:_) <- getArgs
    contents <- readFile fileName
    case parseString contents of 
        Left err -> print $ show err
        Right ast -> do
              trace ("ast: " ++ (show ast)) $ putStrLn $ interpret ast 

