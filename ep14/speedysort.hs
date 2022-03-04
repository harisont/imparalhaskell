speedysort :: Ord a => [a] -> [a] 
speedysort [] = []
speedysort (x:xs) = speedysort lo ++ [x] ++ speedysort hi
    where lo = [y | y <- xs, y < x]
          hi = [z | z <- xs, z >= x]