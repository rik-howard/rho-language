
import Collectional.Heap
import Collectional.Term
import Functional.Analyser
import Apile.Testing.Unit
import Testing

main = ioCounts mfoes

mfoes = [
    mfoe "should analyse" analysis "0 ø I i" (uglyNHEY 0 "ø I i")
    ] :: [MFOE String (Int, Heap, Term, Term)]

--
