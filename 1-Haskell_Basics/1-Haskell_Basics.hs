

------------------------- Exercise 1
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use guards" #-}

square :: Int -> Int
square x = x * x

pythagoras :: Int -> Int -> Int -> Bool
pythagoras a b c = square a + square b == square c


------------------------- Exercise 2

factorial :: Integer -> Integer
factorial x
    | x <= 1    = 1
    | otherwise = x * factorial (x-1)

power :: Int -> Int -> Int
power x y
    | y == 0 = 1
    | y < 0 = error "y must be positive"
    | otherwise = x * power x (y-1)

expo :: Int -> Int -> Int
expo x y
    | y == 0 = 1
    | y < 0 = error "y must be positive"
    | even y = square x ^ div 2 y
    | otherwise = square x ^ div 2 (y-1)

euclid :: Int -> Int -> Int
euclid x y
    | x == y = x
    | otherwise =  euclid (min x y) (abs (x-y))


------------------------- Exercise 3

pow :: Int -> Int -> Int
pow x y = if y == 0 then 1 else if y < 0 then error "y must be positive" else if even y then square x ^ div y 2 else square x ^ div (y-1) 2


------------------------- Exercise 4

collatz :: Int -> Int
collatz x
    | x == 1 = 1
    | even x = collatz (div x 2)
    | odd x = collatz (3 * x + 1)

collatzCount :: Int -> Int -> Int
collatzCount x c
    | x == 1 = c
    | even x = collatzCount (div x 2) (c + 1)
    | odd x = collatzCount (3 * x + 1) (c + 1)


collatzMax :: Int -> (Int,Int) -> (Int,Int)
collatzMax x (m,s)
    | x == 1 = (m,s)
    | max s (collatzCount x 0) == collatzCount x 0 = collatzMax (x-1) (x, collatzCount x 0)
    | otherwise = collatzMax (x-1) (m, s)

------------------------- Exercise 5

ackermann :: Int -> Int -> Int
ackermann m n
    | m == 0 = n + 1
    | n == 0 = ackermann (m-1) 1
    | otherwise = ackermann (m - 1) (ackermann m (n - 1))
