
import System.Environment
import Apile.Testing.Schema
import Apile.Testing.Custom
import Collectional.Term
import Collectional.Heap
import Relational.Typifier

main :: IO ()
main = do
    fins <- getArgs
    fits <- mapM readFile fins
    vet processing fits

processing :: Input -> Output
processing input =
    let
        (x  , h) = enheaping input
        (x' , y) = enterming x
        (x'', e) = enterming x'
    in output $ isTypical (h, y, e)

output :: Bool -> Output
output isTypical = show isTypical

--
