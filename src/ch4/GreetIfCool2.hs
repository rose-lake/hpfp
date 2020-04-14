module GreetIfCool2 where

greetIfCool :: String -> IO ()
greetIfCool coolness =
    if cool coolness
        then putStrLn "eyyyy... what's shakin'?"
    else
        putStrLn "pshhhhhh...."
    where cool v =
            v == "downright frosty yo"

-- this version defines 'cool' as a function taking in a string and returning a Boolean value
-- the other version defined 'cool' as a Boolean value
