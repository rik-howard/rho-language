
module Functional.Substitutor where

    import Collectional.Term
    import Collectional.Heap

--
{-
    -- σ
    substitutions :: (Term, Term, Heap) -> Heap
    substitutions (n, o, h) =
        case h of
            Emn             -> Emn
            Cpn (Ain v w) k -> substitutions' n o v w k

    substitutions' :: Term -> Term -> Term -> Term -> Heap -> Heap
    substitutions' n o v w h =
        let
            v' = substitution  (n, o, v)
            w' = substitution  (n, o, w)
            h' = substitutions (n, o, h)
        in Cpn (Ain v' w') h'
-}
--

    -- σ′
    substitution :: (Term,  Term,  Term) -> Term
    substitution (n, o, e) =
        case e of
            Emn     -> emnS n o
            Idn x   -> idnS n o x
            Abn p b -> abnS n o p b
            Apn f a -> apnS n o f a
            Trn s t -> trnS n o s t
            Ain v u -> ainS n o v u
            Ayn v w -> aynS n o v w
            Cpn l k -> cpnS n o l k

--

    emnS :: Term -> Term -> Term
    emnS n o =
        Emn

    idnS :: Term -> Term -> String -> Term
    idnS n o x
        | o == Idn x = n
        | otherwise  = Idn x

    abnS :: Term -> Term -> Term -> Term -> Term
    abnS n o p b
        | o == p = Abn p b
        | otherwise = Abn p (substitution (n, o, b))

    apnS :: Term -> Term -> Term -> Term -> Term
    apnS n o f a =
        Apn (substitution (n, o, f)) (substitution (n, o, a))

    trnS :: Term -> Term -> Term -> Term -> Term
    trnS n o s t
        | o == s = Trn s t
        | otherwise = Trn s (substitution (n, o, t))

    ainS :: Term -> Term -> Term -> Term -> Term
    ainS n o v u =
        Ain (substitution (n, o, v)) (substitution (n, o, u))

    aynS :: Term -> Term -> Term -> Term -> Term
    aynS n o v w =
        Ayn (substitution (n, o, v)) (substitution (n, o, w))

    cpnS :: Term -> Term -> Term -> Term -> Term
    cpnS n o l k =
        Cpn (substitution (n, o, l)) (substitution (n, o, k))

--
