module GreetIfCool1 where

greetIfCool :: String -> IO ()
greetIfCool coolness =
    if cool
        then putStrLn "eyyyyy. What's shakin'?"
    else
        putStrLn "phhsshhhh...."
    where cool =
            coolness == "downright frosty yo"