-- Look at how testing is set up in FORTH project and emulate here
-- Make sure you unit test every function you write

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Interpret
import Data

main :: IO ()
main = hspec $ do
  describe "intExp" $ do
    context "+" $ do        
        it "Adds floats using biOp2" $ do
            biOp2 "+" 2.0 3.0 `shouldBe` 5.0
        it "Adds floats with intExp" $ do
            intExp "+" 2.0 3.0 `shouldBe` 5.0