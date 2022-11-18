# Assignment 2 Critical Appraisal

### Sharon Chang
### Submission Date: Nov. 18 2022

# Why #:# Doesn't Work but (#):# Does

I assume that because when you type #:# it assumes that the first hash itself is a complete empty list, and therefore has issues reconciling that with the following :#. Items within a parentheses are not treated as such, so adding the parentheses there tricks the program into recognizing it as an item to be added to an empty list, rather than an empty list in and of itself.

This is my guess but I am not very confident in it. I feel like it would make sense to change the grammar to accomodate #:# because the current format would be very unintuitive if included as part of an official programming language.

# Personal Observations

I noticed while writing out Task 2 of Part 2 that functions written in LambdaNat5 cannot call other functions even within the same file. In order for a function to recognize the existence of another function, I had to include it as the input of the other function, as seen in my implementation of append and reverse. What would we need to do in order to facilitate calling a function without having to embed it as the input of another? Why is it that LambdaNat5 currently does not function in this way?

Additionally, I noticed that while we did not have error messages, LambdaNat5 would behave strangely if given commands it did not comprehend, such as parrotting my code back at me or vomiting out strings of machine code. What causes these to happen?

# How LambdaNat4 Enables Multiple Test Cases

From what I understand, the only difference is 1 line of code in the grammar file.

```
separator Exp ";;" ;
```
This seems to be a built-in feature of the grammar system we are using, where indicating a separator expression will allow you to mark the end of a test case, because otherwise, the program will simply stop working when it reaches a newline preceding your next test case because it does not understand how to parse it.

# LambdaNat5 vs Calculator

LambdaNat5 is not actually capable of doing math on account of not comprehending what numbers are. Everything in LambdaNat5 is parsed as an expression and it does not know what a number is and how to perform functions with them.

The Calculator is different because it is built in Haskell, which is already capable of handling the concept of numbers and math. This means that it is capable of parsing and performing arithmetic through itself.

This difference is why you cannot implement arithmetic as follows:
```
evalCBN (EPlus e1 e2) = (evalCBN e1) + (evalCBN e2)
```
Doing it this way will not work because LambdaNat5 is only capable of inputting and outputting expressions. This will output an integer, which LambdaNat5 does not comprehend because it is not an expression. That is why whenever you want LambdaNat5 to output an integer, you need to encase it in EINt(), which will then allow LambdaNat5 to recognize the value as an expression.

Imagine something like children hiding inside a trenchcoat to get into an adult-rated movie. The integer is the child and EInt() is the trenchcoat.

I think that +,-, and * are call by value but I am not entirely sure. I think it is call by value because the functions will continuously recur themselves until they reach a point where recursion can no longer continue, at which point it will evaluate itself, which I think makes them call by value. Assuming I am correct, the reason for this could be for efficiency. It would be most efficient to reduce an expression as much as possible before evaluating it instead of having to constantly reevaluate it and check to see if there are more steps to do, which could result in redundant reevaluation.

# LambdaNat5 vs Haskell

LambdaNat5 functions closer to a traditional programming language, albeit a very basic one. Functions have to be declared with their input with a body to the function that dictates what commands are to be performed when it is called.

Haskell instead looks and functions closer to a series of equations rather than resembling any traditional programming language. It comes with clear error messages, in contrast to LambdaNat5 which does not have error messages because we have not programmed any into it. It is also much simpler to program things in Haskell on account of it being not as primitive as LambdaNat5.

# Weave and Sort

No, I did not notice weave could satisfy the invariant of an output list being sorted provided that the input was also sorted.

If we were to make a sort function, we could run two sorted functions through the weave function in order to ensure that elements were properly sorted. If the weave of these two sorted functions is not sorted, then we can assume that there is a problem with the sort function.