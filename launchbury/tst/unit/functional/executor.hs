
import Collectional.Heap
import Collectional.Term
import Functional.Executor
import Apile.Testing.Unit
import Testing

main = ioCounts mfoes

mfoes = [
    mfoe "should execute" execution "0 ø ^ib" (uglyNHE 1 "ø ^0b")
    ] :: [MFOE String (Int, Heap, Term)]

--
