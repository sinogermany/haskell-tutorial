module CIS194.Homework01.Exercise06Spec where

import CIS194.Homework01.Exercise06

import Control.Monad
import Text.Printf

import Test.Tasty.Hspec
import Control.Exception (evaluate)

spec_hanoi4Pegs :: Spec
spec_hanoi4Pegs = do

  it "hanoi4Pegs with negative disks should take no move" $
    hanoi4Pegs (-1) "a" "b" "c" "d" `shouldBe` []

  it "hanoi4Pegs with 0 disks should take no move" $
    hanoi4Pegs 0 "a" "b" "c" "d" `shouldBe` []

  it "hanoi4Pegs with 1 disks should take 1 move" $
    hanoi4Pegs 1 "a" "b" "c" "d" `shouldBe` [("a", "b")]

  it "hanoi4Pegs with 2 disks should take 3 moves" $
    hanoi4Pegs 2 "a" "b" "c" "d" `shouldBe` [("a","c"), ("a","b"), ("c","b")]

  it "hanoi4Pegs with 3 disks should take 5 moves" $
    hanoi4Pegs 3 "a" "b" "c" "d" `shouldBe` [("a","c"),("a","d"),("a","b"),("c","b"),("d","b")]

  let testData =
        [ (3, 5)
        , (4, 9)
        , (5, 13)
        , (6, 17)
        , (7, 25)
        , (8, 33)
        , (15, 129) ]

  forM_ testData $ \(disks, moves) ->
    it (printf "hanoi4Pegs with %d disks should take %d moves" disks moves) $
      length (hanoi4Pegs disks "a" "b" "c" "d") `shouldBe` moves
