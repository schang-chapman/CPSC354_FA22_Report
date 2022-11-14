----------------------------------------------
-- Mathematical Sequences (Milestone 1: 11/13)
----------------------------------------------

-- Arithmetic
arith :: Integer -> Integer -> Integer -> [Integer]
-- TODO

-- Geometric
geo :: Integer -> Integer -> Integer -> [Integer]
-- TODO

-- Triangle
square :: Integer -> [Integer]
-- TODO

-- Square
square :: Integer -> [Integer]
-- TODO

-- Cube
cube :: Integer -> [Integer]
-- TODO

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
  -- Arithmetic
  -- Geometric
  -- Triangle
  -- Square
  -- Cube
  print $ fib 5

  -- Addition
  -- Subtraction
  -- Multiplication
  -- Division
  
  -- Extension