-- Manuel Morales Y Combinator in Haskell
-- The Y combinator is a powerful tool in functional programming, particularly in Haskell, where anonymous functions are typically non-recursive. However, certain scenarios necessitate recursion even without explicitly naming the function. The Y combinator, implemented using the fix function, addresses this need by enabling recursion within anonymous functions. By applying the Y combinator to a recursive function, it transforms the function to incorporate recursion seamlessly, thereby enhancing the flexibility and elegance of functional programming paradigms. For instance, in computing Fibonacci numbers, we utilize the Y combinator to create a concise and efficient recursive function without the need for explicit function naming, demonstrating the practical utility of this concept in Haskell programming.

-- Code Example:
-- Define the Y combinator function
yCombinator :: (a -> a) -> a
yCombinator f = f (yCombinator f)

-- Fibonacci function using the Y combinator
fib :: Integer -> Integer
fib = yCombinator $ \f n -> if n <= 1 then n else f (n - 1) + f (n - 2)
