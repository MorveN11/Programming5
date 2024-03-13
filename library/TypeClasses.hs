module TypeClasses where

type Name = String

type Age = Int

-- Name = String
-- Age = Int

data Bool = False | True

-- Bool True, Bool False

data Move = North | South | East | West

-- North, South, East, West

data Shape = Circle Float | React Float Float

-- Circle 20, React 20 20

data List t = Nill | Cons t (List t)

-- Const 4 (Cons 4 Nill)

data Person = Student Name | Worker Name Age
  deriving (Eq, Show)

data Nat = Zero | Succ Nat

zero :: Maybe Int
zero = Just 0

doSomething :: String -> Int
doSomething = read

app :: (a -> b) -> Maybe a -> Maybe b
app _ Nothing = Nothing
app f (Just x) = Just (f x)

main :: IO ()
main = do
  print (app ('a' :) (Just "test"))
