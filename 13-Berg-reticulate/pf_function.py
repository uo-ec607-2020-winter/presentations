import math as m

def primefactor ( n ):
    while n % 2 == 0:
        print(2),
        n = n/2

    for i in range( 3 , int(m.sqrt(n)) , 2 ):
        while n % i == 0:
            print(i),
            n = n / i

    if n > 2:
        print(n)
        
z = 97403 ;
print("The prime factors of "+str(z)+" are:" ) ;
primefactor(z) ;
