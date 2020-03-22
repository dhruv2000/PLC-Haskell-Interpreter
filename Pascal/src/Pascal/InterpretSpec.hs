-- Look at how testing is set up in FORTH project and emulate here
-- Make sure you unit test every function you write

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Interpret

main :: IO ()
main = hspec $ do

  describe "interpret" $ do
    context "FPN" $ do
        it "adds two integers" $ do
            interpret "+ 2 3" `shouldBe` ([Integer 6], "")      

        -- numerical precision makes this tricky
        it "multiplies floats and integers" $ do
            interpret "2 2.2 3.4 * *" `shouldBe` ([Real 14.960001], "")

    context "Printout" $ do
        it "computes product and outputs" $ do
            interpret "2 6 * ." `shouldBe` ([], "12")