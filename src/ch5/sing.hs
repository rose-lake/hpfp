module Sing where

fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

sing :: [Char]
sing =
    if (x < y) then     -- to change which song is sung, toggle between > and <
        fstString x
    else
        sndString y
    where   x = "Singin"
            y = "Somewhere"

-- to change which song is sung, call the function singSmart with argument (>) or (<)
singSmart :: ([Char] -> [Char] -> Bool) -> [Char]
singSmart test =
    if (test x y) then
        fstString x
    else
        sndString y
    where   x = "Singin"
            y = "Somewhere"
