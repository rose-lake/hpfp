module Ch5 where
---------------
-- Chapter 5

----------------------------------------------------
-- ghci example revisited :: dividing Fractional and Int using (/) operator
-- :t (/) -- :: Fractional a => a -> a -> a
-- :t length -- :: Foldable t => t a -> Int
-- :t fromIntegral -- :: (Integral a, Num b) => a -> b
-- xs = [1, 2, 3]
-- 6 / fromIntegral (length xs)

----------------------------------------------------
-- parametric types
identity :: a -> a
identity a = a

-- these are the only two possible implementations of
-- a function with type a -> a -> a
pair1 :: a -> a -> a
pair1 x y = x

pair2 :: a -> a -> a
pair2 x y = y

-- possible implementation of func with type a -> b -> b
-- there is only one possible implementation
takeSnd :: a -> b -> b
takeSnd x y = y

----------------------------------------------------
-- more on currying and uncurrying
mulTriple :: Num a => (a, a, a) -> a
mulTriple (x, y, z) = x * y * z

subThree :: Num a => a -> a -> a -> a
subThree x y z = x - y - z

curry2 :: ((a, b) -> c) -> a -> b -> c
curry2 f a b = f (a, b)

curry3 :: ((a, b, c) -> d) -> a -> b -> c -> d
curry3 f a b c = f (a, b, c)

uncurry2 :: (a -> b -> c) -> (a, b) -> c
uncurry2 f (a, b) = f a b

uncurry3 :: (a -> b -> c -> d) -> (a, b, c) -> d
uncurry3 f (a, b, c) = f a b c

----------------------------------------------------
-- in-chapter exercise :: currying
addStuff :: Integer -> Integer -> Integer
addStuff a b = a + b + 5

subtractStuff :: Integer -> Integer -> Integer
subtractStuff x y = x - y - 10

----------------------------------------------------
-- investigating currying
-- demo'ed by means of anonymous lambda functions
nonsense :: Bool -> Integer
nonsense True = 805
nonsense False = 31337

-- all three of these are equivalent !
curriedFunction :: Integer -> Bool -> Integer
curriedFunction i b = i + (nonsense b)

anonymous :: Integer -> Bool -> Integer
anonymous = \i b -> i + (nonsense b)

anonNested :: Integer -> Bool -> Integer
anonNested = \i -> \b -> i + (nonsense b)

-- this one requires a 2-tuple input, however
uncurriedFunction :: (Integer, Bool) -> Integer
uncurriedFunction (i, b) = i + (nonsense b)
----------------------------------------------------
