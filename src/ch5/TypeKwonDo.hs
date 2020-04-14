module TypeKwonDo where

-- example 1
-- now I understand... I wrote example 1-b first, then went back and wrote this
f :: Int -> String
f = undefined

g :: String -> Char
g = undefined

h :: Int -> Char
h x = g (f x)

-- example 1-b
-- h will return the first character of the Int it receives
f' :: Int -> String
f' x = show x

g' :: String -> Char
g' (x:xs) = x

h' :: Int -> Char
h' x = g' $ f' x

-- example 2
data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e x = w $ q x

-- example 3
data X
data Y
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform (x, y) = (xz x, yz y)

-- example 4
-- is it 'cheating' to use fst? I don't think so... Maybe?
munge :: (x -> y)
    -> (y -> (w, z))
    -> x
    -> w
munge xToy yTowzPair x = fst (yTowzPair $ xToy x)
