
module Functional.Distinguisher where

    import Collectional.Term
    import Functional.Substitutor

    distinguishing :: (Int,  Term) -> (Int, Term)
    distinguishing (n, e) =
        case e of
            Idn s           -> idnD n s
            Abn p b         -> abnD n p b
            Apn f a         -> apnD n f a
            Cpn (Ain v u) k -> canD n v u k

--

    idnD :: Int -> String -> (Int, Term)
    idnD n s = (n, Idn s)

    abnD :: Int -> Term -> Term -> (Int, Term)
    abnD n p b =
        let
            new        = Idn (show n)
            (n' , b' ) = (n + 1, substitution (new, p, b))
            (n'', b'') = distinguishing (n', b')
        in (n'', Abn new b'')

    apnD :: Int -> Term -> Term -> (Int, Term)
    apnD n f a =
        let
            (n' , f') = distinguishing (n , f)
            (n'', a') = distinguishing (n', a)
        in (n'', Apn f' a')

    canD :: Int -> Term -> Term -> Term -> (Int, Term)
    canD n v u k =
        let
            (n' , u') = distinguishing (n , u)
            (n'', k') = distinguishing (n', k)
        in (n'', Cpn (Ain v u') k')

--
