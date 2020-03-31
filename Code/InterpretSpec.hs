-- -- Look at how testing is set up in FORTH project and emulate here
-- -- Make sure you unit test every function you write
import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Interpret
import Data
import Data.Maybe (isNothing)
import qualified Data.Map.Strict as Map


main :: IO ()
main = hspec $ do
  describe "biOp1" $ do
    context "-" $ do
        it "Negates Floats" $ do
            unOp1 "-" 2.0 `shouldBe` (-2.0)
    context "sqrt" $ do
        it "Performs sqrt" $ do
            unOp1 "sqrt" 9.0 `shouldBe` 3.0
    context "natlog" $ do
        it "Performs natural log" $ do
            unOp1 "ln" 2.718 `shouldBe` 0.999896315728952
    context "sin" $ do
        it "Performs sin" $ do
            unOp1 "sin" 1.57079633 `shouldBe` 1.0
    context "cos" $ do
        it "Performs cos" $ do
            unOp1 "cos" 3.14159265 `shouldBe` (-1.0)
    context "exp" $ do
        it "Performs exp" $ do
            unOp1 "exp" 1.0 `shouldBe` 2.7182817

  describe "biOp2" $ do
    context "+" $ do
        it "Adds Floats" $ do
            biOp2 "+" 2.0 3.0 `shouldBe` 5.0
    context "-" $ do
        it "Subtracts Floats" $ do
            biOp2 "-" 10.0 3.0 `shouldBe` 7.0
    context "*" $ do 
        it "Multiplies Floats" $ do
            biOp2 "*" 2.0 3.0 `shouldBe` 6.0
    context "/" $ do
        it "Divides Floats" $ do
            biOp2 "/" 10.0 5.0 `shouldBe` 2.0

  describe "bibOp1" $ do
    context "Not" $ do
        it "Negates True" $ do
            bibOp1 "NOT" True `shouldBe` (False)
        it "Negates False" $ do
            bibOp1 "NOT" False `shouldBe` (True)   

  describe "relBiOp" $ do
    context "<" $ do
        it "<" $ do
            relBiOp "<" 5.0 6.0  `shouldBe` (True)
    context ">" $ do
        it ">" $ do
            relBiOp ">" 5.0 6.0  `shouldBe` (False)  
    context "<=" $ do
        it "<=" $ do
            relBiOp "<=" 10.0 10.0  `shouldBe` (True) 
    context ">=" $ do
        it ">=" $ do
            relBiOp ">=" 36.0 55.5  `shouldBe` (False)
    context "=" $ do
        it "==" $ do
            relBiOp "=" 6.0 6.0  `shouldBe` (True) 

  describe "bibOp2" $ do
    context "AND" $ do
        it "Tests AND" $ do
            bibOp2 "AND" True False  `shouldBe` (False)
    context "OR" $ do
        it "Tests OR" $ do
            bibOp2 "OR" True False  `shouldBe` (True) 
  
  --Tests Op1, Op2, and Real Expressions
  describe "Expressions" $ do
    context "Floats" $ do
        it "7.0" $ do
            expression (Real 7.0) [(Map.fromList [("", ("",""))])] `shouldBe` Left 7.0
    context "Negation" $ do
        it "Negates Floats" $ do
            expression (Op1 "-" (Real 2.0)) [(Map.fromList [("", ("",""))])] `shouldBe` Left (-2.0)
    context "sqrt" $ do
        it "Calculates sqrt" $ do
            expression (Op1 "sqrt" (Real 9.0)) [(Map.fromList [("", ("",""))])] `shouldBe` Left 3.0
    context "ln" $ do
        it "Calculates ln" $ do
            expression (Op1 "ln" (Real 2.718)) [(Map.fromList [("", ("",""))])] `shouldBe` Left 0.999896315728952
    context "sin" $ do
        it "Calculates sin" $ do
            expression (Op1 "sin" (Real 1.57079633)) [(Map.fromList [("", ("",""))])] `shouldBe` Left 1.0
    context "cos" $ do
        it "Calculates cos" $ do
            expression (Op1 "cos" (Real 3.14159265)) [(Map.fromList [("", ("",""))])] `shouldBe` Left (-1.0)
    context "exp" $ do
        it "Calculates exp" $ do
            expression (Op1 "exp" (Real 1.0)) [(Map.fromList [("", ("",""))])] `shouldBe` Left 2.7182817
    context "+" $ do
        it "Adds Floats" $ do
            expression (Op2 "+" (Real 2.0) (Real 3.0)) [(Map.fromList [("", ("",""))])] `shouldBe` Left 5.0
    context "-" $ do
        it "Subtracts Floats" $ do
            expression (Op2 "-" (Real 10.0) (Real 3.0)) [(Map.fromList [("", ("",""))])] `shouldBe` Left 7.0
    context "*" $ do
        it "Multiplies Floats" $ do
            expression (Op2 "*" (Real 2.0) (Real 3.0)) [(Map.fromList [("", ("",""))])] `shouldBe` Left 6.0
    context "/" $ do
        it "Divides Floats" $ do
            expression (Op2 "/" (Real 10.0) (Real 5.0)) [(Map.fromList [("", ("",""))])] `shouldBe` Left 2.0

