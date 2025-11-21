#CM12003 #Y1S1 #haskell 

[[7-Trees.pdf|Problem Sheet]]

Exercise 1:

a)
```haskell
isEmpty :: IntTree -> Bool
isEmpty Empty = True
isEmpty _ = False
```

b)
```haskell
rootValue :: IntTree -> Int
rootValue Empty = 0
rootValue (Node i _ _) = i
```

c)
```haskell
height :: IntTree -> Int
height Empty = 0
height (Node _ l r) = 1 + max (height l) (height r)
```

d)
```haskell
member :: Int -> IntTree -> Bool
member _ Empty = False
member x (Node i l r)
	| i == x = True
	| otherwise = member x l || member x r
```

Exercise 2:

a)
```haskell
present :: Int -> IntTree -> Bool
present _ Empty = False
present i (Node x l r)
	| i == x = True
	| i < x = present i l
	| otherwise = present i r
```

b)
```haskell
largest :: IntTree -> Int
largest Empty = error "largest: Empty tree"
largest (Node x _ Empty) = x
largest (Node x _ r) = largest r
```

c)
```haskell
ordered :: IntTree -> Bool
ordered Empty = True
ordered (Node x l r) = ordered l && ordered r && (isEmpty l || x > largest l) && (isEmpty r || x < smallest r)
```

d)
```haskell
deleteLargest :: IntTree -> IntTree
deleteLargest Empty = error "deleteLargest: Empty tree"
deleteLargest (Node x l Empty) = l
deleteLargest (Node x l r) = Node x l (deleteLargest r)
```

e)
```haskell

```