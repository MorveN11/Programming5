module ParenthesisV2 (addParenthesis) where

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
    case addParenthesisAlgorithm restAfterOp of
      Null -> addParenthesisAlgorithm num
      Operand n -> Expression (addParenthesisAlgorithm num, op, Operand n)
      Expression (e1, otherOp, e2) ->
        if priority op > priority otherOp
          then Expression (Expression (addParenthesisAlgorithm num, op, e1), otherOp, e2)
          else Expression (addParenthesisAlgorithm num, op, Expression (e1, otherOp, e2))
  where
    num = takeWhile isDigit xs
    rest = dropWhile isDigit xs
    op = head rest
    restAfterOp = tail rest

toString :: Expression -> String
toString Null = error "Invalid expression"
toString (Operand n) = show n
toString (Expression (e1, o, e2)) = "(" ++ toString e1 ++ [o] ++ toString e2 ++ ")"

addParenthesis :: String -> String
addParenthesis = toString . addParenthesisAlgorithm
