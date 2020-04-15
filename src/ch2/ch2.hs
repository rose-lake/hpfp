module Ch2 where
---------------
-- Chapter 2

----------------------------------------------------
-- 2.11 : Chapter Exercises

----
-- Parenthesization
-- 2 + 2 * 3 - 1
p1 = 2 + (2 * 3) -1
-- (^) 10 $ 1 + 1
p2 = (^) 10 (1 + 1)
-- 2 ^ 2 * 4 ^ 5 + 1
p3 = (2 ^ 2) * (4 ^ 5) + 1

----
-- Equivalent Expressions
-- 1 + 1 == 2
-- 10 ^ 2 == 10 + 9 * 10
-- 400 - 37 != (-) 37 400       363 != -363
-- 100 `div` 3 != 100 / 3       33 != 33.333333333333336
                                -- actually that's interesting the 6 at the end... ?
-- 2 * 5 + 18 != 2 * (5 + 18)   28 != 46

----
-- fun with functions
-- Rewrite this code so it can work in a REPL (where order matters)
-- original code :
    -- z=7
    -- x=y^2
    -- waxOn = x * 5
    -- y=z+8
-- would become :
    -- z = 7
    -- y = z + 8
    -- x = y ^ 2
    -- waxOn = x * 5

-- ex1
-- 10 + waxOn == 1135
-- (+10) waxOn == 1135
-- (-) 15 waxOn == -1110
-- (-) waxOn 15 == 1110

-- ex2 and ex3
-- triple waxOn == 1125 * 3 == 3375

-- ex4 : rewrite waxOn as an expression with a where clause
waxOn = x * 5
    where z = 7
          y = z + 8
          x = y ^ 2

-- ex5 : use the triple function (below) with waxOn
ex5 = triple waxOn

-- ex6
waxOff x = triple x
-- entering waxOff waxOn at the REPL prompt has the same effect as ex5


----------------------------------------------------
-- Earlier in-chapter examples
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
-- let vs where
-- let introduces an expression, so it can be used wherever you can have an expression
-- where is a declaration bound to a surrounding syntactic construct... hm...
-- see also, exercises in converting let to where in LetToWhere.hs
printIncLet n = let plusTwo = n + 2
                in print plusTwo

printIncWhere n = print plusTwo
    where plusTwo = n + 2


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
