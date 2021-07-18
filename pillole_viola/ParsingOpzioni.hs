import System.Environment (getArgs)
import System.Console.GetOpt

data Flag = Help | Sum 
    deriving Eq

type Arg = String

options :: [OptDescr Flag]
options = [
    Option ['h'] ["help"] (NoArg Help) "show this help message and exit",
    Option [] ["sum"] (NoArg Sum) "sum the integers (default: find the max)"
    ]

help :: String
help = "usage: runhaskell Esempio.hs [-h] [--sum] N [N ...]"

parseArgv :: [String] -> String -> [OptDescr Flag] -> ([Flag],[Arg])
parseArgv argv help options = 
    case getOpt Permute options argv of
        (flags,args,[]) -> (flags,args)
        (_,_,errs) -> error $ concat errs ++ help

main = do
    argv <- getArgs
    let (flags,args) = parseArgv argv help options
    if Help `elem` flags || null args
        then putStrLn $ usageInfo help options
        else do
            let ns = map read args :: [Int]
            if Sum `elem` flags
                then print $ sum ns
                else print $ maximum ns