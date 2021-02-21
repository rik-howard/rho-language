
import Testing
import System.Environment
import Apile.Testing.Schema
import Apile.Testing.Custom
import Collectional.Term
import Collectional.Heap
import Functional.Executor

main :: IO ()
main = do
    fins <- getArgs
    fits <- mapM readFile fins
    vet processing fits

processing :: Input -> Output
processing input =  output $ execution input

output :: (Int, Heap, Term) -> Output
output nht = prettyNHE nht

--
