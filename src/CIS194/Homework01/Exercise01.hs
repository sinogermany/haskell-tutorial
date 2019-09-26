{-# OPTIONS_GHC -fno-warn-type-defaults #-}

module CIS194.Homework01.Exercise01 (toDigits, toDigitsRev) where

toDigits :: Integer -> [Integer]
toDigits = reverse . toDigitsRev

toDigitsRev :: Integer -> [Integer]
toDigitsRev n = fmap getDigit
              . enumFromTo 0
              . floor
              . logBase 10
              . fromIntegral
              $ num
            where
              num      = abs n
              getDigit = (`mod` 10) . (num `div`) . (10 ^)
