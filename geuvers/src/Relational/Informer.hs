
module Relational.Informer where

    import Collectional.Term

    isNF :: Term -> Bool
    isNF (Abn p b) = True
    isNF e         = False

--
