-- Performs functions using zipWith function

-------------------------
-- Mathematical Sequences
-------------------------

-- Arithmetic
arith :: Integer -> Integer -> Integer -> [Integer]
arith l s n = zipWith (+) (iterate (+n) s) (replicate (fromIntegral l) 0)

-- Geometric
geo :: Integer -> Integer -> Integer -> [Integer]
geo l s n = zipWith (*) (iterate (*n) s) (replicate (fromIntegral l) 1)

-- Triangle
tri :: Integer -> [Integer]
tri l = zipWith (div) [x*(x+1) | x <- [1..l]] (repeat 2)

-- Square
sqr :: Integer -> [Integer]
sqr l = zipWith (^) [1..l] (repeat 2)

-- Cube
cube :: Integer -> [Integer]
cube l = zipWith (^) [1..l] (repeat 3)

-- Fibonacci
fib :: Integer -> [Integer]
fib 0 = []
fib 1 = [0]
fib l = zipWith (+) (0 : fib (l-1)) (0 : 1 : fib (l-2))

-------------
-- Test Cases
-------------
main = do
  -- Function Tests --
  --------------------
  print $ arith 5 1 3
  print $ arith 5 4 4

  print $ geo 5 1 3
  print $ geo 5 4 4

  print $ tri 5
  
  print $ sqr 5

  print $ cube 5

  print $ fib 5