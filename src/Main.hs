module Main where

import Hanoi (hanoi, printMoves)

main :: IO ()
main = do
  putStrLn "Welcome to Hanoi Tower Algorithm, Lets see some Examples!\n"
  putStrLn "hanoi 1 \"src\" \"tmp\" \"dst\""
  putStrLn (printMoves (hanoi 1 "src" "tmp" "dst"))
  putStrLn "hanoi 2 \"src\" \"tmp\" \"dst\""
  putStrLn (printMoves (hanoi 2 "src" "tmp" "dst"))
  putStrLn "hanoi 3 \"src\" \"tmp\" \"dst\""
  putStrLn (printMoves (hanoi 3 "src" "tmp" "dst"))
  putStrLn "hanoi 4 \"src\" \"tmp\" \"dst\""
  putStrLn (printMoves (hanoi 4 "src" "tmp" "dst"))
  putStrLn "\nFor more examples, please run the tests with 'cabal test' command."
