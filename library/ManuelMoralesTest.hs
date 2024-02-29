{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use foldr" #-}
module ManuelMoralesTest where

type Student = (String, Int)

isSpace :: Char -> Bool
isSpace x
  | x == ' ' = True
  | otherwise = False

isNotSpace :: Char -> Bool
isNotSpace x
  | x /= ' ' = True
  | otherwise = False

isComma :: Char -> Bool
isComma x
  | x == ',' = True
  | otherwise = False

isNotComma :: Char -> Bool
isNotComma x
  | x /= ',' = True
  | otherwise = False

isSpaceOrComma :: Char -> Bool
isSpaceOrComma x
  | x == ' ' = True
  | x == ',' = True
  | otherwise = False

sumAll :: [Student] -> Int
sumAll [] = 0
sumAll (x : xs) = snd x + sumAll xs

average :: [Student] -> Int
average [] = 0
average xs = sumAll xs `div` length xs

strName :: String -> [Student]
strName xs = (name, age) : strName next
  where
    name = takeWhile isNotSpace xs
    rest = dropWhile isSpace name
    age = read (takeWhile isNotComma rest)
    next = dropWhile isSpaceOrComma rest

ageLessThan :: [Student] -> Int -> [Student]
ageLessThan [] _ = []
ageLessThan (x : xs) less
  | null xs = [x]
  | otherwise =
    do
      if snd x < less
        then x : ageLessThan xs less
        else ageLessThan xs less

ageLessThanMajorThan :: [Student] -> Int -> Int -> [Student]
ageLessThanMajorThan [] _ _ = []
ageLessThanMajorThan (x : xs) less major
  | null xs = [x]
  | otherwise =
    do
      if snd x >= less && snd x <= major
        then x : ageLessThan xs less
        else ageLessThan xs less
