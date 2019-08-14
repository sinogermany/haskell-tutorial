module CIS194.Homework02.Exercise05 (whatWentWrong) where

import CIS194.Homework02.Log

import Data.List

isHighSeverityErr :: LogMessage -> Bool
isHighSeverityErr (LogMessage (Error severity) _ _) = 50 <= severity
isHighSeverityErr _                                 = False

-- partial function, only used by `whatWentWrong`
getErrTs :: LogMessage -> Int
getErrTs (LogMessage (Error _) ts _) = ts

-- partial function, only used by `whatWentWrong`
getErrMsg :: LogMessage -> String
getErrMsg (LogMessage (Error _) _ msg) = msg

whatWentWrong :: [LogMessage] -> [String]
whatWentWrong = map getErrMsg . sortOn getErrTs . filter isHighSeverityErr
