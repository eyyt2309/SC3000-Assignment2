% Gender facts
male(prince_charles).
male(prince_andrew).
male(prince_edward).
female(princess_ann).

% Birth order (lower number = earlier)
born(prince_charles, 1).
born(princess_ann, 2).
born(prince_andrew, 3).
born(prince_edward, 4).

% Children of Queen Elizabeth
child(prince_charles, queen_elizabeth).
child(princess_ann, queen_elizabeth).
child(prince_andrew, queen_elizabeth).
child(prince_edward, queen_elizabeth).

% Males succeed first
male_successor(X) :-
    male(X),
    child(X, queen_elizabeth).

% Females succeed after all males
female_successor(X) :-
    female(X),
    child(X, queen_elizabeth).

% Collect full succession list: males first (ordered), then females (ordered)
ordered_succession(List) :-
    findall(B-Male, (male_successor(Male), born(Male, B)), Males),
    keysort(Males, SortedMales),
    pairs_values(SortedMales, MaleList),

    findall(B-Female, (female_successor(Female), born(Female, B)), Females),
    keysort(Females, SortedFemales),
    pairs_values(SortedFemales, FemaleList),

    append(MaleList, FemaleList, List).
