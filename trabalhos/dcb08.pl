%Douglas Cellarius Barros
%GRR20081692

primeiro([Prim|_], Prim):-!.
potesA([_,A,B,C,D|_], [A,B,C,D]):-!.
potesB([_,_,_,_,_,E,F,G,H], [E,F,G,H]):-!.
junta([], []):-!.
junta([A1|Rest], [A1|Ret]):-
	junta(Rest, Ret).

contaCaptura(0, _, _, 0):-!.
contaCaptura(NumBolas, [], CabecaJogo, JogoFormado):-
	contaCaptura(NumBolas, CabecaJogo, [], JogoFormado),
	!.
contaCaptura(NumBolas, [A|Tabuleiro], Volta, NumCap):-
	A = 1,
	NewNum is NumBolas - 1,
	NovoA is 0,
	append(Volta, [NovoA], Cabeca),
	contaCaptura(NewNum, Tabuleiro, Cabeca, NumRet),
	NumCap is NumRet + 2,
	!.
contaCaptura(NumBolas, [A|Tabuleiro], Volta, NumCap):-
	NewNum is NumBolas - 1,
	NovoA is A + 1,
	append(Volta, [NovoA], Cabeca),
	contaCaptura(NewNum, Tabuleiro, Cabeca, NumCap).

distribuiBolas(0, CaudaJogo, CabecaJogo, JogoFormado):-
	append(CabecaJogo, CaudaJogo, JogoFormado),
	!.
distribuiBolas(NumBolas, [], CabecaJogo, JogoFormado):-
	distribuiBolas(NumBolas, CabecaJogo, [], JogoFormado), 
	!.
distribuiBolas(NumBolas, [A|Tab], Volta, JogoFormado):-
	A = 1,
	NewNum is NumBolas - 1,
	NovoA is 0,
	append(Volta, [NovoA], Cabeca),
	distribuiBolas(NewNum, Tab, Cabeca, JogoFormado), 
	!.
distribuiBolas(NumBolas, [A|Tab], Volta, JogoFormado):-
	NewNum is NumBolas - 1,
	NovoA is A + 1,
	append(Volta, [NovoA], Cabeca),
	distribuiBolas(NewNum, Tab, Cabeca, JogoFormado), 
	!.

geraJogadas(NumPotesRestantes, _, _, []):-
	NumPotesRestantes = 0,!.
geraJogadas(NumPotesRestantes, [P1|RestoJogo], Retirados, JogadasPossiveis):-
	P1 = 0,
	append(Retirados, [P1], NovoRetirados),
	NewNumPotesRestantes is NumPotesRestantes - 1,
	geraJogadas(NewNumPotesRestantes, RestoJogo, NovoRetirados, JogadasPossiveis).	
geraJogadas(NumPotesRestantes, [P1|RestoJogo], Retirados, [NewJogada|JogadasPossiveis]):-
	append(Retirados, [P1], NovoRetirados),
	append(Retirados, [0], NovoRetZero),
	distribuiBolas(P1, RestoJogo, NovoRetZero, Distribuicao),
	contaCaptura(P1, RestoJogo, NovoRetZero, NumCap),
	append([NumCap], Distribuicao, NewJogada),
	NewNumPotesRestantes is NumPotesRestantes - 1,
	geraJogadas(NewNumPotesRestantes, RestoJogo, NovoRetirados, JogadasPossiveis).

colocaJogadasPadraoA([], _, _, []):-!.
colocaJogadasPadraoA([J1|RestoJogadas], NumA, NumB, [Jogada|Rearranjadas]):-
	primeiro(J1, NA),
	NewA is NumA + NA,
	potesA(J1,TabA),
	potesB(J1,TabB),
	junta([[NewA], TabA, TabB, [NumB]], Jogada),
	colocaJogadasPadraoA(RestoJogadas, NumA, NumB, Rearranjadas).
colocaJogadasPadraoB([], _, _, []):-!.
colocaJogadasPadraoB([J1|RestoJogadas], NumA, NumB, [Jogada|Rearranjadas]):-
	primeiro(J1, NB),
	NewB is NumB + NB,
	potesA(J1,TabA),
	potesB(J1,TabB),
	junta([[NumA], TabA, TabB, [NewB]], Jogada),
	colocaJogadasPadraoB(RestoJogadas, NumA, NumB, Rearranjadas).

verificaProxJogadas([], Jogada, [Jogada]):-!.
verificaProxJogadas(ProxJogadas, _, ProxJogadas):-!.

geraJogadasPossiveis([[NumA], PotesA, PotesB, [NumB]], Jogador, ProxJogadas):-
	Jogador = 'a',
	append(PotesA, PotesB, Unidas),
	geraJogadas(4, Unidas, [], JogadasPossiveis),
	colocaJogadasPadraoA(JogadasPossiveis, NumA, NumB, ProxJog),
	verificaProxJogadas(ProxJog, [[NumA], PotesA, PotesB, [NumB]], ProxJogadas),
	!.
geraJogadasPossiveis([[NumA], PotesA, PotesB, [NumB]], _, ProxJogadas):-
	geraJogadas(4, PotesB, PotesA, JogadasPossiveis),
	colocaJogadasPadraoB(JogadasPossiveis, NumA, NumB, ProxJog),
	verificaProxJogadas(ProxJog, [[NumA], PotesA, PotesB, [NumB]], ProxJogadas).

funcaoUtilidade([[A], _, _, [_]], Minimax):-
	A >= 12,
	Minimax is A * 2, !.
funcaoUtilidade([[_], _, _, [B]], Minimax):-
	B >= 12,
	N is -2,
	Minimax is B * N, !.
funcaoUtilidade([[A], _, _, [B]], Minimax):-
	Minimax is A - B,
	!.

