module Game (Board) where

data Tile = Empty | Value Int deriving (Show, Eq)

type Board = [[Tile]]
