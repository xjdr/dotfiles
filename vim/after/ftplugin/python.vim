setlocal cindent 
setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class

compiler PyUnit
set mp=python\ -m\ pytest\ -v\ test%

