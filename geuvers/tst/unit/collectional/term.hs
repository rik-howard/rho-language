
import Collectional.Term
import Apile.Testing.Unit

main = do
    ioCounts mfoesLambdaPlus
    ioCounts mfoesLambda012
    ioCounts mfoesETA
    ioCounts mfoesLambda3
    ioCounts mfoesLambda4

mfoesLambdaPlus = [
    mfoe  "should enterm"  enterming  "ix"  ("x", i)
    ] :: [MFOE String (String, Term)]

mfoesLambda012 = [
    mfoe  "should project entermer"  (\o -> o)  (abn p b) ((entermer (abn p b)) p b),
    mfoe  "should project entermee"  entermee   (abn p b) p,
    mfoe  "should project entermeo"  entermeo   (abn p b) b
    ] :: [MFOE Term Term]

mfoesETA = [
    mfoe  "should contest homotypicality"  isHomotypical (i      , abn p b) False,
    mfoe  "should confirm homotypicality"  isHomotypical (abn i i, abn p b) True
    ] :: [MFOE (Term, Term) Bool]

mfoesLambda3 = [
    mfoe  "should extract identiations"  idns (abn p b) [p, b]
    ] :: [MFOE Term [Term]]

mfoesLambda4 = [
    mfoe  "should extract abstractions"  opns (Abn, apn (abn p b) i)  [abn p b]
    ] :: [MFOE (Term -> Term -> Term, Term) [Term]]

--

idy x = Idn x
i = idy "i"
p = idy "p"
b = idy "b"
abn p b = Abn p b
apn f a = Apn f a
