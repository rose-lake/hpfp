{-# LANGUAGE NoMonomorphismRestriction #-}
-- this is so that you can inspect fully polymorphic types of things defined in here

module WritingTypeSignatures where

-- given the function, write the type signature

functionH :: [a] -> a
functionH (x:_) = x

functionC :: Ord a => a -> a -> Bool
functionC x y =
    if x > y then True else False

functionS :: (a, b) -> b
functionS (x, y) = y
