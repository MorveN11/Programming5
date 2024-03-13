{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Avoid lambda using `infix`" #-}

module ManuelMoralesTest
  ( average,
    stringToListStudents,
    stringToListStudentNames,
    ageLessThan,
    ageBetweenThan,
    listOfStudents,
  )
where

import Data.List.Split (splitOn)

type Student = (String, Int)

isSpace :: Char -> Bool
isSpace x
  | x == ' ' = True
  | otherwise = False

isNotSpace :: Char -> Bool
isNotSpace x
  | x /= ' ' = True
  | otherwise = False

isNotComma :: Char -> Bool
isNotComma x
  | x /= ',' = True
  | otherwise = False

sumAll :: [Student] -> Int
sumAll [] = 0
sumAll (x : xs) = snd x + sumAll xs

average :: [Student] -> Float
average [] = 0
average xs = fromIntegral (sumAll xs) / fromIntegral (length xs)

-- Input: "Ana 25, Jose 37, Maria 23, John 33"
-- Output: ["Ana","Jose","Maria","John"]
stringToListStudentNames :: String -> [String]
stringToListStudentNames [] = []
stringToListStudentNames xs = name : stringToListStudentNames next
  where
    name = takeWhile isNotSpace xs
    rest = dropWhile isSpace (dropWhile isNotSpace xs)
    next = dropWhile isSpace (dropWhile isNotSpace rest)

-- Input: "Ana 25, Jose 37, Maria 23, John 33"
-- Output: [("Ana",25),("Jose",37),("Maria",23),("John",33)]
stringToListStudents :: String -> [Student]
stringToListStudents [] = []
stringToListStudents xs = (name, age) : stringToListStudents next
  where
    name = takeWhile isNotSpace xs
    rest = dropWhile isSpace (dropWhile isNotSpace xs)
    age = read (takeWhile isNotComma rest)
    next = dropWhile isSpace (dropWhile isNotSpace rest)

listOfStudents :: String -> [(String, Int)]
listOfStudents "" = []
listOfStudents s = tuples
  where
    firstList = splitOn s ","
    secondList = map (\x -> splitOn x " ") firstList
    tuples = map (\[[x], [y]] -> ([x], read [y])) secondList

ageLessThan :: [Student] -> Int -> [Student]
ageLessThan [] _ = []
ageLessThan (x : xs) less =
  do
    if snd x < less
      then x : ageLessThan xs less
      else ageLessThan xs less

ageBetweenThan :: [Student] -> Int -> Int -> [Student]
ageBetweenThan [] _ _ = []
ageBetweenThan (x : xs) less major =
  do
    if snd x >= less && snd x <= major
      then x : ageBetweenThan xs less major
      else ageBetweenThan xs less major
