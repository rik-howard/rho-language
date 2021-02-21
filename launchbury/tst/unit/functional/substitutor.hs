
import Collectional.Term
import Functional.Substitutor
import Apile.Testing.Unit
import Testing

main = ioCounts mfoes

mfoes = [
    mfoe "should substitute" substitution (uglyEEE "n o i") (uglyE "i")
    ] :: [MFOE (Term,  Term,  Term) Term]

--
