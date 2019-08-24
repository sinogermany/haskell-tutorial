module CIS194.Homework03.Exercise03 (histogram) where

import Data.List

stars :: Int -> String
stars = flip replicate '*'

spaces :: Int -> String
spaces = flip replicate ' '

starLine :: Int -> String
starLine nTimes = spaces (10 - nTimes) ++ stars nTimes

count :: [Integer] -> Integer -> Int
count xs x = length . filter (== x) $ xs

starLines :: [Integer] -> [String]
starLines xs = filter (/= spaces 10)
             . transpose
             . fmap (starLine . count xs)
             $ [0..9]

histogram :: [Integer] -> String
histogram xs = unlines $ starLines xs ++ ["==========", "0123456789"]
