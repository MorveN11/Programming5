module TestManuelMorales (parse, expressionEvaluator) where

import Data.List.Split (splitOn)
import Data.Map (Map, fromList, (!))

data Expr
  = Var Char
  | Not Expr
  | And Expr Expr
  | Or Expr Expr
  deriving (Show)

isClose :: Char -> Bool
isClose ')' = True
isClose _ = False

isOperand :: Char -> Bool
isOperand x = x == '∧' || x == '∨'

isOpenOrNotOperand :: Char -> Bool
isOpenOrNotOperand '(' = True
isOpenOrNotOperand x = not (isOperand x)

isOpen :: Char -> Bool
isOpen '(' = True
isOpen _ = False

evaluateAnd :: [Char] -> Expr
evaluateAnd ('¬' : x : _) = Not (Var x)
evaluateAnd (x : _) = Var x
evaluateAnd _ = error "Error cant parse message"

evaluateOp :: [Char] -> Maybe Expr
evaluateOp xs
  | null rest =
    Just (evaluateAnd x)
  | otherwise =
    if operand == '∧'
      then Just (And (evaluateAnd x) (evaluateAnd y))
      else do
        if operand == '∨'
          then Just (Or (evaluateAnd x) (evaluateAnd y))
          else Nothing
  where
    x = takeWhile (not . isOperand) (dropWhile isOpen xs)
    rest = dropWhile (not . isOperand) (dropWhile isOpen xs)
    operand = head (takeWhile isOperand rest)
    y = dropWhile isOperand rest

parseArray :: [Char] -> [Either Char (Maybe Expr)]
parseArray "" = [Right Nothing]
parseArray xs =
  if null rest
    then [Right (evaluateOp close)]
    else parseArray close ++ [Left (head operand)] ++ parseArray nextOp
  where
    close = takeWhile (not . isClose) xs
    rest = dropWhile (not . isOperand) (dropWhile (not . isClose) xs)
    operand = takeWhile (not . isOpenOrNotOperand) rest
    nextOp = dropWhile (not . isOpenOrNotOperand) rest

evaluateOpExp :: Maybe Expr -> Char -> Maybe Expr -> Maybe Expr
evaluateOpExp (Just x) '∧' (Just z) = Just (And x z)
evaluateOpExp (Just x) '∨' (Just z) = Just (Or x z)
evaluateOpExp (Just x) _ Nothing = Just x
evaluateOpExp Nothing _ (Just z) = Just z
evaluateOpExp _ _ _ = Nothing

parseList :: [Either Char (Maybe Expr)] -> Maybe Expr
parseList [] = Nothing
parseList [Right (Just x)] = Just x
parseList [Right Nothing] = Nothing
parseList (Right (Just x) : Left op : Right (Just z) : xs) = parseList (Right (evaluateOpExp (Just x) op (Just z)) : xs)
parseList _ = Nothing

parse :: String -> Maybe Expr
parse [] = Nothing
parse xs = parseList (parseArray xs)

evalExpression :: Maybe Expr -> Map Char Bool -> Bool
evalExpression Nothing _ = error "Error cant parse message"
evalExpression (Just (Var x)) m = m ! x
evalExpression (Just (Not x)) m = not (evalExpression (Just x) m)
evalExpression (Just (And x y)) m = evalExpression (Just x) m && evalExpression (Just y) m
evalExpression (Just (Or x y)) m = evalExpression (Just x) m || evalExpression (Just y) m

strToMap :: String -> Map Char Bool
strToMap xs = fromList (map ((\[k, v] -> (head k, read v :: Bool)) . splitOn "=") (splitOn "," xs))

expressionEvaluator :: String -> Bool
expressionEvaluator xs = evalExpression operation params
  where
    operation = parse (takeWhile (/= ',') (filter (/= ' ') xs))
    params = strToMap (takeWhile (/= '}') (dropWhile (== '{') (dropWhile (/= '{') (filter (/= ' ') xs))))
