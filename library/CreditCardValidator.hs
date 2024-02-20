{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use foldr" #-}

module CreditCardValidator where

toDigits :: Int -> [Int]
toDigits n
  | n <= 0 = []
  | n < 10 = [n]
  | otherwise = toDigits (div n 10) ++ [mod n 10]

toDigitsRev :: Int -> [Int]
toDigitsRev n
  | n <= 0 = []
  | n < 10 = [n]
  | otherwise = mod n 10 : toDigitsRev (div n 10)

doubleEveryOther :: [Int] -> [Int]
doubleEveryOther [] = []
doubleEveryOther [x] = [x]
doubleEveryOther (x : y : zs) = x : y * 2 : doubleEveryOther zs

sumDigits :: [Int] -> Int
sumDigits [] = 0
sumDigits (x : xs) = sum (toDigits x) + sumDigits xs

validate :: Int -> Bool
validate n = mod (sumDigits (doubleEveryOther (toDigitsRev n))) 10 == 0
