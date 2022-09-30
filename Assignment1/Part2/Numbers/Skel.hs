-- File generated by the BNF Converter (bnfc 2.9.4).

-- Templates for pattern matching on abstract syntax

{-# OPTIONS_GHC -fno-warn-unused-matches #-}

module Numbers.Skel where

import Prelude (($), Either(..), String, (++), Show, show)
import qualified Numbers.Abs

type Err = Either String
type Result = Err String

failure :: Show a => a -> Result
failure x = Left $ "Undefined case: " ++ show x

transExp :: Numbers.Abs.Exp -> Result
transExp x = case x of
  Numbers.Abs.Plus exp1 exp2 -> failure x
  Numbers.Abs.Times exp1 exp2 -> failure x
  Numbers.Abs.Num integer -> failure x
