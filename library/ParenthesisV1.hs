module ParenthesisV1 (addParenthesis) where

import Data.Char (isDigit)

type Operator = Char

data Expression = Null | Operand Int | Expression (Expression, Operator, Expression)
  deriving (Show)

priority :: Char -> Int
priority c
  | c == '^' = 8
  | c == '*' = 7
  | c == '/' = 7
  | c == '+' = 6
  | c == '-' = 6
  | otherwise = 0

addParenthesisAlgorithm :: String -> Expression
addParenthesisAlgorithm [] = Null
addParenthesisAlgorithm xs
  | null rest = Operand (read num)
  | otherwise =
    let (stackNum, stackRest) = span isDigit restAfterOp
     in if null stackRest
          then do
            Expression (addParenthesisAlgorithm num, op, addParenthesisAlgorithm stackNum)
          else do
            if priority op >= priority (head stackRest)
              then do
                Expression (Expression (addParenthesisAlgorithm num, op, addParenthesisAlgorithm stackNum), head stackRest, addParenthesisAlgorithm (tail stackRest))
              else do
                Expression (addParenthesisAlgorithm num, op, addParenthesisAlgorithm restAfterOp)
  where
    num = takeWhile isDigit xs
    rest = dropWhile isDigit xs
    op = head rest
    restAfterOp = tail rest

toString :: Expression -> String
toString Null = ""
toString (Operand n) = show n
toString (Expression (e1, o, e2)) = "(" ++ toString e1 ++ [o] ++ toString e2 ++ ")"

addParenthesis :: String -> String
addParenthesis = toString . addParenthesisAlgorithm
