statoAcqua :: Float -> String
statoAcqua t 
    | t < 0 = "solido"
    | t < 100 = "liquido"
    | altrimenti = "gassoso" 

-- convenzionalmente si usa "otherwise", che è definita così:
altrimenti :: Bool
altrimenti = True  

maximum' :: Ord a => [a] -> a
maximum' xs
    | null xs = error "empty list"
    | length xs == 1 = h
    | altrimenti = max h (maximum' (tail xs))
    where
        h = head xs

unzip' :: [(a,b)] -> ([a],[b])
unzip' [] = ([],[])
unzip' ((a,b):xs) = let xs' = unzip' xs in (a:fst xs',b:snd xs') 

product' :: Num a => [a] -> a
product' xs = case xs of 
    [] -> 1
    (x:xs) -> x * product' xs

descriviLista :: [a] -> String
descriviLista xs = "lista " ++ case xs of [] -> "vuota"
                                          [_] -> "singleton"
                                          _ -> "lunga"