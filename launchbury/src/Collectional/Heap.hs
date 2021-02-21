
module Collectional.Heap where

    import Collectional.Term

    type Heap = Term
    type Evaluation = (Int, Heap, Term) -> (Int, Heap, Term)

    enheaping :: String -> (String, Heap)
    enheaping (' ':x)     = enheaping x
    enheaping ('ø':x)     = emnH x
    enheaping (';':':':x) = canH x

--

    emnH :: String -> (String, Heap)
    emnH x = (x, Emn)

    canH :: String -> (String, Heap)
    canH x =
        let
            (x',   v) = enterming x
            (x'',  u) = enterming x'
            (x''', h) = enheaping x''
        in (x''', Cpn (Ain v u) h)

--
