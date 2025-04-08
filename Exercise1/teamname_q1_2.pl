/* First Order Logic */
/*

competitor(sumsum,appy)
developed(sumsum,galactica-s3) ∧ smartphonetechnology(galactica-s3)
stolen(stevey,galactica-s3)
boss(stevey,appy)

smartphonetechnology(X) -> business(X)
competitor(X,Y) -> rival(X,Y)
boss(X,Y) ∧ rival(Z,Y) ∧ business(W) ∧ stolen(x,w) ∧ developed(z,w) -> unethical(X)

*/

%facts
competitor(sumsum,appy).
developed(sumsum,galactica_s3).
smartphonetechnology(galactica_s3).
stolen(stevey,galactica_s3).
boss(stevey,appy).

%rules
business(X) :- smartphonetechnology(X).
rival(X,Y) :- competitor(X,Y).

unethical(X):-
    boss(X,Y),
    rival(Z,Y),
    business(W),
    stolen(X,W),
    developed(Z,W).
