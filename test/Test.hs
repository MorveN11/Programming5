import Hanoi (hanoi)
import Test.QuickCheck (Property, property, quickCheck, (===))

-- Test case for hanoi 1 with valid input
hanoiTest1 :: Property
hanoiTest1 = property $ hanoi 1 "src" "tmp" "dst" === [("src", "dst")]

-- Test case for hanoi 2 with valid input
hanoiTest2 :: Property
hanoiTest2 = property $ hanoi 2 "src" "tmp" "dst" === [("src", "tmp"), ("src", "dst"), ("tmp", "dst")]

-- Test case for hanoi 3 with valid input
hanoiTest3 :: Property
hanoiTest3 = property $ hanoi 3 "src" "tmp" "dst" === [("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("src", "dst"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst")]

-- Test case for hanoi 4 with valid input
hanoiTest4 :: Property
hanoiTest4 = property $ hanoi 4 "src" "tmp" "dst" === [("src", "tmp"), ("src", "dst"), ("tmp", "dst"), ("src", "tmp"), ("dst", "src"), ("dst", "tmp"), ("src", "tmp"), ("src", "dst"), ("tmp", "dst"), ("tmp", "src"), ("dst", "src"), ("tmp", "dst"), ("src", "tmp"), ("src", "dst"), ("tmp", "dst")]

-- Test case for hanoi 5 with valid input
hanoiTest5 :: Property
hanoiTest5 = property $ hanoi 5 "src" "tmp" "dst" === [("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("src", "dst"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("dst", "src"), ("tmp", "src"), ("dst", "tmp"), ("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("src", "dst"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst"), ("tmp", "src"), ("dst", "tmp"), ("dst", "src"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("src", "dst"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst")]

main :: IO ()
main = do
  quickCheck hanoiTest1
  quickCheck hanoiTest2
  quickCheck hanoiTest3
  quickCheck hanoiTest4
  quickCheck hanoiTest5
  return ()
