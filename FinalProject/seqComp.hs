-- Performs functions using list comprehension

-------------------------
-- Mathematical Sequences
-------------------------

-- Arithmetic
arith :: Integer -> Integer -> Integer -> [Integer]
arith l s n = [s, s+n..s+n*(l-1)]

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

---------------------
-- List Manipulations
---------------------

-- Filter
-- listFilter :: [Integer] -> [Integer] -> [Integer]
-- listFilter as bs = TODO

-- Match
-- listMatch :: [Integer] -> [Integer] -> [Integer]
-- listMatch as bs = TODO

-- Sort
-- listSort :: [Integer] -> [Integer] -> String -> [Integer]
-- listSort as bs x = TODO

-- Extension
-- extension :: [Integer] -> [Integer] -> ([Integer], [Integer])
-- extension as bs = TODO

-- Arithmetic
-- listArith :: [Integer] -> [Integer] -> Integer -> [Integer]
-- listArith as bs x = TODO

-------------
-- Test Cases
-------------
main = do
  -- Function Tests --
  --------------------
  -- print $ arith 5 1 3
  -- print $ arith 5 4 4

  -- print $ geo 5 1 3
  -- print $ geo 5 4 4

  -- print $ tri 5
  
  -- print $ sqr 5

  -- print $ cube 5

  -- print $ fib 5


  -- List Manipulation Tests --
  -----------------------------
  -- print $ listFilter [1,2,3,4,5,6] [1,3,5]

  -- print $ listMatch [1,2,3,4,5,6] [1,3,5]

  -- print $ listSort [3,0,9,2,5,8] [6,5,1,7,4,2] "asc"
  -- print $ listSort [3,0,9,2,5,8] [6,5,1,7,4,2] "desc"

  -- print $ listExt [1,2,3] [4,5,6]
  -- print $ listExt [1,2,3] [4,5,6,7,8,9]
  -- print $ listExt [1,2,3,4,5,6] [7,8,9]

  -- print $ listArith [1,2,3] [4,5,6,7] 0
  -- print $ listArith [1,2,3] [4,5,6,7] 1
  -- print $ listArith [1,2,3] [4,5,6,7] 2
  -- print $ listArith [1,2,3] [4,5,6,7] 3