eh_estado_final([Na, _, _, _]):-
	Na >= 12.
eh_estado_final([_,_,_,Nb]):-
	Nb >= 12.

minimiza(Valor1, Valor2, Valor1):-
	compare(<, Valor1, Valor2);
	compare(=, Valor1, Valor2), !.
minimiza(_, Valor2, Valor2).

comparaMinimaxBeta(_, _, Alfa, Beta, Minimax, Minimo):-
	minimiza(Beta, Minimax, Minimo),
	compare(>, Alfa, Minimo),
	!.
comparaMinimaxBeta(RestoJogadas, TamAtualArv, Alfa, Beta, Minimax, ResultadoMinimax):-	
	minimiza(Beta, Minimax, Minimo),
	iteraMinJogadasPossiveis(RestoJogadas, TamAtualArv, Alfa, Minimo, ResultadoMinimax).

iteraMinJogadasPossiveis([], _, _, Beta, Beta):-!.
iteraMinJogadasPossiveis([Jogada|RestoJogadas], TamAtualArv, Alfa, Beta, ResultadoMinimax):-
	NovoTam is TamAtualArv + 1,
	funcMAX(Jogada, NovoTam, Alfa, Beta, Minimax),
	comparaMinimaxBeta(RestoJogadas, TamAtualArv, Alfa, Beta, Minimax, ResultadoMinimax), !.

funcMIN(ConfTab, TamAtualArv, Alfa, Beta, Minimax):-
	not(eh_estado_final(ConfTab)),
	maxArvore(MaxArv),
	TamAtualArv =< MaxArv,
	geraJogadasPossiveis(ConfTab, 'b', JogadasPossiveis),
	iteraMinJogadasPossiveis(JogadasPossiveis, TamAtualArv, Alfa, Beta, Minimax), !.
funcMIN(ConfTab, _, _, _, Minimax):-
	funcaoUtilidade(ConfTab, Minimax), 
	!.

maximiza(Valor1, Valor2, Valor2):-
	compare(<, Valor1, Valor2);
	compare(=, Valor1, Valor2),
	!.
maximiza(Valor1, _, Valor1):-!.

comaparaMinimaxAlfa(_, _, Alfa, Beta, Minimax, Maximo):-
	maximiza(Alfa, Minimax, Maximo),
	compare(<, Beta, Maximo),
	!.
comaparaMinimaxAlfa(RestoJogadas, TamAtualArv, Alfa, Beta, Minimax, ResultadoMinimax):-
	maximiza(Alfa, Minimax, Maximo),
	iteraJogadasPossiveis(RestoJogadas, TamAtualArv, Maximo, Beta, ResultadoMinimax), !.

iteraMaxJogadasPossiveis([], _, Alfa, _, Alfa):-!.
iteraMaxJogadasPossiveis([Jogada|RestoJogadas], TamAtualArv, Alfa, Beta, ResultadoMinimax):-
	novoTam is TamAtualArv + 1,
	funcMIN(Jogada, novoTam, Alfa, Beta, Minimax),
	comaparaMinimaxAlfa(RestoJogadas, TamAtualArv, alfa, beta, Minimax, ResultadoMinimax), !.


funcMAX(ConfTab, TamAtualArv, Alfa, Beta, Minimax):-
	not(eh_estado_final(ConfTab)),
	maxArvore(MaxArv),
	TamAtualArv =< MaxArv,
	geraJogadasPossiveis(ConfTab, 'a', JogadasPossiveis), %gera pelo menos a opção de não fazer movimentos
	iteraMaxJogadasPossiveis(JogadasPossiveis, TamAtualArv, Alfa, Beta, Minimax), !.
funcMAX(ConfTab, _, _, _, Minimax):-
	funcaoUtilidade(ConfTab, Minimax).

compara(_, Alfa, Beta, Minimax, _, Jogada, Jogada):-
	maximiza(Alfa, Minimax, Maximo),
	compare(<, Beta, Maximo),
	!.
compara(RestoJogadas, Alfa, Beta, Minimax, _, Jogada, Proximo):-
	compare(<, Alfa, Minimax),
	iteraJogadas(RestoJogadas, Minimax, Beta, Jogada, Proximo),
	!.
compara(RestoJogadas, Alfa, Beta, _, MelhorJogo, _, Proximo):-
	iteraJogadas(RestoJogadas, Alfa, Beta, MelhorJogo, Proximo), !.
iteraJogadas([], _, _, MelhorJogo, MelhorJogo):-!.
iteraJogadas([Jogada|RestoJogadas], Alfa, Beta, MelhorJogo, Proximo):-
	funcMIN(Jogada, 1, Alfa, Beta, Minimax),
	compara(RestoJogadas, Alfa, Beta, Minimax, MelhorJogo, Jogada, Proximo), !.
iniciaCalculo(ConfTab, Proximo):-
	not(eh_estado_final(ConfTab)),
	geraJogadasPossiveis(ConfTab, 'a', JogadasPossiveis), %gera pelo menos a opção de não fazer movimentos
	R1 is -2^1025,
	R2 is 2^1025,
	iteraJogadas(JogadasPossiveis, R1, R2, [], Proximo).
iniciaCalculo(ConfTab, ConfTab):-!.
plausivel(ConfTab, Jogador, MaxTamArv, Proximo):-
	retractall(maxArvore(_)),
	assert(maxArvore(MaxTamArv)),
	Jogador = 'a',
	iniciaCalculo(ConfTab, Proximo), 
	!.
plausivel([Na, Ja, Jb, Nb], _, _, [Nna, Jja, Jjb, Nnb]):-
	iniciaCalculo([Nb, Jb, Ja, Na], [Nnb, Jjb, Jja, Nna]).
	
