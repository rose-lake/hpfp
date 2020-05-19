module ExamplesSection6 where

-- Section 6.6 Examples

-- Num --

-- Num is a superclass of Fractional

-- > :i Fractional
-- class Num a => Fractional a where
--   (/) :: a -> a -> a
--   recip :: a -> a
--   fromRational :: Rational -> a
--   {-# MINIMAL fromRational, (recip | (/)) #-}
--   	-- Defined in ‘GHC.Real’
-- instance Fractional Float -- Defined in ‘GHC.Float’
-- instance Fractional Double -- Defined in ‘GHC.Float’

-- Broken Example --
-- divideThenAdd :: Num a => a -> a -> a
-- divideThenAdd x y = (x / y) + 1
-- if you load this into the REPL you get an error:
--     • Could not deduce (Fractional a) arising from a use of ‘/’
--       from the context: Num a
--         bound by the type signature for:
--                    divideThenAdd :: forall a. Num a => a -> a -> a

-- How to 'fix' the above example? Two possible ways...
-- Method 1
-- Change the constraint to Fractional so the / operator can be used
divideThenAdd :: Fractional a => a -> a -> a
divideThenAdd x y = (x / y) + 1
-- Method 2
-- Keep the Num constraint and do not use the / operator which requires Fractional
subtractThenAdd :: Num a => a -> a -> a
subtractThenAdd x y = (x - y) + 1

-- Why wouldn't you do (Num a, Fractional a) ?
divideThenAdd' :: (Num a, Fractional a) => a -> a -> a
divideThenAdd' x y = (x / y) + 1
-- Because Fractional is a subset of Num, so it is the same as writing Fractional.
-- > :t divideThenAdd'
-- divideThenAdd' :: Fractional a => a -> a -> a

-- Why not (Real a, Integral a) ?
quotientThenAdd :: (Real a, Integral a) => a -> a -> a
quotientThenAdd x y = (quot x y) + 1
-- Similarly, Integral is a subset of Real, so the compiler just reads it as Integral.
-- > :t quotientThenAdd
-- quotientThenAdd :: Integral a => a -> a -> a

-- If, on the other hand, you required two classes which aren't super/sub-sets of each other, then the compiler recognizes both as distinct requirements
divideThenAdd'' :: (Integral a, Fractional a) => a -> a -> a
divideThenAdd'' x y = (x / y) + 1
-- >  :t divideThenAdd''
-- divideThenAdd'' :: (Integral a, Fractional a) => a -> a -> a
