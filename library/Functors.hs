{-# LANGUAGE LambdaCase #-}

module Functors (inc') where

inc' :: [Maybe Int] -> [Maybe Int]
inc' =
  map
    ( \case
        Just x -> Just (x + 1)
        Nothing -> Nothing
    )
