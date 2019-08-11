module CIS194.Homework02.Exercise01Spec where

import CIS194.Homework02.Log
import CIS194.Homework02.Exercise01

import Test.Tasty.Hspec
import Control.Exception (evaluate)

spec_parseMessage :: Spec
spec_parseMessage = do

  describe "parse an info message" $ do

    it "with a valid timestamp" $
      parseMessage "I 1 Some message" `shouldBe` LogMessage Info 1 "Some message"

    it "with an empty body" $
      parseMessage "I 1" `shouldBe` LogMessage Info 1 ""

    it "with an invalid timestamp" $
      parseMessage "I Some message" `shouldBe` Unknown "I Some message"

  describe "parse a warning message" $ do

    it "with a valid timestamp" $
      parseMessage "W 1 Some message" `shouldBe` LogMessage Warning 1 "Some message"

    it "with an empty body" $
      parseMessage "W 1" `shouldBe` LogMessage Warning 1 ""

    it "with an invalid timestamp" $
      parseMessage "W Some message" `shouldBe` Unknown "W Some message"

  describe "parse an error message" $ do

    it "with a valid error code and timestamp" $
      parseMessage "E 1 2 Some message" `shouldBe` LogMessage (Error 1) 2 "Some message"

    it "with an empty body" $
      parseMessage "E 1 2" `shouldBe` LogMessage (Error 1) 2 ""

    it "with error code or timestamp missing" $
      parseMessage "E 1 Some message" `shouldBe` Unknown "E 1 Some message"

  it "parse an unknown message" $
    parseMessage "UnknownType 1 2 Some message" `shouldBe` Unknown "UnknownType 1 2 Some message"
