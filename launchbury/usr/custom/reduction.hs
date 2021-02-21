
import Testing
import System.Environment
import Apile.Testing.Schema
import Apile.Testing.Custom
import Collectional.Term
import Collectional.Heap
import Functional.Reducer

main :: IO ()
main = do
    fins <- getArgs
    fits <- mapM readFile fins
    vet processing fits

processing :: Input -> Output
processing (n:input) =  output $ reduction $ uglyNHE (read [n] :: Int) input

output :: (Int, Heap, Term) -> Output
output nht = prettyNHE nht

--
