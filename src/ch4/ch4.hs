module Ch4 where

import GHC.Int      -- to experiment with Int8, Int16, etc.

---------------
-- Chapter 4
----------------------------------------------------
-- in-chapter exercise
data Mood = Blah | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood Woot = Blah
----------------------------------------------------

----------------------------------------------------
-- in-chapter example
type Name = String
data Pet = Cat | Dog Name deriving Show
----------------------------------------------------

----------------------------------------------------
-- 4.9 Ex.3 -- ghci exercise
-- 6 / 3   -- works fine
-- 6 / length [1, 2, 3] -- does not work
-- :t (/)  -- :: Fractional a => a -> a -> a
-- :t length -- :: Foldable t => t a -> Int
-- -- the question is, how do we get this to work?
-- -- one solution is to use a different function
-- :t div -- :: Integral a => a -> a -> a
-- div 6 (length [1, 2, 3])
----------------------------------------------------


----------------------------------------------------
-- isPalindrome :: Ch.4 Ex.8
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome word = word == reverse word
----------------------------------------------------

----------------------------------------------------
-- return abs using if-then-else
myAbs :: Integer -> Integer
myAbs x =
    if x < 0 then (0 - x)
    else x
----------------------------------------------------

----------------------------------------------------
-- given the following type signature,
-- define the function using the built-ins fst and snd
f :: (a, b) -> (c, d) -> ((b,d),(a,c))
f x y = ((snd x, snd y), (fst x, fst y))
----------------------------------------------------

----------------------------------------------------
-- correcting syntax
-- ex 1
x = (+)
func :: [Char] -> Int
func xs = w `x` 1
    where w = length xs
-- ex 2
myIdentity :: a -> a
myIdentity i = (\x -> x) i
-- ex 3
getFst :: (a, b) -> a
getFst (a, b) = a
----------------------------------------------------
