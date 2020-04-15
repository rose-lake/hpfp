module FunctionWithWhere where

printIncWhere n = print plusTwo
    where plusTwo = n + 2

-- where is a declaration
-- it is bound to a surrounding syntactic construct
