
import Testing
import System.Environment
import Apile.Testing.Schema
import Apile.Testing.Custom
import Collectional.Term
import Collectional.Heap
import Functional.Analyser

main :: IO ()
main = do
    fins <- getArgs
    fits <- mapM readFile fins
    vet processing fits

processing :: Input -> Output
processing input = output $ analysis input

output :: (Int, Heap, Term, Term) -> Output
output nhye = prettyNHYE nhye

--
