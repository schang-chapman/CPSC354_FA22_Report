-- Performs functions using recursion

-------------------------
-- Mathematical Sequences
-------------------------

-- Arithmetic
arith :: Integer -> Integer -> Integer -> [Integer]
arith l s n | l == 0 = []
            | l == 1 = [s]
            | otherwise = s : arith (l-1) (s+n) n

-- Geometric
geo :: Integer -> Integer -> Integer -> [Integer]
geo l s n | l == 0 = []
          | l == 1 = [s]
          | otherwise = s : geo (l-1) (s*n) n

-- Triangle
tri :: Integer -> [Integer]
tri l | l == 0 = []
      | otherwise = tri (l-1) ++ [l*(l+1) `div` 2]

-- Square
sqr :: Integer -> [Integer]
sqr l | l == 0 = []
      | otherwise = sqr (l-1) ++ [l^2]

-- Cube
cube :: Integer -> [Integer]
cube l | l == 0 = []
       | otherwise = cube (l-1) ++ [l^3]

-- Fibonacci
fib :: Integer -> [Integer]
fib l | l == 0 = []
      | l == 1 = [0]
      | l == 2 = [0, 1]
      | otherwise = fib (l-1) ++ [fib (l-1) !! (fromIntegral (l-2)) + fib (l-1) !! (fromIntegral (l-3))]

---------------------
-- List Manipulations
---------------------

-- Filter
listFilter :: [Integer] -> [Integer] -> [Integer]
listFilter [] [] = []
listFilter [] bs = []
listFilter as [] = as
listFilter as (b:bs) = case (elem b as) of
                        True -> listFilter (filter (/=b) as) bs
                        False -> listFilter as bs

-- Match
listMatch :: [Integer] -> [Integer] -> [Integer]
listMatch [] [] = []
listMatch [] bs = []
listMatch as [] = []
listMatch as (b:bs) = case (elem b as) of
                        True -> b : listMatch (filter (/=b) as) bs
                        False -> listMatch as bs

-- Sort
listSort :: [Integer] -> [Integer] -> String -> [Integer]
listSort [] [] x = []
listSort as [] x = case x of
                    "asc" -> [minimum as] ++ listSort (filter (/=minimum as) as) [] x
                    "desc" -> [maximum as] ++ listSort (filter (/=maximum as) as) [] x
                    
listSort [] bs x = case x of
                    "asc" -> [minimum bs] ++ listSort [] (filter (/=minimum bs) bs) x
                    "desc" -> [maximum bs] ++ listSort [] (filter (/=maximum bs) bs) x
listSort as bs x = case x of
                    "asc" -> listSort (as ++ bs) [] "asc"
                    "desc" -> listSort (as ++ bs) [] "desc"

-- Extension
listExt :: [Integer] -> [Integer] -> ([Integer], [Integer])
listExt as bs | length as < length bs = listExt (as ++ [0]) bs
              | length as > length bs = listExt as (bs ++ [0])
              | otherwise = (as, bs)

-- Arithmetic
listArith :: [Integer] -> [Integer] -> Integer -> [Integer]
listArith [] [] x= []
listArith (a:as) (b:bs) x | length (a:as) == length (b:bs) = case x of 
                                                              1 -> (a+b) : listArith as bs x
                                                              2 -> (a-b) : listArith as bs x
                                                              3 -> (a*b) : listArith as bs x
                                                              4 -> if b == 0 then 0 : listArith as bs x
                                                                   else (div a b) : listArith as bs x
                          | otherwise = listArith (fst (listExt (a:as) (b:bs))) (snd (listExt (a:as) (b:bs))) x

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