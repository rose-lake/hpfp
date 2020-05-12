module ExamplesSection5 where

-- first example
data Trivial = Trivial'
-- be sure to keep your type classes for a type in the same file as that type
instance Eq Trivial where
    Trivial' == Trivial' = True

-- second example
data DayOfWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun
    deriving Show
data Date = Date DayOfWeek Int
    deriving Show
-- Date is defined as a day of the week and a numerical day in the month
instance Eq DayOfWeek where
    (==) Mon Mon    = True
    (==) Tue Tue    = True
    (==) Wed Wed    = True
    (==) Thu Thu    = True
    (==) Fri Fri    = True
    (==) Sat Sat    = True
    (==) Sun Sun    = True
    (==) _ _        = False

-- note: to enable all warnings, type :set -Wall at the ghci prompt
-- you could also set this as part of your build configuration
-- this would, for instance, tell you if you forgot the 'catch all' case _ _ above

instance Eq Date where
    (==) (Date weekday dayOfMonth)
         (Date weekday' dayOfMonth') =
             weekday == weekday'
             && dayOfMonth == dayOfMonth'

-- third example
-- partial functions are functions where not all the cases have been handled
f :: Int -> Bool
f 1 = True
f 2 = True
f 3 = True
f _ = False
-- But, if you're really only interested in a few cases, don't use Int! It's huge!
-- in ghci
-- *ExamplesSection5> minBound :: Int
-- -9223372036854775808
-- *ExamplesSection5> maxBound :: Int
-- 9223372036854775807
-- Instead, define your own 'sum type' as we did above, with DayOfWeek, which has just the few cases you're interested in!

-- fourth example
data Identity a = Identity a
instance Eq a => Eq (Identity a) where
    (==) (Identity v) (Identity v') = v == v'
-- At compile time, Haskell will ensure we don't try to check the equality of an Identity data whose 'a' doesn't have an Eq instance:
data NoEq = NoEqInst deriving Show
-- demonstrating in ghci
-- *ExamplesSection5> inoe = Identity NoEqInst
-- *ExamplesSection5> inoe == inoe
-- <interactive>:16:1: error:
--     • No instance for (Eq NoEq) arising from a use of ‘==’
--     • In the expression: inoe == inoe
--       In an equation for ‘it’: it = inoe == inoe

-- Section 5 Exercises
-- 1.
data TisAnInteger =
    TisAn Integer
instance Eq TisAnInteger where
    (==) (TisAn v) (TisAn v') = v == v'
-- in GHCi:
-- *ExamplesSection5> TisAn 1 == TisAn 2
-- False
-- *ExamplesSection5> TisAn 1 == TisAn 1
-- True

-- 2.
data TwoIntegers =
    Two Integer Integer
instance Eq TwoIntegers where
    (==) (Two x y) (Two x' y') = x == x' && y == y'
-- *ExamplesSection5> Two 1 2 == Two 2 1
-- False
-- *ExamplesSection5> Two 1 2 == Two 1 2
-- True

-- 3.
data StringOrInt =
    TisAnInt Int
  | TisAString String
instance Eq StringOrInt where
    (==) (TisAnInt v) (TisAnInt v') = v == v'
    (==) (TisAString s) (TisAString s') = s == s'
    (==) _ _ = False
-- *ExamplesSection5> TisAnInt 3 == TisAnInt 1
-- False
-- *ExamplesSection5> TisAString "s" == TisAString "s"
-- True
-- *ExamplesSection5> TisAString "s" == TisAString "x"
-- False
-- *ExamplesSection5> TisAString "s" == TisAnInt 3
-- False

-- 4.
data Pair a =
    Pair a a
instance Eq a => Eq (Pair a) where
    (==) (Pair x y) (Pair x' y') = x == x' && y == y'
-- *ExamplesSection5> Pair 1 2 == Pair 1 2
-- True
-- *ExamplesSection5> Pair 2 1 == Pair 2 1
-- True
-- *ExamplesSection5> Pair "abc" "def" == Pair "abc" "def"
-- True
-- *ExamplesSection5> Pair "Hello" "World" == Pair "World" "Hello"
-- False

-- 5.
data Tuple a b =
    Tuple a b
instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==) (Tuple x y) (Tuple x' y') = x == x' && y == y'
-- *ExamplesSection5> Tuple 1 2 == Tuple 1 2
-- True
-- *ExamplesSection5> Tuple 3 4 == Tuple 5 6
-- False
-- *ExamplesSection5> Tuple "hello" "world" == Tuple "hello" "world"
-- True
-- *ExamplesSection5> Tuple "hello" "world" == Tuple "world" "hello"
-- False

-- 6.
data Which a =
    ThisOne a
  | ThatOne a
instance (Eq a) => Eq (Which a) where
    (==) (ThisOne x) (ThisOne x') = x == x'
    (==) (ThatOne y) (ThatOne y') = y == y'
    (==) _ _ = False
-- *ExamplesSection5> ThisOne 2 == ThisOne 2
-- True
-- *ExamplesSection5> ThisOne 2 == ThisOne 3
-- False
-- *ExamplesSection5> ThatOne 1 == ThatOne 1
-- True
-- *ExamplesSection5> ThatOne 1 == ThatOne 3
-- False
-- *ExamplesSection5> ThisOne 1 == ThatOne 1
-- False

-- 7.
data EitherOr a b =
    Hello a
  | Goodbye b
instance (Eq a, Eq b) => Eq (EitherOr a b) where
    (==) (Hello x) (Hello x') = x == x'
    (==) (Goodbye y) (Goodbye y') = y == y'
    (==) _ _ = False
-- *ExamplesSection5> Hello "world" == Hello "not_world"
-- False
-- *ExamplesSection5> Hello "world" == Hello "world"
-- True
-- *ExamplesSection5> Goodbye "world" == Goodbye "not_world"
-- False
-- *ExamplesSection5> Goodbye "world" == Goodbye "world"
-- True
-- *ExamplesSection5> Goodbye "world" == Hello "world"
-- False
-- *ExamplesSection5> Goodbye 1 == Hello 1
-- False
-- *ExamplesSection5> Goodbye "world" == Hello 3
-- False
