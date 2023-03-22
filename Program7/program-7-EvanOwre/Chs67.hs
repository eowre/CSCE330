module Chs67 where

--don't delete the import, obviously
--remember to include function types (3 points each)

sumdown :: Int -> Int
sumdown 0 = 0
sumdown x = x + sumdown(x-1)

euclid :: Int -> Int -> Int
euclid x y | x == y = x
           | x > y = euclid (x-y) y
           | x < y = euclid (y-x) x

sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum(xs)

take' :: Int -> [a] -> [a]
take' n [] = []
take' 0 _ = []
take' n (x:xs) = x : take' (n-1) xs

last' :: [a] -> a
last' [x] = x
last' (x:xs) = last' xs

dec2int' :: [Int] -> Int
dec2int' = foldl (\x y -> 10*x+y) 0

altmap :: (a->b) -> (a->b) -> [a] -> [b]
altmap f g [] = []
altmap f g (x:[]) = f x : []
altmap f g (x:y:xs) = f x : g y : altmap f g xs


--define your own function(s) to help with luhn

luhn :: [Int] -> Bool
luhn = mod10op . sum . (altmap luhnDouble id)

luhnDouble :: Int -> Int
luhnDouble x = if n < 10 then n else n - 9
               where n = x*2

mod10op :: Int -> Bool
mod10op x = x `mod` 10 == 0
