module Identity (myMap) where

double :: Int -> Int
double x = x * 2

addOne :: Int -> Int
addOne x = x + 1

myMap :: (Int -> Int) -> Int -> Int
myMap = fmap (double . addOne)
