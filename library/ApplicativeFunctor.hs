module ApplicativeFunctor (maybeAdd, maybeInt1, maybeInt2, result, result') where

maybeAdd :: Maybe (Int -> Int -> Int)
maybeAdd = pure (+)

maybeInt1 :: Maybe Int
maybeInt1 = Just 5

maybeInt2 :: Maybe Int
maybeInt2 = Nothing

result :: Maybe Int
result = maybeAdd <*> maybeInt1 <*> maybeInt2

addToList :: [Int -> Int -> Int]
addToList = [(+), (-)]

result' :: [Int]
result' = addToList <*> [1, 2] <*> [5, 6, 9]
