module Hanoi where

-- Type NumberDiscs represents the number of discs
type NumberDiscs = Int
-- Type Rod represents the rod
type Rod = String
-- Type Move represents the move from one rod to another
type Move = (Rod, Rod)

-- hanoi n a b c = move n discs from a to c using b as temporary storage
hanoi :: NumberDiscs -> Rod -> Rod -> Rod -> [Move]
hanoi 0 _ _ _ = []
hanoi n a b c = hanoi (n-1) a c b ++ [(a, b)] ++ hanoi (n-1) c b a

-- This function prints the move from one rod to another
printMove :: Move -> String
printMove (a, b) = "Move from " ++ a ++ " to " ++ b

-- This function prints all the moves
printMoves :: [Move] -> String
printMoves [] = ""
printMoves (x:xs) = printMove x ++ "\n" ++ printMoves xs
