module CreditCardValidator (validate) where

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

doubleEveryOther :: Either Int [Int] -> [Int]
doubleEveryOther (Left x) = doubleEveryOther (Right (toDigitsRev x))
doubleEveryOther (Right []) = []
doubleEveryOther (Right [x]) = [x]
doubleEveryOther (Right (x : y : xs)) = x : y * 2 : doubleEveryOther (Right xs)

sumArray :: [Int] -> Int
sumArray [] = 0
sumArray [x] = x
sumArray (x : xs) = x + sumArray xs

sumDigits :: [Int] -> Int
sumDigits [] = 0
sumDigits [x] = x
sumDigits (x : xs) = sumArray (toDigits x) + sumDigits xs

validate :: Either Int [Int] -> Bool
validate n = sumDigits (doubleEveryOther n) `mod` 10 == 0
