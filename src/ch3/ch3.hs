module Ch3 where
---------------
-- Chapter 3

----------------------------------------------------
-- Exercises : Scope

-- -- ex1
-- x = 5
-- y = 7
-- z = x * y
-- -- is y in scope for z? yes.

-- -- ex2
-- f = 3
-- g = 6 * f + h
-- -- is h in scope for g? no.

-- -- ex3
-- area d = pi * (r * r)
-- r = d/2
-- --is everything we need to execute area in scope? NO. need a where or let for r = d/2
-- area d = pi * (r * r)
--     where r = d / 2
-- or
-- area d = let r = d / 2 in pi * (r * r)

-- -- ex4
-- area d = pi * (r * r)
--     where r = d / 2
-- -- now are r and d in scope for area? yes.

----------------------------------------------------
-- Exercises : Syntax Errors

-- -- ex1
-- ++ [1, 2, 3] [4, 5, 6]  -- no
-- [1, 2, 3] ++ [4, 5, 6]  -- yes

-- -- ex2
-- '<3' ++ ' Haskell' -- no. because single quotes.
-- "<3" ++ " Haskell" -- yes.

-- -- ex3
-- concat ["<3", " Haskell"] -- yes

----------------------------------------------------
-- 3.8 Chapter Exercises

-- Reading Syntax (rs)

-- Exercise 1 :: correct the syntax, if needed
rs1a = concat [[1,2,3], [4,5,6]]  -- √
-- ex1b = ++ [1, 2, 3] [4, 5, 6] -- x
rs1b = [1, 2, 3] ++ [4, 5, 6] -- √
rs1b' = (++) [1, 2, 3] [4, 5, 6] -- also √
rs1c = (++) "hello" " world" -- √
-- ex1d = ["hello" ++ " world] -- x
rs1d = ["hello" ++ " world"] -- √
-- ex1e = 4 !! "hello" -- x
rs1e = "hello" !! 4 -- √
rs1f = (!!) "hello" 4 -- √
-- ex1g = take "4 lovely" -- x
rs1g = take 4 "lovely" -- √
rs1h = take 3 "awesome" -- √

-- Exercse 2 :: match the output to the code
rs2a = concat [[1 * 6], [2 * 6], [3 * 6]]
-- matches (d): [6, 12, 18]
rs2b = "rain" ++ drop 2 "elbow"
-- matches (c): "rainbow"
rs2c = 10 * head [1, 2, 3]
-- matches (e): 10
rs2d = (take 3 "Julie") ++ (tail "yes")
-- matches (a): "Jules"
rs2e = concat [tail [1, 2, 3],
                tail [4, 5, 6],
                tail [7, 8, 9]]
-- matches (b): [2, 3, 5, 6, 8, 9]

-- Building Functions (bf)

-- Exercise 1 :: use the list manipulation functions mentioned in the chapter to solve the following exercises

-- (a)
-- Given "Curry is awesome"
-- Return "Curry is awesome!"
-- "Curry is awesome" ++ "!"

-- (b)
-- Given "Curry is awesome!"
-- Return "y"
-- "Curry is awesome!" !! 4

-- (c)
-- Given "Curry is awesome!"
-- Return "awesome!"
-- drop 9 "Curry is awesome!"

-- Exercise 2 :: now write each of these as a generalized function in a source file
bf2a x = x ++ "!"
bf2b x = x !! 4
bf2c x = drop 9 x

-- Exercise 3 :: write a function of type String -> Char that returns the 3rd char
thirdLetter :: String -> Char
thirdLetter x = x !! 2

-- Exercise 4 :: now write a similar function which takes in the index (Int) and returns the Char at the specified index. The string is constant.
myString :: String
myString = "Curry is awesome!"

letterIndex :: Int -> Char
letterIndex x = myString !! x

-- Exercise 5 :: using 'take' and 'drop', can you write a function which will take "Curry is awesome" and return "awesome is Curry". This doesn’t need to, and shouldn’t, work for reversing the words of any sentence. You’re expected only to slice and dice this particular string with take and drop.
rvrs :: String -> String
rvrs x = c ++ b ++ a
    where a = take 5 x
          b = take 4 $ drop 5 x
          c = drop 9 x
