module Ch2 where
---------------
-- Chapter 2

----------------------------------------------------
-- in-chapter examples
triple x = x * 3

circle_area r = 3.14 * r * r

circle_area' r = pi * r * r

----------------------------------------------------
-- fix these code samples
-- ex1
area x = 3.14 * (x * x)  -- error was a space between 3. and 14
-- ex2
double x = x * 2   -- error was a 'b' instead of an 'x' to the right of equals
-- ex3
x = 7
y = 10      -- error was faulty indentation on the y expression
f = x + y

----------------------------------------------------
--  quotient, remainder   --vs--    divide, modulo
----------------------------------------------------
-- ah, so delightful... here we go...

quotientRemainer x y = ((quot x y), (rem x y))
-- quotient and remainder are defined together as satisfying :
-- (quot x y)*y + (rem x y) == x

divideModulo x y = ((div x y), (mod x y))
-- divide and modulo are defined together as satisfying :
-- (div x y)*y + (mod x y) == x

-- the key is that

-- mod has the same sign as the Divisor
--     this avoids the pitfall of n `mod` 2 == 1 to test odd-ness
--     since it takes the same sign as the Divisor (2),
--     it will always return 1 for an odd N,
--     regardless of whether N itself is positive or negative
--
-- rem has the same sign as the Dividend
--     this makes it 'arithmetically intuitive', at least in my mind
--     regardless of whether we're operating in a positive or negative realm
--     the absolute values of the quotient and the remainder are always equal

-- GHCi output

-- > quotientRemainer 11 4
-- (2,3)
-- > quotientRemainer (-11) 4
-- (-2,-3)
-- > quotientRemainer 11 (-4)
-- (-2,3)
-- > quotientRemainer (-11) (-4)
-- (2,-3)
--
-- > divideModulo 11 4
-- (2,3)
-- > divideModulo (-11) 4
-- (-3,1)
-- > divideModulo 11 (-4)
-- (-3,-1)
-- > divideModulo (-11) (-4)
-- (2,-3)
