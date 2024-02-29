module Library
  ( lengthArrayGuards,
    lengthArrayIfThenElse,
    absGuards,
    lengthArrayFoldr,
    notFunction,
    insertAt,
  )
where

lengthArrayFoldr :: [Int] -> Int
lengthArrayFoldr = foldr (\_ y -> 1 + y) 0

lengthArrayGuards :: Ord a => [a] -> Int
lengthArrayGuards n
  | null n = 0
  | otherwise = 1 + lengthArrayGuards (tail n)

lengthArrayIfThenElse :: (Ord a) => [a] -> Int
lengthArrayIfThenElse n = if null n then 0 else 1 + lengthArrayIfThenElse (tail n)

absGuards :: (Num a, Ord a) => a -> a
absGuards n
  | n >= 0 = n
  | otherwise = - n

notFunction :: Bool -> Bool
notFunction False = True
notFunction True = False

insertAtAlgorithm :: [Int] -> Int -> Int -> [Int]
insertAtAlgorithm [] _ _ = []
insertAtAlgorithm xs 0 a = a : xs
insertAtAlgorithm (x : xs) n a = x : insertAtAlgorithm xs (n - 1) a

insertAt :: [Int] -> Int -> Int -> [Int]
insertAt xs i a
  | i < 0 || lengthArrayFoldr xs < i = error "Index out of bounds"
  | otherwise = insertAtAlgorithm xs i a
