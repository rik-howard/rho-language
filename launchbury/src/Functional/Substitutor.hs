
module Functional.Substitutor where

    import Collectional.Term

    substitution :: (Term,  Term,  Term) -> Term
    substitution (n, o, e) =
        case e of
            Idn s           -> idnS n o s
            Abn p b         -> abnS n o p b
            Apn f a         -> apnS n o f a
            Cpn (Ain v u) k -> canS n o v u k

--

    idnS :: Term -> Term -> String -> Term
    idnS n o s
        | o == Idn s = n
        | otherwise  = Idn s

    abnS :: Term -> Term -> Term -> Term -> Term
    abnS n o p b
        | o == p = Abn p b
        | otherwise = Abn p (substitution (n, o, b))

    apnS :: Term -> Term -> Term -> Term -> Term
    apnS n o f a = Apn (substitution (n, o, f)) (substitution (n, o, a))

    canS :: Term -> Term -> Term -> Term -> Term -> Term
    canS n o v u k = Cpn (Ain v (substitution (n, o, u))) (substitution (n, o, k))

--
