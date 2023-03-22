module BC where

--indexInto returns the index of the first argument in a list 
--(don't worry about error checking -- can assume in list)
indexInto :: Eq a => a -> [a] -> Int
indexInto _ [] = 0
indexInto x (y:ys) | x == y = 0
                   | otherwise = 1 + indexInto x ys

--converts a character into its corresponding integer value
-- e.g. '0' to 0, 'A' to 10, 'Z' to 35 
-- like hex, except with more digits
-- (consider using elem -- look it up)
dig2Int :: Char -> Int
dig2Int dChar | elem dChar ['0'..'9'] = indexInto dChar ['0'..'9']
              | otherwise = 10 + indexInto dChar ['A'..'Z']

--converts an integer in range 0..35 into its 
-- corresponding digit (0,1..Z)
-- again, don't care about ints out of bounds
num2char :: Int -> Char
num2char n | n < 10 = indexOut n 0 ['0'..'9']
           | otherwise = indexOut (n-10) 0 ['A'..'Z']
           
indexOut :: Int -> Int -> [Char] -> Char
indexOut x z (y:ys) | x == z = y
                    | otherwise = indexOut x (z+1) ys

--converts an integer value to a string representing
-- the number in base b
-- suggest looking up repeated division strategy
-- for how to convert base 10 to binary and 
-- then generalize
int2Base :: Int -> Int -> String
int2Base n b | n == 0 = ""
             | b < 11 = int2Base(div n b) b ++ show(mod n b)
             | otherwise = int2Base(div n b) b ++ [num2char(mod n b)]

--convert a number string in base b1 into an Int
-- can assume input is valid
valNumString :: String -> Int -> Int
valNumString [] _ = 0
valNumString (xs) b1 = (b1^((length xs) -1)*(dig2Int(head xs))) + valNumString (tail xs) b1

--convert String of numbers in base b1 into 
-- equivalent value in base b2, as a String
-- again, all input will be valid
convert :: String -> Int -> Int -> String
convert numString b1 b2 = int2Base (valNumString numString b1) b2
