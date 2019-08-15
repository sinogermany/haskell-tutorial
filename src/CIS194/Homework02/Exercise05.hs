module CIS194.Homework02.Exercise05 (whatWentWrong) where

import CIS194.Homework02.Log

import Data.List

isHighSeverityErr :: LogMessage -> Bool
isHighSeverityErr (LogMessage (Error severity) _ _) = 50 <= severity
isHighSeverityErr _                                 = False

-- partial function, only used by `whatWentWrong` after `isHighSeverityErr`
getTs :: LogMessage -> TimeStamp
getTs (LogMessage _ ts _) = ts

-- partial function, only used by `whatWentWrong` after `isHighSeverityErr`
getMsgBody :: LogMessage -> String
getMsgBody (LogMessage _ _ msgBody) = msgBody

whatWentWrong :: [LogMessage] -> [String]
whatWentWrong = map getMsgBody . sortOn getTs . filter isHighSeverityErr
