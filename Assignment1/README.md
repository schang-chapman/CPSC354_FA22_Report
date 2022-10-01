# Critical Appraisal

### Sharon Chang
### Submission Date: Sept. 30 2022

## Part 1
This program was compiled with the help of the conversion table provided in the hints section of the assignment page. While NN and PP were largely constructed with the use of the construction tables, later functions relied more on GitHub CoPilot. I learned how to apply recursion in order to execute basic arithmetic operations with our given number formats, given that we cannot make the computer compute them for us. I would run the code from CoPilot and debug based on what errors came up. Functions were tested one by one as they were completed. I found working on the QQ functions with the conversion table especially helpful because it visually represented to me how the the various other number types were incorporated into a QQ number. There are no known errors.

```
divN (S (S (S (S O)))) (S (S O))
divN (S (S (S O))) (S (S O))
S (divN (S (S O)) (S (S O)))
S (divN (S O) (S (S O)))
S (S (divN (O) (S (S O))))
S (S (O))
```
The divN function recursively calls on itself, adding an S at the beginning each time the modulo of the given numbers is equal to one less than the divisor. When it eventually reaches the base case with a dividend of O, it returns a O, ending the recursion.

```
modN (S (S (S O))) (S (S O))
S (modN (S (S O)) (S (S O)))
S O
```
The modN function calls on itself during the comparison, checking if one less than the divisor is equal to the modulo of the current divisor and a dividend of one less than the given dividence. If it is equal, it produces an O, otherwise, it adds an S at the beginning of the output and recursively calls on itself with a dividend of one less and the given divisor.

```
nn_pp (T (T (T I)))
S (nn_pp (T (T I)))
S (S (nn_pp (T I)))
S (S (S (nn_pp I)))
S (S (S (S O))))
```
When converting positive type numbers to natural numbers, each call of the function adds an S to the start of the output and recursively calls itself with one less successor on the positive number. When we reach the base case positive number of I, it converts to the natural number S O and ends the function.

```
normalizeI II (S (S (S O))) (S (S (S (S O))))
normalizeI II (S (S O)) (S (S (S O)))
normalizeI II (S O) (S (S (S O)))
normalizeI II (O) (S (S (S O)))
II (O) (S (S (S O)))
```
The normalize function recursively calls on itself, removing a successor with each loop. When either side of the integer reaches O, the function ends and returns the resulting integer.

```
nbe II (S (S (S O))) (S (S (S (S O))))
II (O) (S (S (S O)))
```
The normalize by evalutaion simply converts both parts of the integer into Haskell integers. If they are equal, it returns II O O, otherwise, it will subtract part B of the integer from part A and convert that back into an II format integer.

## Part 2

