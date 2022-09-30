-- A Virtual Machine (VM) for Arithmetic (template)
-- Copyright: Alexander Kurz 2022

-----------------------
-- Data types of the VM
-----------------------

-- Natural numbers
data NN = O | S NN
  deriving (Eq,Show) -- for equality and printing

-- Integers
data II = II NN NN
  deriving Show -- for printing

-- Positive integers (to avoid dividing by 0)
data PP = I | T PP
  deriving (Eq,Show) -- for equality and printing

-- Rational numbers
data QQ =  QQ II PP
  deriving (Eq,Show) -- for equality and printing

------------------------
-- Arithmetic on the  VM
------------------------

----------------
-- PP Arithmetic
----------------

-- add positive numbers
addP :: PP -> PP -> PP
addP I p = T p
addP (T n) p = T (addP n p)

-- multiply positive numbers
multP :: PP -> PP -> PP
multP I p = p
multP (T n) p = addP (multP n p) p

-- convert numbers of type PP to numbers of type NN
nn_pp :: PP -> NN
nn_pp I = S O
nn_pp (T p) = S (nn_pp p)

-- convert numbers of type PP to numbers of type II
ii_pp :: PP -> II
ii_pp I = II (S O) O
ii_pp (T p) = II (nn_pp (T p)) O

----------------
-- NN Arithmetic
----------------

-- add natural numbers
addN :: NN -> NN -> NN
addN O m = m
addN (S n) m = S (addN n m)

-- multiply natural numbers
multN :: NN -> NN -> NN
multN O m = O
multN (S n) m = addN (multN n m) m

-- division, eg 13 divided by 5 is 2 
divN :: NN -> PP -> NN
divN O n = O
divN (S m) (T n) | (nn_pp n) == (modN m (T n)) = S (divN m (T n))
                | otherwise = divN m (T n)

-- remainder, eg 13 modulo by 5 is 3
modN :: NN -> PP -> NN
modN O n = O
modN (S m) (T n) | (nn_pp n) == (modN m (T n)) = O
                | otherwise = S (modN m (T n))

----------------
-- II Arithmetic
----------------

-- Addition: (a-b)+(c-d)=(a+c)-(b+d)
addI :: II -> II -> II
addI (II a b) (II c d) = II (addN (addN a c) (multN b d)) (addN b d)

-- Multiplication: (a-b)*(c-d)=(ac+bd)-(ad+bc)
multI :: II -> II -> II
multI (II a b) (II c d) = II (addN (multN a c) (multN b d)) (addN (multN a d) (multN b c))

-- Negation: -(a-b)=(b-a)
negI :: II -> II
negI (II a b) = II b a

-- Equality of integers
instance Eq II where
  (II a b) == (II c d) = (addN a d) == (addN b c)

----------------
-- QQ Arithmetic
----------------

-- Addition: (a/b)+(c/d)=(ad+bc)/(bd)
addQ :: QQ -> QQ -> QQ
addQ (QQ (II a b) I) (QQ (II d e) I) = (QQ (addI (II a b) (II d e)) I)
addQ (QQ (II a b) (T c)) (QQ (II d e) (T f)) = (QQ (addI (multI (II a b) (ii_pp (T f))) (multI (ii_pp (T c)) (II d e))) (multP (T c) (T f)))

-- Multiplication: (a/b)*(c/d)=(ac)/(bd)
--multQ :: QQ -> QQ -> QQ

-- Equality of fractions
--instance Eq QQ where
--  (QQ a b) == (QQ c d) =

----------------
-- Normalisation
----------------


----------------------------------------------------
-- Converting between VM-numbers and Haskell-numbers
----------------------------------------------------


----------
-- Testing
----------
main = do
  print $ multP (I) (T I)
  print $ addQ (QQ (II (S O) O) (T I)) (QQ (II (S O) O) (T I))