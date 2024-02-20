import CreditCardValidator (validate)
import Hanoi (hanoi)
import QuickSort (quickSort)
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, testCase)

creditCardValidatorTest1 :: TestTree
creditCardValidatorTest1 = testCase "Test Valid Credit Card Validator with 4012888888881881" $ assertEqual [] (validate (Left 4012888888881881)) True

creditCardValidatorTest2 :: TestTree
creditCardValidatorTest2 = testCase "Test InValid Credit Card Validator with 4012888888881882" $ assertEqual [] (validate (Left 4012888888881882)) False

hanoiTest1 :: TestTree
hanoiTest1 = testCase "Test Hanoi of 1 Disc" $ assertEqual [] (hanoi 1 "src" "tmp" "dst") [("src", "dst")]

hanoiTest2 :: TestTree
hanoiTest2 = testCase "Test Hanoi of 2 Discs" $ assertEqual [] (hanoi 2 "src" "tmp" "dst") [("src", "tmp"), ("src", "dst"), ("tmp", "dst")]

hanoiTest3 :: TestTree
hanoiTest3 = testCase "Test Hanoi of 3 Discs" $ assertEqual [] (hanoi 3 "src" "tmp" "dst") [("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("src", "dst"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst")]

hanoiTest4 :: TestTree
hanoiTest4 = testCase "Test Hanoi of 4 Discs" $ assertEqual [] (hanoi 4 "src" "tmp" "dst") [("src", "tmp"), ("src", "dst"), ("tmp", "dst"), ("src", "tmp"), ("dst", "src"), ("dst", "tmp"), ("src", "tmp"), ("src", "dst"), ("tmp", "dst"), ("tmp", "src"), ("dst", "src"), ("tmp", "dst"), ("src", "tmp"), ("src", "dst"), ("tmp", "dst")]

hanoiTest5 :: TestTree
hanoiTest5 = testCase "Test Hanoi of 5 Discs" $ assertEqual [] (hanoi 5 "src" "tmp" "dst") [("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("src", "dst"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("dst", "src"), ("tmp", "src"), ("dst", "tmp"), ("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("src", "dst"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst"), ("tmp", "src"), ("dst", "tmp"), ("dst", "src"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst"), ("src", "tmp"), ("dst", "tmp"), ("src", "dst"), ("tmp", "src"), ("tmp", "dst"), ("src", "dst")]

quickSortTest1 :: TestTree
quickSortTest1 = testCase "Test QuickSort of [1, 2, 3, 4, 5]" $ assertEqual [] (quickSort [1 :: Integer, 2, 3, 4, 5]) [1, 2, 3, 4, 5]

quickSortTest2 :: TestTree
quickSortTest2 = testCase "Test QuickSort of [5, 4, 3, 2, 1]" $ assertEqual [] (quickSort [5 :: Integer, 4, 3, 2, 1]) [1, 2, 3, 4, 5]

quickSortTest3 :: TestTree
quickSortTest3 = testCase "Test QuickSort of [1, 3, 5, 2, 4]" $ assertEqual [] (quickSort [1 :: Integer, 3, 5, 2, 4]) [1, 2, 3, 4, 5]

creditCrdValidatorUnitTests :: TestTree
creditCrdValidatorUnitTests = testGroup "Credit Card Validator Unit tests" [creditCardValidatorTest1, creditCardValidatorTest2]

hanoiUnitTests :: TestTree
hanoiUnitTests = testGroup "Hanoi Unit tests" [hanoiTest1, hanoiTest2, hanoiTest3, hanoiTest4, hanoiTest5]

quickSortUnitTests :: TestTree
quickSortUnitTests = testGroup "QuickSort Unit tests" [quickSortTest1, quickSortTest2, quickSortTest3]

unitTests :: TestTree
unitTests = testGroup "Unit tests" [creditCrdValidatorUnitTests, hanoiUnitTests, quickSortUnitTests]

main :: IO ()
main = defaultMain unitTests
