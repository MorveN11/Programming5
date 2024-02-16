import Test.HUnit
import Hanoi(hanoi)

test1 :: Test
test1 = TestCase (assertEqual "Test Hanoi of 1 Disc" (hanoi 1 "src" "tmp" "dst") [("src", "dst")])

test2 :: Test
test2 = TestCase (assertEqual "Test Hanoi of 2 Discs" (hanoi 2 "src" "tmp" "dst") [("src", "tmp"), ("src", "dst"), ("tmp", "dst")])

test3 :: Test
test3 = TestCase (assertEqual "Test Hanoi of 3 Discs" (hanoi 3 "src" "tmp" "dst") [("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("src", "dst"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst")])

test4 :: Test
test4 = TestCase (assertEqual "Test Hanoi of 4 Discs" (hanoi 4 "src" "tmp" "dst") [("src", "tmp"), ("src", "dst"), ("tmp", "dst"), ("src", "tmp"), ("dst", "src"), ("dst", "tmp"), ("src", "tmp"), ("src", "dst"), ("tmp", "dst"), ("tmp", "src"), ("dst", "src"), ("tmp", "dst"), ("src", "tmp"), ("src", "dst"), ("tmp", "dst")])

test5 :: Test
test5 = TestCase (assertEqual "Test Hanoi of 5 Discs" (hanoi 5 "src" "tmp" "dst") [("src","tmp"),("src","dst"),("tmp","dst"),("src","tmp"),("dst","src"),("dst","tmp"),("src","tmp"),("src","dst"),("tmp","dst"),("tmp","src"),("dst","src"),("tmp","dst"),("src","tmp"),("src","dst"),("tmp","dst"),("src","tmp"),("dst","src"),("dst","tmp"),("src","tmp"),("dst","src"),("tmp","dst"),("tmp","src"),("dst","src"),("dst","tmp"),("src","tmp"),("src","dst"),("tmp","dst"),("src","tmp"),("dst","src"),("dst","tmp"),("src","tmp")])

tests :: Test
tests = TestList [TestLabel "Test 1" test1, TestLabel "Test 2" test2, TestLabel "Test 4" test3, TestLabel "Test 4" test4, TestLabel "Test 5" test5]

main :: IO Counts
main = do
  runTestTT tests
