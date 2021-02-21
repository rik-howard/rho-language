
import Collectional.Heap
import Collectional.Term
import Functional.Analyser
import Apile.Testing.Unit
import Testing

main = ioCounts mfoes

mfoes = [
    mfoe "should analyse" analysis "0 ø i" (uglyNHE 0 "ø i")
    ] :: [MFOE String (Int, Heap, Term)]

--
