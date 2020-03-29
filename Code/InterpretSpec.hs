-- -- Look at how testing is set up in FORTH project and emulate here
-- -- Make sure you unit test every function you write
import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Interpret
import Data 


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

-- TODO later add more test cases to this test case as whole bc there are a lot of possibilites
  describe "intExp" $ do
    context "+" $ do
        it "Adds Floats" $ do
            intExp (Op2 "+" (Real 2.0) (Real 3.0)) `shouldBe` 5.0
    context "-" $ do
        it "Subtracts Floats" $ do
            intExp (Op2 "-" (Real 10.0) (Real 3.0)) `shouldBe` 7.0
    context "*" $ do
        it "Multiplies Floats" $ do
            intExp (Op2 "*" (Real 2.0) (Real 3.0)) `shouldBe` 6.0
    context "/" $ do
        it "Divides Floats" $ do
            intExp (Op2 "/" (Real 10.0) (Real 5.0)) `shouldBe` 2.0

  
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


  describe "boolIntExp" $ do
    context "=" $ do
        it "Tests == of floats" $ do
            boolIntExp (Comp "=" (Real 7.0) (Real 7.0)) `shouldBe` True
    context "<" $ do
        it "Tests < of floats" $ do
            boolIntExp (Comp "<" (Real 1.0) (Real 3.0)) `shouldBe` True
    context ">" $ do
        it "Tests > of floats" $ do
            boolIntExp (Comp ">" (Real 1.0) (Real 3.0)) `shouldBe` False
    context "<=" $ do
        it "Tests <= of floats" $ do
            boolIntExp (Comp "<=" (Real 7.0) (Real 7.0)) `shouldBe` True
    context ">=" $ do
        it "Tests >= of floats" $ do
            boolIntExp (Comp ">=" (Real 1.0) (Real 7.0)) `shouldBe` False
    context "Not" $ do
        it "Tests Not with booleans and flaots" $ do
            boolIntExp (Not (Comp "<" (Real 2.0 ) (Real 3.0))) `shouldBe` False
            boolIntExp (Not True_C) `shouldBe` False
            boolIntExp (Not False_C) `shouldBe` True
    context "AND" $ do           
        it "Tests AND with two booleans" $ do
            boolIntExp (OpB "AND" True_C False_C) `shouldBe` False
            boolIntExp (OpB "AND" True_C True_C) `shouldBe` True
    context "OR" $ do
        it "Tests OR with two booleans" $ do
            boolIntExp (OpB "OR" True_C False_C) `shouldBe` True
            boolIntExp (OpB "OR" False_C False_C) `shouldBe` False
            