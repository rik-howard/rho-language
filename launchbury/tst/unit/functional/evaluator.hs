
import Collectional.Heap
import Collectional.Term
import Functional.Evaluator
import Apile.Testing.Unit
import Testing

main = ioCounts mfoes

mfoes = [
    mfoe "should evaluate" evaluation (uglyNHE 0 "ø ^ib") (uglyNHE 0 "ø ^ib")
    ] :: [MFOE (Int, Heap, Term) (Int, Heap, Term)]

--
