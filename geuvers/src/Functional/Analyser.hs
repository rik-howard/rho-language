
module Functional.Analyser where

    import Collectional.Heap
    import Collectional.Term
    import Functional.Distinguisher
    import Functional.Regulator

    analysis :: String -> (Int, Heap, Term, Term)
    analysis x =
        let
            (x'   , n ) = (tail x, read [head x] :: Int)
            (x''  , h ) = enheaping x'
            (x''' , y ) = enterming x''
            (x'''', e ) = enterming x'''
            (n'   , e') = regulating $ distinguishing (n, e)
        in (n', h, y, e')

--
