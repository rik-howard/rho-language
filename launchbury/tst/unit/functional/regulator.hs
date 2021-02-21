
import Collectional.Term
import Functional.Regulator
import Apile.Testing.Unit
import Testing

main = ioCounts mfoes

mfoes = [
    mfoe "should regulate" regulating (uglyNE 0 "i") (uglyNE 0 "i")
    ] :: [MFOE (Int,  Term) (Int, Term)]

--
