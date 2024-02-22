module Main where

import Hanoi (hanoi, printMoves)

main :: IO ()
main = do
  putStrLn "\n----------------------------------------"
  putStrLn "Welcome to Hanoi Tower Algorithm!\n"
  putStrLn "Please enter the number of disks"
  disks <- getLine
  putStrLn "Please enter the source rod"
  src <- getLine
  putStrLn "Please enter the temporary rod"
  tmp <- getLine
  putStrLn "Please enter the destination rod"
  dst <- getLine
  putStrLn ""
  if null disks
    then error "Please enter the number of disks and the names of the rods"
    else do
      putStrLn (printMoves (hanoi (read disks) src tmp dst))
      putStrLn "----------------------------------------"
      putStrLn "For see the tests, please run the tests with 'cabal test' command."
