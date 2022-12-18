-- Performs functions using recursion

-------------------------
-- Mathematical Sequences
-------------------------

-- Arithmetic
-- arith :: Integer -> Integer -> Integer -> [Integer]
-- arith l s n = TODO

-- Geometric
geo :: Integer -> Integer -> Integer -> [Integer]
geo l s n | l == 0 = []
          | l == 1 = [s]
          | otherwise = s : geo (l-1) (s*n) n

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
listExt :: [Integer] -> [Integer] -> ([Integer], [Integer])
listExt as bs | length as < length bs = extension (as ++ [0]) bs
                | length as > length bs = extension as (bs ++ [0])
                | otherwise = (as, bs)

-- Arithmetic
listArith :: [Integer] -> [Integer] -> Integer -> [Integer]
listArith [] [] x= []
listArith (a:as) (b:bs) x | length (a:as) == length (b:bs) = if x == 0 then (a+b) : listArith as bs x
                                                             else if x == 1 then (a-b) : listArith as bs x
                                                             else if x == 2 then (a*b) : listArith as bs x
                                                             else if x == 3 then if b == 0 then 0 : listArith as bs x
                                                                                 else (div a b) : listArith as bs x
                                                             else error "Invalid list arithmetic operation"
                          | otherwise = listArith (fst (extension (a:as) (b:bs))) (snd (extension (a:as) (b:bs))) x

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