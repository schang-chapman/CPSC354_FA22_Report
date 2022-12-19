-- Performs functions using map function

-------------------------
-- Mathematical Sequences
-------------------------

-- Arithmetic
arith :: Integer -> Integer -> Integer -> [Integer]
arith l s n = map arith [1..l]
  where arith 1 = s
        arith n = s + (n-1)*n

-- Geometric
geo :: Integer -> Integer -> Integer -> [Integer]
geo l s n = map geo [1..l]
  where geo 1 = s
        geo n = s * n^n

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

---------------------
-- List Manipulations
---------------------

-- Filter
listFilter :: [Integer] -> [Integer] -> [Integer]
listFilter as bs = map listFilter (filter (flip notElem bs) as)
  where listFilter x = x

-- Match
listMatch :: [Integer] -> [Integer] -> [Integer]
listMatch as bs = map listMatch (filter (flip elem bs) as)
  where listMatch x = x

-- Sort
listSort :: [Integer] -> [Integer] -> String -> [Integer]
listSort as bs x = case x of
                    "asc" -> map listSort (filter (flip elem (as ++ bs)) [minimum (as ++ bs), minimum (as ++ bs)+1..maximum (as ++ bs)])
                    "desc" -> map listSort (filter (flip elem (as ++ bs)) [maximum (as ++ bs), maximum (as ++ bs)-1..minimum (as ++ bs)])
  where listSort x = x

-- Extension
listExt :: [Integer] -> [Integer] -> ([Integer], [Integer])
listExt as bs | length as > length bs = (as, map (\x -> if x < length bs then bs!!x else 0) [x | x <- [0..length as-1]])
              | length as < length bs = (map (\x -> if x < length as then as!!x else 0) [x | x <- [0..length bs-1]], bs)
              | otherwise = (as, bs)

-- Arithmetic
listArith :: [Integer] -> [Integer] -> Integer -> [Integer]
listArith as bs x | length as == length bs = case x of
                                              1 -> map (\x -> as!!x + bs!!x) [0..length as-1]
                                              2 -> map (\x -> as!!x - bs!!x) [0..length as-1]
                                              3 -> map (\x -> as!!x * bs!!x) [0..length as-1]
                                              4 -> map (\x -> if bs!!x == 0 then 0
                                                              else as!!x `div` bs!!x) [0..length as-1]
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