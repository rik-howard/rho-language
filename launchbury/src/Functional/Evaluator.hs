
module Functional.Evaluator where

    import Collectional.Heap
    import Collectional.Term
    import Functional.Reducer
    import Relational.Informer

    evaluation :: (Int, Heap, Term) -> (Int, Heap, Term)
    evaluation (n, h, e)
        | isNF e = (n, h, e)
        | otherwise = evaluation $ reduction (n, h, e)

--
