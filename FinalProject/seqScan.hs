-- Performs functions using scanl function

-------------------------
-- Mathematical Sequences
-------------------------

-- Arithmetic
arith :: Integer -> Integer -> Integer -> [Integer]
arith l s n = scanl (+) s (replicate (fromIntegral l-1) n)

-- Geometric
geo :: Integer -> Integer -> Integer -> [Integer]
geo l s n = scanl (*) s (replicate (fromIntegral l-1) n)

-- Triangle
tri :: Integer -> [Integer]
tri l = tail (scanl (+) 0 [1..l])

-- Square
sqr :: Integer -> [Integer]
sqr l = scanl (*) 1 (replicate (fromIntegral l) 2)

-- Cube
cube :: Integer -> [Integer]
cube l = scanl (*) 1 (replicate (fromIntegral l) 3)

-- Fibonacci
fib :: Integer -> [Integer]
fib l = take (fromIntegral l) (0 : scanl (+) 1 (fib l))

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