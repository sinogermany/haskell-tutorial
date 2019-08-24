module CIS194.Homework03.Exercise02 (localMaxima) where

import Data.Maybe

localMax :: (Integer, Integer, Integer) -> Maybe Integer
localMax (x, y, z)
  | y > x && y > z = Just y
  | otherwise      = Nothing

localMaxima :: [Integer] -> [Integer]
localMaxima xs = mapMaybe localMax $ zip3 xs (drop 1 xs) (drop 2 xs)
