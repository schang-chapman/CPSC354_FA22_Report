-- is_empty
is_empty :: [a] -> Bool
is_empty xs | length xs == 0 = True
            | otherwise = False

-- fibonacci
fibonacci :: Integer -> Integer
fibonacci l | l == 0 = 0
            | l == 1 = 1
            | otherwise = fibonacci (l-1) + fibonacci (l-2)

-- length
len :: [a] -> Integer
len [] = 0
len (x:xs) = (len xs) + 1

-- even
evenList :: [a] -> Bool
evenList xs | len xs == 0 = True
            | len xs == 1 = False
            | otherwise = evenList (tail (tail xs))

-- revert
revert :: [a] -> [a]
revert [] = []
revert xs = (revert (tail xs)) ++ (head xs : [])

-- weave
weave :: [a] -> [a] -> [a]
weave [] [] = []
weave xs ys = (head xs : []) ++ (head ys : []) ++ (weave (tail xs) (tail ys))

-------------
-- Test Cases
-------------
main = do
    -- print $ is_empty []
    -- print $ is_empty [1,2,3]
    -- print $ fibonacci 6
    -- print $ len [1,2,3,4,5,6,7,8,9,10]
    -- print $ evenList [1,2,3,4,5,6,7,8,9,10]
    -- print $ evenList [1,2,3,4,5,6,7,8,9]
    -- print $ revert [1,2,3,4,5,6,7,8,9,10]
    print $ weave [1,2,3,4,5] [6,7,8,9,10]