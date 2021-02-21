
module Functional.Variator where

    import Collectional.Term
    import Apile.Base.Core

    -- φ
    freeVariables :: Term -> [Term]
    freeVariables e =
        case e of
            Emn             -> []
            Idn x           -> [Idn x]
            Abn p b         -> freeVariables b ∖ freeVariables p
            Apn f a         -> freeVariables f ∪ freeVariables a
            Trn s t         -> freeVariables s ∪ freeVariables t
            Cpn (Ain v u) k -> freeVariables v ∪ freeVariables u ∪ freeVariables k
            Cpn (Ayn v w) k -> freeVariables v ∪ freeVariables w ∪ freeVariables k

    -- ι
    identiative :: Term -> [Term]
    identiative e = error "wip -- identiative"
--         case e of
--             Emn             -> []
--             Idn x           -> [Idn x]
--             Abn p b         -> identiative p ∪ identiative b
--             Apn f a         -> identiative f ∪ identiative a
--             Trn s t         -> identiative s ∪ identiative t
--             Cpn (Ain v u) k -> identiative v ∪ identiative u ∪ identiative k
--             Cpn (Ayn v w) k -> identiative v ∪ identiative w ∪ identiative k

    -- ?
    applicative :: Term -> [Term]
    applicative e = error "wip -- applicative"
--         case e of
--             Emn             -> []
--             Idn x           -> []
--             Abn p b         -> applicative p ∪ applicative b
--             Apn f a         -> applicative f ∪ applicative a ∪ [Apn f a]
--             Trn s t         -> applicative s ∪ applicative t
--             Cpn (Ain v u) k -> applicative v ∪ applicative u ∪ applicative k
--             Cpn (Ayn v w) k -> applicative v ∪ applicative w ∪ applicative k

    -- Ι
    isAbsent :: Term -> Term -> Bool
    isAbsent i e =
        not (elem i (freeVariables e))

--
