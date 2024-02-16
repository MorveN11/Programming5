{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use foldr" #-}

module CreditCardValidator where

toDigist :: Int -> [Int]
toDigist n
  | n <= 0 = []
  | n < 10 = [n]
  | otherwise = toDigist (div n 10) ++ [mod n 10]

toDigistRev :: Int -> [Int]
toDigistRev n
  | n <= 0 = []
  | n < 10 = [n]
  | otherwise = mod n 10 : toDigistRev (div n 10)

doubleEveryOther :: [Int] -> [Int]
doubleEveryOther [] = []
doubleEveryOther [x] = [x]
doubleEveryOther (x : y : zs) = x : y * 2 : doubleEveryOther zs

sumDigist :: [Int] -> Int
sumDigist [] = 0
sumDigist (x : xs) = sum (toDigist x) + sumDigist xs

validate :: Int -> Bool
validate n = mod (sumDigist (doubleEveryOther (toDigistRev n))) 10 == 0
