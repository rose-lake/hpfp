module ChapterExercises where

-------------------------------
-- Chapter 5, Section 8
-- exercises which are not themselves part of a module

-- Multiple Choice
-- 1. A value of type [a] is
    -- c. a list of elements that are all of some type a
-- 2. A function of type [[a]] -> [a] could
    -- a. take a list of strings as its argument
-- 3. A function of type [a] -> Int -> a
    -- b. returns one element of type a from a list
-- 4. A function of type (a, b) -> a
    -- c. takes a tuple argument and returns the first value

-- Determine the type
-- see DetermineTheType.hs

-- Does it compile?
-- 1.
-- bigNum = (^) 5 $ 10
-- wahoo = bigNum $ 10
-- NO. bigNum returns a value not a partially applied function.
-- assuming the purpose is the get 5 to the power of 10 at the end, do the following
bigNum = (^) 5
wahoo = bigNum 10
-- the dollar-sign is not really needed for the bigNum $ 10 function application

-- 2.
x = print
y = print "wohoo!"
z = x "hello world"
-- yup, should be no problem there!

-- 3.
-- a = (+)
-- b = 5
-- c = b 10
-- d = c 200
-- NO. that makes no sense. assuming you wish to add these things, do the following
-- a = (+)
-- b = 5
-- c = a b 10
-- d = a c 200
-- commented out so as not to conflict with later examples which use 'c'

-- 4.
-- a = 12 + b
-- b = 10000 * c
-- is it the intent of the problem to use the same variable names as exercise 3 and attempt to compile them in the same file? I'll assume no and rename them to avoid naming conflicts.
-- e = 12 + f
-- f = 10000 * g
-- NO. Even so, the result will still not compile since g is undefined...
-- there's no way to guess what the author's intent was here...
-- even if we try to compile it in its own file, it won't compile because c is undefined.

-- Type variable or specific type constructor?
-- 1. given as an example
-- f :: Num a => a -> b -> Int -> Int
----           [1]  [2]   [3]    [4]
    -- [1] : constrained polymorphic
    -- [2] : fully polymorphic
    -- [3], [4] : concrete type constructor

-- 2.
-- f :: zed -> Zed -> Blah
-- --   [1]     [2]    [3]
    -- [1] : fully polymorphic
    -- [2], [3] : concrete type constructor

-- 3.
-- f :: Enum b => a -> b -> C
-- --             [1]  [2]  [3]
    -- [1] : fully polymorphic
    -- [2] : constrained polymorphic
    -- [3] : concrete type constructor

-- 4.
-- f :: f -> g -> C
-- --   [1] [2]  [3]
    -- [1], [2] : fully polymorphic
    -- [3] : concrete type constructor

-- Write a type signature
-- 1.
functionH :: [a] -> a
functionH (x:_) = x
-- 2.
functionC :: Ord a => a -> a -> Bool
functionC x y =
    if (x > y) then True else False
-- 3.
functionS :: (a, b) -> b
functionS (x, y) = y

-- Given a type, write the function
-- you will be told how many ways there are to write the function
-- example
myFunc :: (x -> y)
    -> (y -> z)
    -> c
    -> (a, x)
    -> (a, z)
myFunc xToy yToz _ (a, x) = (a, yToz $ xToy x)
-- 1. only one function definition type checks and doesn't go into an infinite loop when you run it
i :: a -> a
i x = x
-- 2. only one version works
c :: a -> b -> a
c x y = x
-- 3. Given alpha equivalence, c'' and c from the previous exercise are the same
c'' :: b -> a -> b
c'' x y = x
-- 4. only one version works
c' :: a -> b -> b
c' x y = y
-- 5. there are multiple possibilities
r :: [a] -> [a]
r (x:xs) = xs   -- one possible implementation is 'tail'
-- 6. only one version will type check
co :: (b -> c) -> (a -> b) -> a -> c
co bToc aTob a = bToc $ aTob a
-- 7. one version will type check
a :: (a -> c) -> a -> a
a _ x = x
-- 8. one version will type check
a' :: (a -> b) -> a -> b
a' aTob a = aTob a

-- Fix it
-- see sing.hs

-- Type Kwon Do
-- see TypeKwonDo.hs
