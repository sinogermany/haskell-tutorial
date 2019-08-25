module CIS194.Homework03.Exercise02 (localMaxima) where

import Data.List

isLocalMax :: Ord a => [a] -> Bool
isLocalMax [x, y, z] | y > x && y > z = True
isLocalMax _                          = False

window :: Int -> [a] -> [[a]]
window n = filter ((>= n) . length) . fmap (take n) . tails

localMaxima :: [Integer] -> [Integer]
localMaxima = map (!!1) . filter isLocalMax . window 3
