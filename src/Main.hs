{-# LANGUAGE GADTs #-}

module Main (main) where

data MyList a = Nil | Cons a (MyList a)
  deriving (Show)

main :: IO ()
main = do
  putStrLn "\n----------------------------------------"
