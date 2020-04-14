# A note on the Arithmetic Operators pertaining to integer division(s) and remainder(s)
```
 quot   integral division, round towards zero
        integer division truncated toward zero

 rem    remainder after division using `quot`
        integer remainder, satisfying: (x `quot` y) * y + (x `rem` y) == x

 div    integral division, round down
        integer division truncated toward negative infinity

 mod    modulo, the remainder after division using `div`
        integer modulus, satisfying: (x `div` y) * y + (x `mod` y) == x
```
`quot` and `div` behave differently when dealing with negative numbers.

Given the following functions:
```haskell
quotientRemainer x y = ((quot x y), (rem x y))

divideModulo x y = ((div x y), (mod x y))
```

Consider the following GHCi output:
```
> quotientRemainer 11 4
(2,3)
> quotientRemainer (-11) 4
(-2,-3)
> quotientRemainer 11 (-4)
(-2,3)
> quotientRemainer (-11) (-4)
(2,-3)

> divideModulo 11 4
(2,3)
> divideModulo (-11) 4
(-3,1)
> divideModulo 11 (-4)
(-3,-1)
> divideModulo (-11) (-4)
(2,-3)
```

The key is that...

- `mod` has the same sign as the Divisor
    - this avoids the pitfall of n `mod` 2 == 1 to test odd-ness
    - since it takes the same sign as the Divisor (2),
    - it will always return 1 for an odd N,
    - regardless of whether N itself is positive or negative


- `rem` has the same sign as the Dividend
    - this makes it 'arithmetically intuitive', at least in my mind
    - regardless of whether we're operating in a positive or negative realm
    - the absolute values of the quotient and the remainder are always equal

In my mind, one pair (`quot` and `rem`) leans towards division while the other pair (`div` and `mod`) leans towards modulo.

Since we've grown up doing mental arithmetic which leans towards the logic of division, quot-rem may be more intuitive in that regard.

On the other hand, I certainly appreciate a `modulo` which takes the sign of the divisor! This makes my life as a programmer much more intuitive and less fraught.

Side note: thank goodness Python behaves the same way respective to modulo! Also, it defines something in math called fmod which behaves like remainder.
