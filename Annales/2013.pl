music(paul, 17, violon).
music(jean, 15, harpe).
music(lucie, 20, hautbois).
music(pierre, 15, clavecin).
music(lea, 22, harpe).
music(marc, 54, clavecin).
music(edouard, 38, clarinette).
music(marie, 14, violon).
music(igor, 19, hautbois).
music(eva, 53, harpe).
music(laure, 32, violon).
/*Q1.1----------------------------------------------------------*/
un_qui([E|T]):-
    music(E,X,Y).
un_qui([E|T]):-
    un_qui(T).
/*[eclipse 57]: un_qui([hello,coucou]).

No (0.00s cpu)
[eclipse 58]: un_qui([hello,marc]).

Yes (0.00s cpu, solution 1, maybe more) ?*/

/*Q1.2----------------------------------------------------------*/
hors_de(E,[]).
hors_de(E,[A|T]):-
    \==(E,A),
    hors_de(E,T).

a_music(N):-
  un_qui([N]).
/*[eclipse 56]: a_music(N).

N = paul
Yes (0.00s cpu, solution 1, maybe more) ? ;

N = jean
...
*/

music_list(L):-
  findall(R,a_music(R),L).
/*[eclipse 55]: music_list(L).

L = [paul, jean, lucie, pierre, lea, marc, edouard, marie, igor, eva, laure]*/

verif_aucun([]).
verif_aucun([H|T]):-
  music_list(L),
  hors_de(H,L),
  verif_aucun(T).
/* [eclipse 53]: verif_aucun([coucou,marc]).

  No (0.00s cpu)
  [eclipse 54]: verif_aucun([coucou,hello]).

  Yes (0.00s cpu)*/
un_qui_pas([H|T]):-
  music_list(L),
  hors_de(H,L).
un_qui_pas([H|T]):-
  un_qui_pas(T).
