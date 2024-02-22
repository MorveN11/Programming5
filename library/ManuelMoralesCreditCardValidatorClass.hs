module ManuelMoralesCreditCardValidatorClass (validate) where

toDigitsRev :: Int -> [Int]
toDigitsRev n
  | n <= 0 = []
  | n < 10 = [n]
  | otherwise = mod n 10 : toDigitsRev (div n 10)

doubleEveryOther :: [Int] -> [Int]
doubleEveryOther [] = []
doubleEveryOther [x] = [x]
doubleEveryOther (x : y : xs) = x : y * 2 : doubleEveryOther xs

sumDigits :: [Int] -> Int
sumDigits [] = 0
sumDigits [x] = x
sumDigits (x : xs)
  | x < 10 = x + sumDigits xs
  | otherwise = aux x + sumDigits xs

aux :: Int -> Int
aux 0 = 0
aux x = mod x 10 + aux (div x 10)

validate :: Int -> Bool
validate n = sumDigits (doubleEveryOther (toDigitsRev n)) `mod` 10 == 0
