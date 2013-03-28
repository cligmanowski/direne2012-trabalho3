casa(a,1).
casa(a,2).
casa(a,3).
casa(a,4).
casa(b,1).
casa(b,2).
casa(b,3).
casa(b,4).

cheio([X]):- X>0,!.
cheio([X|L]):- X>0,!;cheio(L),!.
verifica(1,[X|L]):- X>0,!.
verifica(N,[X|L]):- N1 is N-1, verifica(N1,L),!.


adjacente([A,AL,BL,B],a,Proximo) :- 
	cheio(AL),
	casa(a,N),
	sow(a, N, [A,AL,BL,B], Proximo).	
adjacente([A,AL,BL,B],b,Proximo) :- 
	cheio(BL),
	casa(b,N),
	sow(b, N, [A,AL,BL,B], Proximo).	
adjacente([A,[0,0,0,0],BL,B],a,[A,[0,0,0,0],BL,B]):-!.
adjacente([A,AL,[0,0,0,0],B],b,[A,AL,[0,0,0,0],B]):-!.

sow(a, N, [A,AL,BL,B], Prox) :-
	verifica(N,AL),
	sow_first(N, AL,A, LEFT, AL1,A1),
	sow_repeat(a, LEFT, [A1,AL1,BL,B], Prox).
sow(b, N, [A,AL,BL,B], Prox) :-
	verifica(N,BL),
	sow_first(N, BL,B, LEFT, BL1,B1),
	sow_repeat(b, LEFT, [A,AL,BL1,B1], Prox).
	
sow_first(1, [H|T],A, LEFT, [0|MYL],A1) :- inc_by_one(H, T,A, LEFT, MYL,A1),!.
sow_first(PIT, [H|T],A, LEFT, [H|MYL],A1) :- 
	PIT>1,
	P is PIT-1,
	sow_first(P, T,A, LEFT, MYL,A1).

inc_by_one(N, [],A, N, [],A):-!.
inc_by_one(0, LIST,A, 0, LIST,A):-!.
inc_by_one(N, [1 | T],A, LEFT, [HH | TT],A2) :-
	HH is 0,
	NN is N-1,
	A1 is A+2,
	inc_by_one(NN, T,[A1], LEFT, TT,A2),!.
inc_by_one(N, [H | T],A, LEFT, [HH | TT],A1) :-
	HH is H+1,
	NN is N-1,
	inc_by_one(NN, T,A, LEFT, TT,A1),!.

sow_repeat(_, 0, MB, MB):-!.
sow_repeat(a, HAND, [A,AL,BL,B], [Ae,ALe,BLe,B]) :-
	inc_by_one(HAND, BL,A, M, BL1,A1),
	inc_by_one(M, AL,A1, LEFT, AL1,A2),
	sow_repeat(a, LEFT, [A2,AL1,BL1,B], [Ae,ALe,BLe,B]),!.
sow_repeat(b, HAND, [A,AL,BL,B], [A,ALe,BLe,Be]) :-
	inc_by_one(HAND, AL,B, M, AL1,B1),
	inc_by_one(M, BL,B1, LEFT, BL1,B2),
	sow_repeat(b, LEFT, [A,AL1,BL1,B2], [A,ALe,BLe,Be]),!.

maior_heuristica([X],X):-!.
maior_heuristica([H,M],N):- H>M, N is H,!; N is M,!.
maior_heuristica([H,M|L],N):- H>M, maior_heuristica([H|L],N),!;maior_heuristica([M|L],N),!.

menor_heuristica([X],X):-!.
menor_heuristica([H,M],N):- H<M, N is H,!; N is M,!.
menor_heuristica([H,M|L],N):- H<M, menor_heuristica([H|L],N),!;menor_heuristica([M|L],N),!.

todas_as_jogadas([A,AL,BL,B],Jogador,TJ):-
        findall(Proximo, adjacente([A,AL,BL,B],Jogador,Proximo),TJ).

diferenca(A,B,N):- A>B, N is A-B;N is B-A.

n_heuristica([X|H],MH,N,F):-
        MH \= X,
        N1 is N +1,
        n_heuristica(H,MH,N1,F),!;
        F is N,!.

proxima_jogada([J|L],N,JOGADA):-
        N>1,
        N1 is N -1,
        proxima_jogada(L,N1,JOGADA),!.
proxima_jogada([J|L],1,J).

heuristica([A,AL,BL,B],[AP,ALP,BLP,BP],0,a,H):-
        diferenca(A,AP,H),!.
heuristica([A,AL,BL,B],[AP,ALP,BLP,BP],0,b,H):-
        diferenca(B,BP,H),!.
heuristica([A,AL,BL,B],[AP,ALP,BLP,BP],Prof,a,H):-
        PR is Prof - 1,
        pior_jogada([AP,ALP,BLP,BP],PR,b,He),
        diferenca(A,AP,D),
        H is He + D.
heuristica([A,AL,BL,B],[AP,ALP,BLP,BP],Prof,b,H):-
        PR is Prof - 1,
        pior_jogada([AP,ALP,BLP,BP],PR,b,He),
        diferenca(B,BP,D),
        H is He + D.

pior_heuristica([A,AL,BL,B],[AP,ALP,BLP,BP],0,a,H):-
        diferenca(A,AP,H),!.
pior_heuristica([A,AL,BL,B],[AP,ALP,BLP,BP],0,b,H):-
        diferenca(B,BP,H),!.
pior_heuristica([A,AL,BL,B],[AP,ALP,BLP,BP],Prof,a,H):-
        PR is Prof - 1,
        melhor_jogada([AP,ALP,BLP,BP],PR,b,He),
        diferenca(A,AP,D),
        H is He - D.
pior_heuristica([A,AL,BL,B],[AP,ALP,BLP,BP],Prof,b,H):-
        PR is Prof - 1,
        melhor_jogada([AP,ALP,BLP,BP],PR,a,He),
        diferenca(B,BP,D),
        H is He - D.

pior_jogada(J,Prof,Jogador,MH):-
        todas_as_jogadas(J,Jogador,TJ),
        acha_pior_heuristicas(TJ,H,J,Prof,Jogador),
        menor_heuristica(H,MH).

acha_heuristicas([J|TJ],[H|TH],LISTA,Prof,JOGADOR):-
        heuristica(LISTA,J,Prof, JOGADOR, H),
        acha_heuristicas(TJ,TH,LISTA,Prof,JOGADOR).
acha_heuristicas([],[],LISTA,Prof,JOGADOR).

acha_pior_heuristicas([J|TJ],[H|TH],LISTA,Prof,JOGADOR):-
        pior_heuristica(LISTA,J,Prof, JOGADOR, H),
        acha_pior_heuristicas(TJ,TH,LISTA,Prof,JOGADOR).
acha_pior_heuristicas([],[],LISTA,Prof,JOGADOR).

melhor_jogada(J,Prof,Jogador,MH):-
        todas_as_jogadas(J,Jogador,TJ),
        acha_heuristicas(TJ,H,J,Prof,Jogador),
        maior_heuristica(H,MH).

plausivel(L,Jogador,Prof,MJ):-
        todas_as_jogadas(L,Jogador,TJ),
        acha_heuristicas(TJ,H,L,Prof,Jogador),
        maior_heuristica(H,MH),
        n_heuristica(H,MH,1,N),
        proxima_jogada(TJ,N,MJ).

