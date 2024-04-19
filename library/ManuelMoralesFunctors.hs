{-# LANGUAGE InstanceSigs #-}

module ManuelMoralesFunctors (mainFunctor) where

data MyList a
  = Empty
  | Value a (MyList a)
  deriving (Show)

instance Functor MyList where
  fmap :: (a -> b) -> MyList a -> MyList b
  fmap _ Empty = Empty
  fmap f (Value x xs) = Value (f x) (fmap f xs)

addOne :: Int -> Int
addOne x = x + 1

mainFunctor :: IO ()
mainFunctor = do
  let myList :: MyList (Maybe Int)
      myList = Value (Just 2) (Value Nothing (Value (Just 3) Empty))
  print $ fmap (fmap addOne) myList

-- expected: Value (Just 3) (Value Nothing (Value (Just 4) Empty))
