module QuickSort (quickSort) where

lowerThanPivot :: (Ord a) => a -> [a] -> [a]
lowerThanPivot _pivot [] = []
lowerThanPivot pivot (x : xs) = if x < pivot then x : lowerThanPivot pivot xs else lowerThanPivot pivot xs

greaterThanPivot :: (Ord a) => a -> [a] -> [a]
greaterThanPivot _pivot [] = []
greaterThanPivot pivot (x : xs) = if x > pivot then x : greaterThanPivot pivot xs else greaterThanPivot pivot xs

quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x : xs) = quickSort (lowerThanPivot x xs) ++ [x] ++ quickSort (greaterThanPivot x xs)
