
import Functional.Variator
import Apile.Testing.Unit
import Collectional.Term
import Testing

main = do
    ioCounts mfoes0
    ioCounts mfoes1

mfoes0 = [
    mfoe "should identiate" identiative (uglyE "i") (uglyEs "i")
    ] :: [MFOE Term [Term]]

mfoes1 = [
    mfoe "should applicate" applicative (uglyE "i") (uglyEs "")
    ] :: [MFOE Term [Term]]

--
