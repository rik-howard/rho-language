
import Relational.Typifier
import Apile.Testing.Unit
import Collectional.Term
import Collectional.Heap

main = ioCounts mfoes

mfoes = [
    mfoe "should typify" isTypical (Cpn (Ayn (Idn "o") (Idn "O")) Emn, Idn "O", Idn "o") True
    ] :: [MFOE (Heap, Term, Term) Bool]

--
