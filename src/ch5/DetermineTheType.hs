{-# LANGUAGE NoMonomorphismRestriction #-}
-- this is so that you can inspect fully polymorphic types of things defined in here

module DetermineTheType where

example = 1
-- without the language extension, :t example returns
    -- example :: Integer
-- with the extension, :t example gives
    -- example :: Num p => p

ex1a = (* 9) 6
-- ex1a :: Num a => a -> a

ex1b = head [(0, "doge"), (1, "kitteh")]
-- head :: [a] -> a
-- ex1b :: Num a => (a, [Char])

ex1c = head [(0 :: Integer, "doge"), (1, "kitteh")]
-- ex1c :: (Integer, [Char])

ex1d = if False then True else False
-- ex1d :: Bool
-- see Chapter 4.6 'Go on and Bool Me', 'Conditionals with if-then-else' section
-- for more on specific type and return values of the 'if expression'

ex1e = length [1, 2, 3, 4, 5]
-- ex1e :: Int

ex1f = (length [1, 2, 3, 4]) > (length "TACOCAT")
-- ex1f :: Bool
