
import Collectional.Heap
import Collectional.Term
import Functional.Reducer
import Apile.Testing.Unit
import Testing

main = ioCounts mfoes

mfoes = [
    mfoe "should reduce" reduction (uglyNHE 0 "ø ^ib") (uglyNHE 0 "ø ^ib")
    ] :: [MFOE (Int, Heap, Term) (Int, Heap, Term)]

--
