
module Collectional.Term where

    data Term
        = Cpn Term Term
        | Ain Term Term
        | Apn Term Term
        | Abn Term Term
        | Idn String
        | Emn
          deriving (Eq, Show, Read)

    enterming :: String -> (String, Term)
    enterming (' ':x)     = enterming x
    enterming ('^':x)     = abnE x
    enterming ('·':x)     = apnE x
    enterming (';':':':x) = canT x
    enterming x           = idnE x

--

    idnE :: String -> (String, Term)
    idnE (c:x) | not (elem c "^·:;") = (x, Idn [c])

    abnE :: String -> (String, Term)
    abnE x =
        let
            (x',  p) = idnE x
            (x'', b) = enterming x'
        in (x'', Abn p b)

    apnE :: String -> (String, Term)
    apnE x =
        let
            (x',  f) = enterming x
            (x'', a) = enterming x'
        in (x'', Apn f a)

    canT :: String -> (String, Term)
    canT x =
        let
            (x',   v) = idnE x
            (x'',  u) = enterming x'
            (x''', k) = enterming x''
        in (x''', Cpn (Ain v u) k)

--
