scriviCifra 0 = "zero"
scriviCifra 1 = "uno"
scriviCifra 2 = "due"
scriviCifra 3 = "tre"
scriviCifra 4 = "quattro"
scriviCifra 5 = "cinque"
scriviCifra 6 = "sei"
scriviCifra 7 = "sette"
scriviCifra 8 = "otto"
scriviCifra 9 = "nove"
scriviCifra _ = error "questo numero é composto da più di una cifra"

fattoriale n = product [1..n]

fattoriale' 0 = 1
fattoriale' n = n * fattoriale' (n - 1)

descriviLista [] = "lista vuota"
descriviLista [_] = "singleton"
descriviLista _ = "lista lunga"

length' [] = 0
length' (_:xs) = 1 + length' xs

fst' (a,_) = a