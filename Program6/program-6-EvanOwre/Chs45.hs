module Chs45 where

-- Problem 4.1
halve :: [a] -> ([a],[a])
halve xs = ((take s xs), (drop s xs))
           where
           s = (length xs) `div` 2

-- Problem 4.2 a with head and tail
third :: [a] -> a
third xs = head(tail(tail xs)) --not right, obviously

-- Problem 4.2 b with indexing !!
third' :: [a] -> a
third' xs = xs!!2 --not right, obviously

-- Problem 4.2 c with pattern matching
third'' :: [a] -> a
third'' (_:_:x:_) = x --not right, obviously

-- Problem 5.2
grid :: Int -> Int -> [(Int,Int)]
grid x y = [(i,j) | i <- [0..x],
                    j <- [0..y]]

-- Problem 5.3
square :: Int -> [(Int,Int)]
square n = [(x,y) | (x,y) <- grid n n,
                    x /=y]

-- Problem 5.4
replicate' :: Int -> a -> [a]
replicate' i x = [x | _ <-[1..i]]