--Tests OpB, Comp, and Not Expressions with True_c and False_C
  describe "boolean Expressions" $ do
    context "=" $ do
        it "Tests == of floats" $ do
            expression (Comp "=" (Real 7.0) (Real 7.0)) [(Map.fromList [("", ("",""))])] `shouldBe` Right True
    context "<" $ do
        it "Tests < of floats" $ do
            expression (Comp "<" (Real 1.0) (Real 3.0)) [(Map.fromList [("", ("",""))])] `shouldBe` Right True
    context ">" $ do
        it "Tests > of floats" $ do
            expression (Comp ">" (Real 1.0) (Real 3.0)) [(Map.fromList [("", ("",""))])] `shouldBe` Right False
    context "<=" $ do
        it "Tests <= of floats" $ do
            expression (Comp "<=" (Real 7.0) (Real 7.0)) [(Map.fromList [("", ("",""))])] `shouldBe` Right True
    context ">=" $ do
        it "Tests >= of floats" $ do
            expression (Comp ">=" (Real 1.0) (Real 7.0)) [(Map.fromList [("", ("",""))])] `shouldBe` Right False
    context "Not" $ do
        it "Tests Constant booleans" $ do
            expression (True_C) [(Map.fromList [("", ("",""))])] `shouldBe` Right True
            expression (False_C) [(Map.fromList [("", ("",""))])] `shouldBe` Right False
        it "Tests NOT with booleans and floats" $ do
            expression (Not (Comp "<" (Real 2.0 ) (Real 3.0))) [(Map.fromList [("", ("",""))])] `shouldBe` Right False
            expression (Not True_C) [(Map.fromList [("", ("",""))])] `shouldBe` Right False
            expression (Not False_C) [(Map.fromList [("", ("",""))])] `shouldBe` Right True
    context "AND" $ do           
        it "Tests AND with two booleans" $ do
            expression (OpB "AND" True_C False_C) [(Map.fromList [("", ("",""))])] `shouldBe` Right False
            expression (OpB "AND" True_C True_C) [(Map.fromList [("", ("",""))])] `shouldBe` Right True
    context "OR" $ do
        it "Tests OR with two booleans" $ do
            expression (OpB "OR" True_C False_C) [(Map.fromList [("", ("",""))])] `shouldBe` Right True
            expression (OpB "OR" False_C False_C) [(Map.fromList [("", ("",""))])] `shouldBe` Right False

-- Tests Var String Expressions
  describe "Expressions with Var String" $ do
    context "Var String" $ do
        it "Tests lookup in maps for real numbers" $ do
            expression (Var "temp") [(Map.fromList [("temp", ("real","3.67"))])] `shouldBe` Left 3.67
        it "Tests lookup in maps for booleans" $ do
            expression (Var "temp") [(Map.fromList [("temp", ("boolean","False"))])] `shouldBe` Right False
    