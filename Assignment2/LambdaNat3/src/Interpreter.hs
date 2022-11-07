module Interpreter ( execCBN ) where

import AbsLambdaNat 
import ErrM
import PrintLambdaNat

execCBN :: Program -> Exp  
execCBN (Prog e) = evalCBN e
evalCBN :: Exp -> Exp  
evalCBN (EApp e1 e2) = case (evalCBN e1) of
    (EAbs i e3) -> evalCBN (subst i e2 e3)
    e3 -> EApp e3 e2
evalCBN ENat0 = ENat0 
evalCBN (ENatS e) = ENatS (evalCBN e)
evalCBN (EIf (ENat0) (ENatS e1) (ENatS e2) (ENatS e3)) =
    if (evalCBN e1) == (evalCBN e2) then (ENatS e3) else (ENatS (ENatS e3))
evalCBN (ELet (Id i) (ENatS e1) (ENatS e2)) =
    let f = fresh (ENatS e1)
        e3 = subst (Id i) (EVar f) (ENatS e2) in
        ENatS (subst f (ENatS e1) e3)
evalCBN (EMinusOne (ENatS e)) =
    if (evalCBN e) == ENatS (ENat0) then ENat0 else ENatS (EMinusOne (ENatS e))
evalCBN x = x -- this is a catch all clause, currently only for variables, must be the last clause of the eval function

-- a quick and dirty way of getting fresh names. Rather inefficient for big terms...
fresh_aux :: Exp -> String
fresh_aux (EVar (Id i)) = i ++ "0"
fresh_aux (EApp e1 e2) = fresh_aux e1 ++ fresh_aux e2
fresh_aux (EAbs (Id i) e) = i ++ fresh_aux e
fresh_aux _ = "0"

fresh = Id . fresh_aux -- for Id see AbsLamdaNat.hs

-- subst implements the beta rule
-- (\x.e)e' reduces to subst x e' e
subst :: Id -> Exp -> Exp -> Exp
subst id s (EVar id1) | id == id1 = s
                      | otherwise = EVar id1
subst id s (EApp e1 e2) = EApp (subst id s e1) (subst id s e2)
subst id s (EAbs id1 e1) = 
    let f = fresh (EAbs id1 e1)
        e2 = subst id1 (EVar f) e1 in 
        EAbs f (subst id s e2)
subst id s (EIf (ENat0) (ENatS e1) (ENatS e2) (ENatS e3)) =
    if (subst id s e1) == (subst id s e2) then (ENatS e3) else (ENatS (ENatS e3))
subst id s (ELet (Id i) (ENatS e1) (ENatS e2)) =
    let f = fresh (ENatS e1)
        e3 = subst (Id i) (EVar f) (ENatS e2) in
        ENatS (subst f (ENatS e1) e3)
subst id s (EMinusOne e) =
    if (subst id s e) == ENatS (ENat0) then ENat0 else ENatS (EMinusOne (ENatS e))
subst id s ENat0 = ENat0 
subst id s (ENatS e) = ENatS (subst id s e)
