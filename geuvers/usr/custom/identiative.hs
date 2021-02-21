
import System.Environment
import Apile.Testing.Schema
import Apile.Testing.Custom
import Collectional.Term
import Functional.Variator
import Testing

main :: IO ()
main = do
    fins <- getArgs
    fits <- mapM readFile fins
    vet processing fits

processing :: Input -> Output
processing input =
    let (x, e) = enterming input
    in output $ identiative e

output :: [Term] -> Output
output es = prettyEs es

--
