module Main (main) where

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
  putStrLn (printMoves (hanoi disks src tmp dst))
  putStrLn "----------------------------------------"
  putStrLn "For see the tests, please run the tests with 'stack test' command."
