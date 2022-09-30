module Interpreter where

import AbsNumbers

eval :: Exp -> Integer
eval (Num n) = n
eval (Neg n) = - (eval n)
eval (Plus n m) = (eval n) + (eval m)
eval (Sub n m) = (eval n) - (eval m)
eval (Times n m) = (eval n) * (eval m)
eval (Div n m) = (eval n) `div` (eval m)
eval (Mod n m) = (eval n) `mod` (eval m)
eval (Abs n) = abs (eval n)
eval (Expon n m) = (eval n) ^ (eval m)