elem' :: Eq a => a -> [a] -> Bool 
elem' _ [] = False
elem' y (x:xs) = x == y || elem' y xs

maximum' :: Ord a => [a] -> a
maximum' [] = error "empty list"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)

minimum' :: Ord a => [a] -> a
mininum' [] = error "empty list"
minimum' [x] = x
minimum' (x:xs) = min x (minimum' xs)

sum' :: Num a => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

product' :: Num a => [a] -> a
product' [] = 1
product' (x:xs) = x * product' xs

{- Da qui in poi, tutto normale -}

-- tuple
fst' :: (a, b) -> a
fst' (a,_) = a

snd' :: (a, b) -> b
snd' (_,b) = b

-- liste & tuple
zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

unzip' :: [(a,b)] -> ([a],[b])
unzip' [] = ([],[])
unzip' ((a,b):xs) = (a:fst' (unzip' xs),b:snd' (unzip' xs)) 