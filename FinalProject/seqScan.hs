-- Performs functions using scanl function

-------------------------
-- Mathematical Sequences
-------------------------

-- Arithmetic
-- arith :: Integer -> Integer -> Integer -> [Integer]
-- arith l s n = TODO

-- Geometric
-- geo :: Integer -> Integer -> Integer -> [Integer]
-- geo l s n = TODO

-- Triangle
-- tri :: Integer -> [Integer]
-- tri l = TODO

-- Square
-- sqr :: Integer -> [Integer]
-- sqr l = TODO

-- Cube
-- cube :: Integer -> [Integer]
-- cube l = TODO

-- Fibonacci
-- fib :: Integer -> [Integer]
-- fib l = TODO

-----------------
-- List Extension
-----------------

-- Extension
-- extension :: [Integer] -> [Integer] -> ([Integer], [Integer])
-- extension as bs = TODO

------------------
-- List Arithmetic
------------------

-- listArith :: [Integer] -> [Integer] -> Integer -> [Integer]
-- listArith as bs x = TODO

-------------
-- Test Cases
-------------
main = do
  -- Function Tests --
  -- print $ arith 3 1 6
  -- print $ geo 3 1 6
  -- print $ tri 4
  -- print $ sqr 5
  -- print $ cube 5
  -- print $ fib 5

  -- Extension --
  -- print $ extension [1,2,3] [4,5,6]
  -- print $ extension [1,2,3] [4,5,6,7,8,9]
  -- print $ extension [1,2,3,4,5,6] [7,8,9]

  -- List Arithmetic Tests --
  -- print $ listArith [1,2,3] [4,5,6,7] 0
  -- print $ listArith (tri 7) (arith 2 1 5) 0
  -- print $ listArith [1,2,3] [4,5,6,7] 1
  -- print $ listArith (tri 7) (arith 2 1 5) 1
  -- print $ listArith [1,2,3] [4,5,6,7] 2
  -- print $ listArith (tri 7) (arith 2 1 5) 2
  -- print $ listArith [1,2,3] [4,5,6,7] 3
  -- print $ listArith (tri 7) (arith 2 1 5) 3

  -- List Manipulation Tests --
  -- TODO