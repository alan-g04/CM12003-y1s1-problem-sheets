


------------------------- Exercise 1
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}

add :: [Int] -> Int
add []     = 0
add (x:xs) = x + add xs

times :: Num a => [a] -> a
times [] = 1
times (x:xs) = x * times xs

range :: Int -> Int -> [Int]
range m n
    | m > n = []
    | otherwise = m : range (m+1) n

factorial :: Int -> Int
factorial x 
    | x == 0 || x == 1 = 1
    | otherwise = times (range 2 x)



------------------------- Exercise 2

count :: [a] -> Int
count []     = 0
count (_:xs) = 1 + count xs

append :: [a] -> [a] -> [a]
append [] ys = ys
append (x:xs) ys = x : append xs ys

concatenate :: [[a]] -> [a]
concatenate [] = []
concatenate (x:xs) = x ++ concatenate xs 


------------------------- Exercise 3

member :: Eq a => a -> [a] -> Bool
member _ [] = False
member n (x:xs) = n == x || member n xs

remove :: Int -> [Int] -> [Int]
remove _ [] = []
remove n (x:xs)
    | x == n = remove n xs
    | otherwise = x : remove n xs

at :: [a] -> Int -> a
at [] _ = error "index too large"
at (_:_) n | n < 0 = error "negative index"
at (x:xs) 0 = x
at (x:xs) n = at xs (n-1)



------------------------- Exercise 4

final :: [a] -> a
final [] = error "empty list"
final [x] = x                   -- or final (x:[]) = x
final (x:xs) = final xs

ordered :: [Int] -> Bool
ordered [] = error "empty list"
ordered [x] = True
ordered (x:y:zs) = x < y && ordered (y:zs)

pair :: [a] -> [b] -> [(a,b)]
pair [] [] = []
pair [x] [] = []
pair [] [a] = []
pair (x:ys) (a:bs) = (x,a) : pair ys bs

find :: Eq a => a -> [(a, String)] -> String
find _ [] = ""
find n ((x,y):xys)
    | n == x = y
    | otherwise = find n xys


------------------------- Exercise 5

isort :: [Int] -> [Int]
isort [] = []
isort (x:xs) = insert x (isort xs)

insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys)
    | x <= y = x : y : ys
    | otherwise = y : insert x ys

------------------------- Exercise 6

merge :: [Int] -> [Int] -> [Int]
merge = undefined

msort :: [Int] -> [Int]
msort [] = []
msort [x] = [x]


------------------------- Exercise 7

type Hanoi = ([Int],[Int],[Int])

hanoi :: Int -> [Hanoi]
hanoi = undefined