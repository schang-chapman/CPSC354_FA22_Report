# Final Project

### Sharon Chang
### Submission Date: Dec. 18 2022

Each Haskell file in this folder contains the same set of 11 functions. The difference is that each file uses a different approach to infinite lists in order to accomplish the same results. The following instructions list each of the functions and the necessary inputs to use them. The functions have the same names and inputs across each Haskell file.

# Mathematical Functions
### Arithmetic: ```arith :: Integer -> Integer -> Integer -> [Integer]```

Inputs:
  1. Length of resulting list
  2. Starting number of resulting list
  3. Number that will be added to the previous number to create the next number in resulting list

Output: Arithmetic number sequence

### Geometric: ```geo :: Integer -> Integer -> Integer -> [Integer]```
Inputs:
  1. Length of resulting list
  2. Starting number of resulting list
  3. Number that will be multiplied against the previous number to create the next number in resulting list

Output: Geometric number sequence

### Triangle: ```tri :: Integer -> [Integer]```
Input: Length of resulting list <br />
Output: Triangular number sequence

### Square: ```sqr :: Integer -> [Integer]```
Input: Length of resulting list <br />
Output: Squared number sequence

### Cube: ```cube :: Integer -> [Integer]```
Input: Length of resulting list <br />
Output: Cubed number sequence

### Fibonacci: ```fib :: Integer -> [Integer]```
Input: Length of resulting list <br />
Output: Fibonacci number sequence

# List Functions

### List Filter: ```listFilter :: [Integer] -> [Integer] -> [Integer]```
Inputs:
  1. List of integers to be output
  2. List of integers to be removed from output list

Output: List of all elements unique to the first list 

### List Match: ```listMatch :: [Integer] -> [Integer] -> [Integer]```
Inputs:
  1. List of integers
  2. List of integers

Output: List of all elements present in both lists

### List Sort: ```listSort :: [Integer] -> [Integer] -> String -> [Integer]```
Inputs:
  1. List of integers
  2. List of integers
  3. String dictating whether the resulting list is sorted in ascending or descending order

Output: List of all elements in both lists sorted by numerical order

### List Extension: ```listExt :: [Integer] -> [Integer] -> ([Integer], [Integer])```
Inputs:
  1. List of integers
  2. List of integers

Output: Tuple containing both input lists equalized to the same length <br />
(The shorter list will have 0s added onto it until it matches the length of the longer list.)

### List Arithmetic: ```listArith :: [Integer] -> [Integer] -> Integer -> [Integer]```
Inputs:
  1. List of integers
  2. List of integers
  3. Integer indicating desired list arithmetic function as follows: <br />
    1. Addition: Adds each element from the two lists to each other <br />
    2. Subtraction: Subtracts the value of the second list from the value of the first list at each index <br />
    3. Multiplication: Multiplies each element from the two lists to each other <br />
    4. Division: Divides the value from the first list with the value of the second list at each index <br />
    (Will return 0 in instances of divide by 0.)

Output: Result of arithmetic function as a single list