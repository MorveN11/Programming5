import BST (Tree (..), foldTree)
import Test.QuickCheck (Property, property, quickCheck, (===))

testBST :: Property
testBST =
  property $
    foldTree "ABCDEFGHIJ"
      === Node
        3
        ( Node
            2
            (Node 1 (Node 0 Leaf 'D' Leaf) 'G' Leaf)
            'I'
            (Node 1 (Node 0 Leaf 'A' Leaf) 'E' Leaf)
        )
        'J'
        ( Node
            2
            (Node 1 (Node 0 Leaf 'B' Leaf) 'F' Leaf)
            'H'
            (Node 0 Leaf 'C' Leaf)
        )

main :: IO ()
main = quickCheck testBST
