% Birth order (lower number = born earlier)
born(prince_charles, 1).
born(princess_ann, 2).
born(prince_andrew, 3).
born(prince_edward, 4).

% Children of Queen Elizabeth
child(prince_charles, queen_elizabeth).
child(princess_ann, queen_elizabeth).
child(prince_andrew, queen_elizabeth).
child(prince_edward, queen_elizabeth).

/*
To reflect the new succesion rule, i removed the gender predicates and changed
the succesor predicate to use any child of queen elizabeth. The ordered succession list is now generated
purely by sorting the children based on their birth order using the keysort/2 predicate.
*/

% Generic successor: any child of the queen
successor(X) :-
    child(X, queen_elizabeth),
    born(X, _).  % optional check for birth record

/*
I used the findall predicate to collect a key value pair for all children 
of queen elizabeth e.g 1-prince_charles

Then i use the keysort value predicate of prolog to sort them by birth number
then i extract just the values from the pairs with pairs_values(Sorted, List);
*/

ordered_new_succession(List) :-
    findall(B-X, (child(X, queen_elizabeth), born(X, B)), Pairs),
    keysort(Pairs, Sorted),
    pairs_values(Sorted, List).