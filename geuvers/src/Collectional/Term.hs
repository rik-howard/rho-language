
module Collectional.Term where

    import Apile.Base.Core

    -- Λ
    data Term
        = Cpn Term Term
        | Ayn Term Term
        | Ain Term Term
        | Trn Term Term
        | Apn Term Term
        | Abn Term Term
        | Idn String
        | Emn
          deriving (Eq, Show, Read)

--

    -- λ₊
    enterming :: String -> (String, Term)
    enterming (c:x) =
        let
            binaryE :: (Term -> Term -> Term) -> String -> (String, Term)
            binaryE r x =
                let
                    (x' , e) = enterming x
                    (x'', o) = enterming x'
                in (x'', r e o)
        in case c of
            ';' -> binaryE Cpn x
            '<' -> binaryE Ayn x
            ':' -> binaryE Ain x
            '>' -> binaryE Trn x
            '·' -> binaryE Apn x
            '^' -> binaryE Abn x
            ' ' -> enterming x
            'ø' -> (x, Emn)
            _   -> (x, Idn [c])

    -- λ₋
    determing :: (String, Term) -> String
    determing (x, e) = error "wip -- determing"

--

    -- λ₀
    entermer :: Term -> (Term -> Term -> Term)
    entermer e =
        case e of
            Abn p b -> Abn
            Apn f a -> Apn
            Trn s t -> Trn
            Ain v u -> Ain
            Ayn v w -> Ayn
            Cpn l k -> Cpn

    -- λ₁
    entermee :: Term -> Term
    entermee e =
        case e of
            Abn p b -> p
            Apn f a -> f
            Trn s t -> s
            Ain v u -> v
            Ayn v w -> v
            Cpn l k -> l

    -- λ₂
    entermeo :: Term -> Term
    entermeo e =
        case e of
            Abn p b -> b
            Apn f a -> a
            Trn s t -> t
            Ain v u -> u
            Ayn v w -> w
            Cpn l k -> k

--

    -- Η
    isHomotypical :: (Term, Term) -> Bool
    isHomotypical (e, o) =
        case (e, o) of
            (Emn    , Emn    ) -> True
            (Idn _  , Idn _  ) -> True
            (Abn _ _, Abn _ _) -> True
            (Apn _ _, Apn _ _) -> True
            (Trn _ _, Trn _ _) -> True
            (Ain _ _, Ain _ _) -> True
            (Ayn _ _, Ayn _ _) -> True
            (Cpn _ _, Cpn _ _) -> True
            (_      , _      ) -> False

--

    -- λ₃
    idns :: Term -> [Term]
    idns e =
        case e of
            Emn   -> []
            Idn x -> [Idn x]
            _     -> idns (entermee e) ∪ idns (entermeo e)

    -- λ₄
    opns :: (Term -> Term -> Term, Term) -> [Term]
    opns (r, e)
        | isHomotypical (Emn      , e) = []
        | isHomotypical (Idn ""   , e) = []
        | isHomotypical (r Emn Emn, e) = [e] ∪ opns (r, entermee e) ∪ opns (r, entermeo e)
        | otherwise                    =       opns (r, entermee e) ∪ opns (r, entermeo e)

--

    -- λ₅

{-
    type Symb = Char
    type Code = String
    data Term
        = Non Symb
        | Una Symb Term
        | Bin Symb Term Term
        | Ter Symb Term Term Term
          deriving (Eq, Show, Read)
    enterming :: ([[Symb]], Code) -> ([[Symb]], Code, Term)
    enterming ([tzs, bzs, uzs], z:x)
        | elem z tzs = ter z x
        | elem z bzs = bin z x
        | elem z uzs = una z x
        | otherwise  = non z x
-}
