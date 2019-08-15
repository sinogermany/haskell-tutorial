{-# LANGUAGE ViewPatterns, ScopedTypeVariables #-}

module CIS194.Homework02.Exercise01 (parseMessage, parse) where

import CIS194.Homework02.Log

import Control.Monad.Zip
import Text.Read

parseMessage :: String -> LogMessage
parseMessage ( words -> "I"
             : (readMaybe -> Just (ts :: TimeStamp))
             : body ) = LogMessage Info ts $ unwords body
parseMessage ( words -> "W"
             : (readMaybe -> Just (ts :: TimeStamp))
             : body ) = LogMessage Warning ts $ unwords body
parseMessage ( words -> "E"
             : (readMaybe -> Just (sv :: Severity))
             : (readMaybe -> Just (ts :: TimeStamp))
             : body ) = LogMessage (Error sv) ts $ unwords body
parseMessage logLine = Unknown logLine

parse :: String -> [LogMessage]
parse = map parseMessage . lines
