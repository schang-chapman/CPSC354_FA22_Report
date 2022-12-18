-- Performs functions using list comprehension

-------------------------
-- Mathematical Sequences
-------------------------

-- Arithmetic
arith :: Integer -> Integer -> Integer -> [Integer]
arith l s n = [s, s+n..s+n*(l-1)]

-- Geometric
geo :: Integer -> Integer -> Integer -> [Integer]
geo l s n = [s * n^x | x <- [0..l-1]]

-- Triangle
tri :: Integer -> [Integer]
tri l = [sum [1..x] | x <- [1..l]]

-- Square
sqr :: Integer -> [Integer]
sqr l = [x^2 | x <- [1..l]]

-- Cube
cube :: Integer -> [Integer]
cube l = [x^3 | x <- [1..l]]

-- Fibonacci
fib :: Integer -> [Integer]
fib l = [fib x | x <- [0..l-1]]
  where fib 0 = 0
        fib 1 = 1
        fib n = fib (n-1) + fib (n-2)

---------------------
-- List Manipulations
---------------------

-- Filter
listFilter :: [Integer] -> [Integer] -> [Integer]
listFilter as bs = [x | x <- as, not (x `elem` bs)]

-- Match
listMatch :: [Integer] -> [Integer] -> [Integer]
listMatch as bs = [x | x <- as, x `elem` bs]

-- Sort
listSort :: [Integer] -> [Integer] -> String -> [Integer]
listSort [] [] x = []
listSort as [] x = case x of
                    "asc" -> listMatch [minimum as, minimum as+1..maximum as] as
                    "desc" -> listMatch [maximum as, maximum as-1..minimum as] as
listSort [] bs x = case x of
                    "asc" -> listMatch [minimum bs, minimum bs+1..maximum bs] bs
                    "desc" -> listMatch [maximum bs, maximum bs-1..minimum bs] bs
listSort as bs x = case x of
                    "asc" -> listSort (as ++ bs) [] "asc"
                    "desc" -> listSort (as ++ bs) [] "desc"

-- Extension
listExt :: [Integer] -> [Integer] -> ([Integer], [Integer])
listExt as bs | length as > length bs = (as, bs ++ [0 | x <- [1..length as - length bs]])
                | length as < length bs = (as ++ [0 | x <- [1..length bs - length as]], bs)
                | otherwise = (as, bs)

-- Arithmetic
listArith :: [Integer] -> [Integer] -> Integer -> [Integer]
listArith [] [] x= []
listArith as bs x | length as == length bs = case x of 
                                              1 -> [as!!x + bs!!x | x <- [0..length as - 1]]
                                              2 -> [as!!x - bs!!x | x <- [0..length as - 1]]
                                              3 -> [as!!x * bs!!x | x <- [0..length as - 1]]
                                              4 -> [if bs!!x == 0 then 0
                                                    else div (as!!x) (bs!!x) | x <- [0..length as - 1]]
                  | otherwise = listArith (fst (listExt as bs)) (snd (listExt as bs)) x

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


  -- List Manipulation Tests --
  -----------------------------
  print $ listFilter [1,2,3,4,5,6] [1,3,5]

  print $ listMatch [1,2,3,4,5,6] [1,3,5]

  print $ listSort [2,0,4,5,1,3] [] "asc"
  print $ listSort [2,0,4,5,1,3] [] "desc"
  print $ listSort [] [2,0,4,5,1,3] "asc"
  print $ listSort [] [2,0,4,5,1,3] "desc"
  print $ listSort [3,0,9,2,5,8] [6,5,1,7,4,2] "asc"
  print $ listSort [3,0,9,2,5,8] [6,5,1,7,4,2] "desc"

  print $ listExt [1,2,3] [4,5,6]
  print $ listExt [1,2,3] [4,5,6,7,8,9]
  print $ listExt [1,2,3,4,5,6] [7,8,9]

  print $ listArith [5,4,3] [2,1] 1
  print $ listArith [5,4,3] [2,1] 2
  print $ listArith [5,4,3] [2,1] 3
  print $ listArith [5,4,3] [2,1] 4