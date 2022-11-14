----------------------------------------------
-- Mathematical Sequences (Milestone 1: 11/13)
----------------------------------------------

-- Arithmetic
-- arith :: Integer -> Integer -> Integer -> [Integer]
-- TODO

-- Geometric
-- geo :: Integer -> Integer -> Integer -> [Integer]
-- TODO

-- Triangle
tri :: Integer -> [Integer]
tri l = map tri [1..l]
    where tri 0 = 0
          tri 1 = 1
          tri n = n + tri (n-1)

-- Square
sqr :: Integer -> [Integer]
sqr l = map (^2) [1..l]

-- Cube
cube :: Integer -> [Integer]
cube l = map (^3) [1..l]

-- Fibonacci
fib :: Integer -> [Integer]
fib l = map fib [0..l-1]
  where fib 0 = 0
        fib 1 = 1
        fib n = fib (n-1) + fib (n-2)

--------------------------------------
-- List Arithmetic (Milestone 2: 12/4)
--------------------------------------

-- Addition
-- TODO

-- Subtraction
-- TODO

-- Multiplication
-- TODO

-- (Integer) Division
-- TODO

--------------------------------------
-- List Extension (Milestone 3: 12/11)
--------------------------------------

-- TODO

-------------
-- Test Cases
-------------
main = do
  -- Function Tests

  -- Arithmetic
  -- Geometric
  print $ tri 4
  -- print $ sqr 5
  -- print $ cube 5
  -- print $ fib 5

  -- List Arithmetic Tests

  -- Addition
  -- Subtraction
  -- Multiplication
  -- Division

  -- Extension