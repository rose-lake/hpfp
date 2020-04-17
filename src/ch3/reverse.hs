module Reverse where

-- This is designed *specifically* to word-reverse the string "Curry is awesome",
-- returning "awesome is Curry"
-- This doesn’t need to, and shouldn’t, work for reversing the words of any sentence.
-- You’re expected only to slice and dice this particular string with take and drop.
rvrs :: String -> String
rvrs x = c ++ b ++ a
    where a = take 5 x
          b = take 4 $ drop 5 x
          c = drop 9 x

main :: IO ()
main = print $ rvrs "Curry is awesome"
