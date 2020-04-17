module Print3BrokenFixed where

printSecond :: IO ()
printSecond = do
    putStrLn greeting

main :: IO ()
main = do
    putStrLn greeting
    printSecond
    -- where greeting = "Yarrrr"    -- original, broken.

greeting :: String
greeting = "Yarrrrr"
