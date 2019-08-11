module CIS194.Homework02.Exercise01 (parseMessage, parse) where

import CIS194.Homework02.Log

import Control.Monad.Zip
import Text.Read

maybeInt :: String -> Maybe Int
maybeInt = readMaybe

info :: String -> [String] -> LogMessage
info ts body = case maybeInt ts of
                 Just timestamp -> LogMessage Info timestamp (unwords body)
                 Nothing        -> Unknown (unwords $ ["I", ts] ++ body)

warn :: String -> [String] -> LogMessage
warn ts body = case maybeInt ts of
                 Just timestamp -> LogMessage Warning timestamp (unwords body)
                 Nothing        -> Unknown (unwords $ ["W", ts] ++ body)

err :: String -> String -> [String] -> LogMessage
err errCode ts body = case maybeInt errCode `mzip` maybeInt ts of
                        Just (code, timestamp) -> LogMessage (Error code) timestamp (unwords body)
                        Nothing                -> Unknown (unwords $ ["E", errCode, ts] ++ body)

parseMessage :: String -> LogMessage
parseMessage logLine = case words logLine of
                         ("I" : ts : body)           -> info ts body
                         ("W" : ts : body)           -> warn ts body
                         ("E" : errCode : ts : body) -> err errCode ts body
                         _                           -> Unknown logLine

parse :: String -> [LogMessage]
parse = map parseMessage . lines
