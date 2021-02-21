
import Collectional.Term
import Functional.Distinguisher
import Apile.Testing.Unit
import Testing

main = ioCounts mfoes

mfoes = [
    mfoe "should distinguish" distinguishing (uglyNE 0 "i") (uglyNE 0 "i")
    ] :: [MFOE (Int,  Term) (Int, Term)]

--
