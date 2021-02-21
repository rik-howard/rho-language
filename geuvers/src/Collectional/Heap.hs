
module Collectional.Heap where

    import Apile.Base.Core
    import Collectional.Term
    --import Functional.Variator

    type Heap = Term
    type Evaluation = (Int, Heap, Term) -> (Int, Heap, Term)

    enheaping :: String -> (String, Heap)
    enheaping (' ':x)     = enheaping x
    enheaping ('ø':x)     = emnH x
    enheaping (';':':':x) = cinH x
    enheaping (';':'<':x) = cynH x
    enheaping x = error $ "error -- enheaping: [" ++ x ++ "]"

--

    emnH :: String -> (String, Heap)
    emnH x = (x, Emn)

    cinH :: String -> (String, Heap)
    cinH x =
        let
            (x',   v) = enterming x
            (x'',  u) = enterming x'
            (x''', h) = enheaping x''
        in (x''', Cpn (Ain v u) h)

    cynH :: String -> (String, Heap)
    cynH x =
        let
            (x',   v) = enterming x
            (x'',  w) = enterming x'
            (x''', h) = enheaping x''
        in (x''', Cpn (Ayn v w) h)

--

--     -- ε
--     lhss :: Heap -> [Term]
--     lhss Emn               = []
--     lhss (Cpn (Ain v w) h) = [v] ++ lhss h
--
--     -- δ
--     rhss :: Heap -> [Term]
--     rhss Emn               = []
--     rhss (Cpn (Ain v w) h) = [w] ++ rhss h
--
--     -- Δ
--     isDistinctive :: [Term] -> Bool
--     isDistinctive [] = True
--     isDistinctive es =
--         let
--             isIdn e = case e of Idn x -> True; _ -> False
--             bs      = map isIdn es
--             b       = foldl (&&) True bs
--         in b && isNonduped es
--
--     -- Ε
--     isIndependent :: [Term] -> [Term] -> Bool
--     isIndependent [] rs = True
--     isIndependent (l:ls) rs = isIndependent' l rs && isIndependent ls rs
--     -- Ε′
--     isIndependent' :: Term -> [Term] -> Bool
--     isIndependent' i []     = True
--     isIndependent' i (r:rs) = isAbsent i r && isIndependent' i rs

--
