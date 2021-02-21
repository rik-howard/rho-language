
module Functional.Executor where

    import Functional.Analyser
    import Functional.Evaluator
    import Collectional.Heap
    import Collectional.Term

    execution :: String -> (Int, Heap, Term)
    execution x = evaluation $ analysis x

--
