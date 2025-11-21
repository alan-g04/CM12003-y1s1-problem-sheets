
data IntTree = Empty | Node Int IntTree IntTree
  deriving Show

t :: IntTree
t = Node 4 (Node 2 (Node 1 Empty Empty) (Node 3 Empty Empty)) (Node 5 Empty (Node 6 Empty Empty))


------------------------- Exercise 1

isEmpty :: IntTree -> Bool
isEmpty Empty = True
isEmpty _     = False

rootValue :: IntTree -> Int
rootValue Empty        = 0
rootValue (Node i _ _) = i

height :: IntTree -> Int
height Empty = 0
height (Node _ l r) = 1 + max (height l) (height r)

member :: Int -> IntTree -> Bool
member _ Empty = False
member x (Node i l r)
  | i == x = True
  | otherwise = member x l || member x r

-------------------------

{-
instance Show IntTree where
    show = unlines . aux ' ' ' '
      where
        aux _ _ Empty = []
        aux c d (Node x s t) = 
          [ c:' ':m | m <- aux ' ' '|' s ] ++ 
          ['+':'-':show x] ++ 
          [ d:' ':n | n <- aux '|' ' ' t ]
-}


insert :: Int -> IntTree -> IntTree
insert x Empty = Node x Empty Empty
insert x (Node y left right)
    | x == y    = Node y left right
    | x <  y    = Node y (insert x left) right
    | otherwise = Node y left (insert x right)

build :: [Int] -> IntTree
build = foldr insert Empty

flatten :: IntTree -> [Int]
flatten Empty        = []
flatten (Node x l r) = flatten l ++ [x] ++ flatten r

treemap :: (Int -> Int) -> IntTree -> IntTree
treemap f Empty        = Empty
treemap f (Node x l r) = Node (f x) (treemap f l) (treemap f r)

------------------------- Exercise 2

present :: Int -> IntTree -> Bool
present _ Empty = False
present i (Node x l r)
  | i == x = True
  | i < x = present i l
  | otherwise = present i r

largest :: IntTree -> Int
largest Empty            = error "largest: Empty tree"
largest (Node x _ Empty) = x
largest (Node x _ r)     = largest r

smallest :: IntTree -> Int
smallest Empty            = error "smallest: Empty tree"
smallest (Node x Empty _) = x
smallest (Node x l _)     = smallest l

ordered :: IntTree -> Bool
ordered Empty = True
ordered (Node x l r) = ordered l && ordered r && (isEmpty l || x > largest l) && (isEmpty r || x < smallest r)

deleteLargest :: IntTree -> IntTree
deleteLargest Empty = error "deleteLargest: Empty tree"
deleteLargest (Node x l Empty) = l 
deleteLargest (Node x l r) = Node x l (deleteLargest r)

delete :: Int -> IntTree -> IntTree
delete _ Empty = error "delete: Empty tree"
delete x (Node y l r)
    | x < y     = delete y l
    | x > y     = delete y r
    | isEmpty l = undefined
    | otherwise = undefined

sorted :: IntTree -> Bool
sorted Empty = True
sorted t     = undefined
  where
    inRange :: Int -> Int -> IntTree -> Bool
    inRange = undefined

------------------------- Exercise 3

{-

instance Show a => Show (Tree a) where
    show = unlines . aux ' ' ' '
      where
        aux _ _ Empty = []
        aux c d (Node x s t) = 
          [ c:' ':m | m <- aux ' ' '|' s ] ++ 
          ['+':'-':show x] ++ 
          [ d:' ':n | n <- aux '|' ' ' t ]


type IntTree = Tree Int

-}


------------------------- Exercise 4

{-
preorder :: Tree a -> [a]
preorder t = walk [t]
 where
  walk = undefined

inorder :: Tree a -> [a]
inorder = undefined

postorder :: Tree a -> [a]
postorder = undefined

breadthfirst :: Tree a -> [a]
breadthfirst = undefined
-}

------------------------- Exercise 5
{-
data Balance = Negative | Neutral | Positive

data AVLTree a = Leaf | AVLNode Balance a (AVLTree a) (AVLTree a)
-}

{-
instance Show a => Show (AVLTree a) where
  show = show . forget

forget :: AVLTree a -> Tree a
forget = undefined
-}

{-
insertUpdate :: Ord a => a -> AVLTree a -> (Bool,AVLTree a)
insertUpdate = undefined

insertAVL :: Ord a => a -> AVLTree a -> AVLTree a
insertAVL x = snd . insertUpdate x

toAVL :: Ord a => [a] -> AVLTree a
toAVL []     = Leaf
toAVL (x:xs) = insertAVL x (toAVL xs)
-}
