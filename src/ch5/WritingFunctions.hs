{-# LANGUAGE NoMonomorphismRestriction #-}
-- this is so that you can inspect fully polymorphic types of things defined in here

module WritingFunctions where
-- given the type signature, write the function

-- ex 1
i :: a -> a
i a = a

-- ex 2
c :: a -> b -> a
c x y = x

-- ex 3
c'' :: b -> a -> b
c'' x y = x
-- Given alpha equivalence, c'' and c are the same function

-- ex4
c' :: a -> b -> b
c' x y = y

-- ex5
-- this implements 'tail'
r :: [a] -> [a]
r (x:xs) = xs

-- ex6
co :: (b -> c) -> (a -> b) -> a -> c
co bToc aTob a = (bToc (aTob a))

-- ex7
a :: (a -> c) -> a -> a
a _ x = x

-- ex8
a' :: (a -> b) -> a -> b
a' aTob x = aTob x
