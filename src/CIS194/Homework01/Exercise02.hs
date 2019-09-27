{-# LANGUAGE FlexibleContexts #-}

module CIS194.Homework01.Exercise02 (doubleEveryOther) where

import Data.Bool

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = foldr f []
                 where
                   f x       = flip (:) <*> calcVal x
                   calcVal x = bool x (x * 2) . odd . length
