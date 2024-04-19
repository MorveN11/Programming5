module Exercises (Tree) where

{-
Exercise 1
Define instance of the Functor class for the following type of binary trees that have data in
their nodes
 -}

data Tree a = Leaf | Node (Tree a) a (Tree a) deriving (Show)

instance Functor Tree where
  -- fmap :: (a -> b) -> Tree a -> Tree b
  fmap _ Leaf = Leaf
  fmap g (Node l x r) = Node (fmap g l) (g x) (fmap g r)

{-
Exercise 2
Complete the following instance declaration to make the partially-applied function type (a ->)
into a functor:
-}

{-
instance Functor ((->) a) where
  fmap :: (b -> c) -> (a -> b) -> (a -> c)
  fmap g h = g . h
-}

{-
Exercise 3
Define an instance of the Applicative class for the type (a ->). If you are familiar with
combinator logic, you might recognize pure and <*> for this type as being the well-known K and
S combinator.
-}

{-
instance Applicative ((->) a) where
  pure :: b -> (a -> b)
  pure = const

  (<*>) :: (a -> b -> c) -> (a -> b) -> (a -> c)
  g <*> h = \x -> g x (h x)
-}

{-
Exercise 4
There may be more than one way to make a parameterized type into an applicative functor. For
example, the library Control.Applicative provides an alternative ‘zippy’ instance for lists, in
which the function pure makes an infinite list of copies of its argument, and the operator <*>
applies each argument function to the corresponding argument value at the same position. Complete
the following declarations that implement this idea:
newtype ZipList a = Z [a] deriving Show
instance Functor ZipList where
-- fmap :: (a -> b) -> ZipList a -> ZipList b
fmap g (Z xs) = ...
instance Applicative ZipList where
-- pure :: a -> ZipList a
pure x = ...
-- <*> :: ZipList (a -> b) -> ZipList a -> ZipList b
(Z gs) <$> (Z xs) = ...
The ZipList wrapper around the list type is required because each type can only have at most one
instance declaration for a given class
-}

newtype ZipList a = Z [a] deriving (Show)

instance Functor ZipList where
  -- fmap :: (a -> b) -> ZipList a -> ZipList b
  fmap g (Z xs) = Z (fmap g xs)

instance Applicative ZipList where
  -- pure :: a -> ZipList a
  pure x = Z (repeat x)

  -- <*> :: ZipList (a -> b) -> ZipList a -> ZipList b
  (Z gs) <*> (Z xs) = Z [g x | (g, x) <- zip gs xs]

{-
Exercise 5
Work out the types for the variables in the four applicative laws.
Laws:
1. pure id <*> x = x
2. pure (g x) = pure g <*> pure x
3. x <*> pure y = pure (\g -> g y) <*> x
4. x <*> (y <*> z) = (pure (.) <*> x <*> y) <*> z

Answer:
1. pure id <*> x = x
   Here, `id` is of type `a -> a`, `x` is of type `f a` (for some Applicative `f`), and `pure id` is of type `f (a -> a)`.

2. pure (g x) = pure g <*> pure x
   Here, `g` is of type `a -> b`, `x` is of type `a`, `pure g` is of type `f (a -> b)`, `pure x` is of type `f a`, and `pure (g x)` is of type `f b`.

3. x <*> pure y = pure (\g -> g y) <*> x
   Here, `x` is of type `f (a -> b)`, `y` is of type `a`, `pure y` is of type `f a`, and `pure (\g -> g y)` is of type `f (b -> b)`.

4. x <*> (y <*> z) = (pure (.) <*> x <*> y) <*> z
   Here, `x` is of type `f (b -> c)`, `y` is of type `f (a -> b)`, `z` is of type `f a`, `(.)` is the function composition operator of type `(b -> c) -> (a -> b) -> a -> c`, and `pure (.)` is of type `f ((b -> c) -> (a -> b) -> a -> c)`.
-}
