module Main (main) where

import Functors (inc')

main :: IO ()
main = do
  print (inc' [Just 1, Nothing, Just 2])
