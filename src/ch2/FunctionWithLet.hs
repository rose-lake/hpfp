module FunctionWithLet where

--let introduces an expression, so it can be used wherever you can have an expression

printIncLet n = let plusTwo = n + 2
                in print plusTwo
