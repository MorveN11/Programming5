module Hanoi (hanoi, hanoiAlgorithm, printMoves) where

-- Type NumberDisks represents the number of discs
type NumberDisks = Int

-- Type Rod represents the rod
type Rod = String

-- Type Move represents the move from one rod to another
type Move = (Rod, Rod)

-- hanoi n a b c = verify if the number of disks is valid and call the hanoiAlgorithm function
hanoi :: String -> Rod -> Rod -> Rod -> [Move]
hanoi n a b c
  | n == "" = error "Number of disks must be specified"
  | read n < (0 :: Integer) = error "Number of disks must be greater than or equal to 0"
  | read n > (7 :: Integer) = error "Number of disks must be less than or equal to 7"
  | a == b || a == c || b == c = error "Rods must be different"
  | a == "" || b == "" || c == "" = error "Rods must be named"
  | otherwise = hanoiAlgorithm (read n) a b c

-- hanoiAlgorithm n a b c = move n discs from a to c using b as temporary storage
hanoiAlgorithm :: NumberDisks -> Rod -> Rod -> Rod -> [Move]
hanoiAlgorithm 0 _ _ _ = []
hanoiAlgorithm n a b c = hanoiAlgorithm (n - 1) a c b ++ [(a, c)] ++ hanoiAlgorithm (n - 1) b a c

-- This function prints the move from one rod to another
printMove :: Move -> String
printMove (a, b) = "Move from " ++ a ++ " to " ++ b

-- This function prints all the moves
printMoves :: [Move] -> String
printMoves [] = ""
printMoves (x : xs) = printMove x ++ "\n" ++ printMoves xs
