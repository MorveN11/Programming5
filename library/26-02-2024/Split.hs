module Split
  ( split,
    splitWords,
  )
where

splitAlgorithm :: String -> Char -> [String]
splitAlgorithm [] _ = [""]
splitAlgorithm (x : xs) c
  | x == c = "" : splitAlgorithm xs c
  | otherwise = (x : head (splitAlgorithm xs c)) : tail (splitAlgorithm xs c)

splitWords :: String -> Char -> [String]
splitWords [] _ = []
splitWords s c = takeWhile (/= c) s : splitWords (dropWhile (== c) (dropWhile (/= c) s)) c

removeEmpties :: [String] -> [String]
removeEmpties [] = []
removeEmpties (x : xs)
  | x == "" = removeEmpties xs
  | otherwise = x : removeEmpties xs

addParentheses :: [String] -> [String]
addParentheses = map (\x -> "(" ++ x ++ ")")

-- Input: "Hello World" -> Expected output: ["(Hello)", "(World)"]
split :: String -> Char -> [String]
split s c = addParentheses (removeEmpties (splitAlgorithm s c))
