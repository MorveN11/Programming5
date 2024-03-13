module BST (foldTree, Tree (..)) where

type Height = Integer

data Tree a
  = Leaf
  | Node Height (Tree a) a (Tree a)
  deriving (Show, Eq)

getHeight :: Tree a -> Height
getHeight Leaf = -1
getHeight (Node height _ _ _) = height

insert :: a -> Tree a -> Tree a
insert valueInsert Leaf = Node 0 Leaf valueInsert Leaf
insert valueInsert (Node _ left value right)
  | getHeight left <= getHeight right = Node (1 + max (getHeight (insert valueInsert left)) (getHeight right)) (insert valueInsert left) value right
  | getHeight left > getHeight right = Node (1 + max (getHeight left) (getHeight (insert valueInsert right))) left value (insert valueInsert right)
  | otherwise = Node (1 + max (getHeight left) (getHeight (insert valueInsert right))) left value (insert valueInsert right)

foldTree :: [a] -> Tree a
foldTree = foldr insert Leaf
