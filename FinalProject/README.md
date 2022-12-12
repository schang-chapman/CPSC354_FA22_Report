# Final Project

### Sharon Chang
### Submission Date: Dec. 18 2022

sequence.hs utilizes the nature of infinite lists in Haskell to generate various mathematical functions as lists and then perform arithmetic functions with them. This README provides use instructions and details for each function. Information on the mathematical patterns themselves as well as observations made during this project can be found in the report.

My first milestone was on 11/13 to complete all the mathematical functions. My second milestone was on 12/4 to complete the arithmetic list function. This milestone was postponed and merged with the date of the third milestone on account of illness. My third milestone was on 12/11 to complete the list extension function and make it compatible with all my other functions.

# Mathematical Functions (Milestone 1: 11/13)
* Arithmetic: Takes in 3 inputs. The first is the length of the list. The second is the starting number of the list. The third is the number that will be added to the previous number to create the next number.
* Geometric: Takes in 3 inputs. The first is the length of the list. The second is the starting number of the list. The third is the number that will be multiplied against the previous number to create the next number.
* Triangle: Takes in 1 input determining the length of the list. Will generate a list of triangular numbers.
* Square: Takes in 1 input determining the length of the list. Will generate a list of squared numbers.
* Cube: Takes in 1 input determining the length of the list. Will generate a list of cubed numbers.
* Fibonacci: Takes in 1 input determining the length of the list. Will generate a list of Fibonacci numbers.

# List Functions (Milestone 2 + 3: 12/11)
* List Extension: Takes in 2 lists as inputs. Recursively calls on itself to extend the shorter list until it matches the length of the longer list by adding 0s to it. When lists are of equal length, returns both lists in a tuple.
* List Arithmetic: Takes in 3 inputs. The first two lists are extended via list extension if they are not the same length. When given two lists of the same length, this function performs one of 4 arithmetic functions with the lists. The third input is an integer that determines what function is performed with the lists. An error is thrown if the provided integer does not match any of the predetermined arithmetic functions.
  * Addition: Recursively adds each element from the two lists to each other.
  * Subtraction: Recursively subtracts the value of the second list from the value of the first list at each index.
  * Multiplication: Recursively multiplies each element from the two lists to each other.
  * Division: Recursively divides the value from the first list with the value of the second list at each index. This performs integer division with the div function. If the divisor value from the second list is 0, it will return a 0 for that index in order to avoid a divide by 0 error.