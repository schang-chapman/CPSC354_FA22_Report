----------------------------------------------
-- Mathematical Sequences (Milestone 1: 11/13)
----------------------------------------------

-- Arithmetic
arith :: Integer -> Integer -> Integer -> [Integer]
arith l s n = [s, s+n..s+n*(l-1)]

-- Geometric
geo :: Integer -> Integer -> Integer -> [Integer]
geo l s n | l == 0 = []
          | l == 1 = [s]
          | otherwise = s : geo (l-1) (s*n) n

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
-- List Extension (Milestone 2 + 3: 12/11)
--------------------------------------

-- Extension
extension :: [Integer] -> [Integer] -> ([Integer], [Integer])
extension as bs | length as < length bs = extension (as ++ [0]) bs
                | length as > length bs = extension as (bs ++ [0])
                | otherwise = (as, bs)

--------------------------------------
-- List Arithmetic (Milestone 2 + 3: 12/11)
--------------------------------------

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
  print $ arith 3 1 6
  print $ geo 3 1 6
  print $ tri 4
  print $ sqr 5
  print $ cube 5
  print $ fib 5

  -- Extension --
  print $ extension [1,2,3] [4,5,6]
  print $ extension [1,2,3] [4,5,6,7,8,9]
  print $ extension [1,2,3,4,5,6] [7,8,9]

  -- List Arithmetic Tests --
  print $ listArith [1,2,3] [4,5,6,7] 0
  print $ listArith (tri 7) (arith 2 1 5) 0
  print $ listArith [1,2,3] [4,5,6,7] 1
  print $ listArith (tri 7) (arith 2 1 5) 1
  print $ listArith [1,2,3] [4,5,6,7] 2
  print $ listArith (tri 7) (arith 2 1 5) 2
  print $ listArith [1,2,3] [4,5,6,7] 3
  print $ listArith (tri 7) (arith 2 1 5) 3