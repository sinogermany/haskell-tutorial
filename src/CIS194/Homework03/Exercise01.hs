module CIS194.Homework03.Exercise01 (skips) where

takeEvery :: Int -> [a] -> [a]
takeEvery n = fmap snd . filter ((== n) . fst) . zip (cycle [1..n])

skips :: [a] -> [[a]]
skips inputList = fmap (`takeEvery` inputList) [1 .. length inputList]
