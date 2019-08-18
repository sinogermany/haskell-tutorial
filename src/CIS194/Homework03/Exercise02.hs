module CIS194.Homework03.Exercise02 (localMaxima) where

isLocalMax :: [Integer] -> Bool
isLocalMax [x : y : z] = y > x && y > z
isLocalMax _           = False

localMaxima :: [Integer] -> [[Integer]]
localMaxima a = map (\i -> take 3 . drop i $ a) [0..length a - 3]
