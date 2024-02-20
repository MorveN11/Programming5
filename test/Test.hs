import Hanoi (hanoi)
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, testCase)

test1 :: TestTree
test1 = testCase "Test Hanoi of 1 Disc" $ assertEqual [] (hanoi 1 "src" "tmp" "dst") [("src", "dst")]

test2 :: TestTree
test2 = testCase "Test Hanoi of 2 Discs" $ assertEqual [] (hanoi 2 "src" "tmp" "dst") [("src", "tmp"), ("src", "dst"), ("tmp", "dst")]

test3 :: TestTree
test3 = testCase "Test Hanoi of 3 Discs" $ assertEqual [] (hanoi 3 "src" "tmp" "dst") [("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("src", "dst"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst")]

test4 :: TestTree
test4 = testCase "Test Hanoi of 4 Discs" $ assertEqual [] (hanoi 4 "src" "tmp" "dst") [("src", "tmp"), ("src", "dst"), ("tmp", "dst"), ("src", "tmp"), ("dst", "src"), ("dst", "tmp"), ("src", "tmp"), ("src", "dst"), ("tmp", "dst"), ("tmp", "src"), ("dst", "src"), ("tmp", "dst"), ("src", "tmp"), ("src", "dst"), ("tmp", "dst")]

test5 :: TestTree
test5 = testCase "Test Hanoi of 5 Discs" $ assertEqual [] (hanoi 5 "src" "tmp" "dst") [("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("src", "dst"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("dst", "src"), ("tmp", "src"), ("dst", "tmp"), ("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("src", "dst"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst"), ("tmp", "src"), ("dst", "tmp"), ("dst", "src"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("src", "dst"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst")]

unitTests :: TestTree
unitTests = testGroup "Unit tests" [test1, test2, test3, test4, test5]

main :: IO ()
main = defaultMain unitTests
