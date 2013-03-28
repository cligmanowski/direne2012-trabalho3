infinito(max, -999999).
infinito(min, 999999).

proximoJogador(a,b).
proximoJogador(b,a).

minimizaOuMaximiza(min,max).
minimizaOuMaximiza(max,min).

valorEstado([[PoteA], _, _, [PoteB]], a, Resultado) :-
	Resultado is PoteA-PoteB, !.
valorEstado([[PoteA], _, _, [PoteB]], b, Resultado) :-
	Resultado is PoteB-PoteA, !.

cabecaLista([], []).
cabecaLista([H|_], H).

verifica([A, N1], [_, N2], [A, N1], min) :-
	N1 =< N2, !.
verifica([_, N1], [B, N2], [B, N2], min) :-
	N1 > N2, !.
verifica([A, N1], [_, N2], [A, N1], max) :-
	N1 >= N2, !.
verifica([_, N1], [B, N2], [B, N2], max) :-
	N1 < N2, !.
	
plausivel(EstadoInicial, JogadorInicial, MaxDepth, Proximo) :-
	percorreFilhos(EstadoInicial, Proximo, JogadorInicial, MaxDepth).

percorreFilhos(EstadoInicial, EstadoInicial, Jogador, _) :-
	findall(Filho, adjacente(EstadoInicial, Jogador, Filho), Filhos),
	Filhos = [], !.	

percorreFilhos(EstadoInicial, Retorno, Jogador, Altura) :-
	findall(Filho, adjacente(EstadoInicial, Jogador, Filho), Filhos),
	cabecaLista(Filhos, HFilhos),
	f(H) = HFilhos,
	proximoJogador(Jogador, ProximoJogador),
	infinito(max, Infinito),
	Alt is Altura,
	minimax([f(EstadoInicial)], Filhos, [H, Infinito], [Retorno, _], ProximoJogador, Alt, max).
	
minimax(_, [f(EstadoAtual) | _], _, [EstadoAtual, Valor], Jogador, 0, _) :-
	valorEstado(EstadoAtual, Jogador, Valor), !.

minimax(_, [f(EstadoAtual) | Irmaos], _, [EstadoR, Valor], Jogador, 0, MinMax) :-
	valorEstado(EstadoAtual, Jogador, Valor),
	minimax(_, Irmaos, _, [R, V], Jogador, 0, MinMax),
	verifica([EstadoAtual, Valor], [R, V], [EstadoR, Valor], MinMax), !.

minimax(_, [], [PossivelRetorno, PossivelValor], [PossivelRetorno, PossivelValor], _, _, _) :- !.

minimax(_, [f(EstadoAtual) | []], [PossivelRetorno, PossivelValor], [Retorno, Valor], Jogador, Altura, MinMax) :-
	findall(Filho, adjacente(EstadoAtual, Jogador, Filho), Filhos),
	cabecaLista(Filhos, HFilhos),
	proximoJogador(Jogador, ProximoJogador),
	minimizaOuMaximiza(MinMax, ProximaFuncao),
	infinito(ProximaFuncao, Infinito),
	Alt is Altura - 1,
	minimax(EstadoAtual, Filhos, [HFilhos, Infinito], [_, ValorFilho], ProximoJogador, Alt, ProximaFuncao),
	verifica([PossivelRetorno, PossivelValor], [EstadoAtual, ValorFilho], [Retorno, Valor], MinMax), !.
	
minimax(Pai, [f(EstadoAtual) | Irmaos], [PossivelRetorno, PossivelValor], [Retorno, Valor], Jogador, Altura, MinMax) :-
	findall(Filho, adjacente(EstadoAtual, Jogador, Filho), Filhos),
	cabecaLista(Filhos, HFilhos),
	proximoJogador(Jogador, ProximoJogador),
	minimizaOuMaximiza(MinMax, ProximaFuncao),
	infinito(ProximaFuncao, Infinito),
	Alt is Altura - 1,
	minimax(EstadoAtual, Filhos, [HFilhos, Infinito], [_, ValorFilho], ProximoJogador, Alt, ProximaFuncao),
	verifica([PossivelRetorno, PossivelValor], [EstadoAtual, ValorFilho], [NovoRetorno, NovoValor], MinMax),
	minimax(Pai, Irmaos, [NovoRetorno, NovoValor], [Retorno, Valor], Jogador, Altura, MinMax), !.

%--------------------------------------------------------------------------------------------------
%						TRABALHO 1 MANCALA
%--------------------------------------------------------------------------------------------------
igual(X, X):- !.

max(X, Y, X):-
	X >= Y, !.

max(_, Y, Y):- !.

min(X, Y, X):-
	X =< Y, !.

min(_, Y, Y):- !.

indiceDe(a,0).
indiceDe(a,1).
indiceDe(a,2).
indiceDe(a,3).

indiceDe(b,4).
indiceDe(b,5).
indiceDe(b,6).
indiceDe(b,7).

qualPote(a, PoteA, PoteB, PoteA, PoteB).
qualPote(b, PoteA, PoteB, PoteB, PoteA).

separaLista([[X1], X2, X3, [X4]], X1, X4, X2, X3).

juntaTudo(a, X1, [L1,L2,L3,L4,L5,L6,L7,L8], X2, [[X1], [L1,L2,L3,L4], [L5,L6,L7,L8], [X2]]).
juntaTudo(b, X2, [L1,L2,L3,L4,L5,L6,L7,L8], X1, [[X1], [L1,L2,L3,L4], [L5,L6,L7,L8], [X2]]).

%--------------------------------------------------------------------------------------------------

adjacente(Lista, Jogador, f(Proximo)):-
	separaLista(Lista, PoteA, PoteB, TabuleiroA, TabuleiroB),
	concatenaTabuleiro(TabuleiroA, TabuleiroB, Tabuleiro),
	verificaTabuleiro(Tabuleiro, PoteA, PoteB),
	indiceDe(Jogador, X),
	qualPote(Jogador, PoteA, PoteB, PoteJogador, PoteOponente),
	joga(Tabuleiro, X, PoteJogador, PoteAlterado, Resultado),
	juntaTudo(Jogador, PoteAlterado, Resultado, PoteOponente, Proximo).

%--------------------------------------------------------------------------------------------------

verificaTabuleiro(Tabuleiro, PoteA, PoteB):-
	somaPecas(Tabuleiro, PoteA, PoteB, TotalPecas),
	igual(TotalPecas, 32), !.

%--------------------------------------------------------------------------------------------------

somaPecas([], PoteA, PoteB, Total):-
	Total is PoteA+PoteB.

somaPecas([Pecas|Resto], PoteA, PoteB, Total):-
	somaPecas(Resto, PoteA, PoteB, TotalResto),
	Total is Pecas+TotalResto.

%--------------------------------------------------------------------------------------------------

%pega as pecas na casa indicada por 'Indice' e distribui
joga(Tabuleiro, Indice, Pote, PoteAlterado, TabuleiroFinal):-
	pegaElemento(Tabuleiro, 0, Indice, Pecas),
	Pecas > 0,
	alteraLista(Tabuleiro, 0, Indice, 0, TabuleiroAlterado),
	distribuiPecas(TabuleiroAlterado, Pecas, Pote, Indice, PoteAlterado, TabuleiroFinal).

%--------------------------------------------------------------------------------------------------

%distribui as pecas ate nao sobrar mais peca para distribuir
distribuiPecas(Tabuleiro, 0, PoteJogador, _, PoteJogador, Tabuleiro):-
	!. %evitar backtracking nao desejado
distribuiPecas(Lista, PecasDistriuir, PoteJogador, Index, PoteAlterado, Resultado):-
	I is (Index+1)mod 8,
	pegaElemento(Lista, 0, I, C),
	Pecas is PecasDistriuir-1,
	Pote is PoteJogador,
	verificaCasa(Lista, C, Pote, I, PoteAlt, TabuleiroAlterado), !,
	distribuiPecas(TabuleiroAlterado, Pecas, PoteAlt, I, PoteAlterado, Resultado).

%--------------------------------------------------------------------------------------------------

%caso tenha somente uma peca na casa
verificaCasa(Tabuleiro, Casa, Pote, Index, PoteAlt, TabAlt):-
	igual(Casa, 1),
	C is Casa-1,
	PoteAlt is Pote+2,
	alteraLista(Tabuleiro, 0, Index, C, TabAlt).

%caso contrario
verificaCasa(Tabuleiro, Casa, Pote, Index, Pote, TabAlt):-
	C is Casa+1,
	alteraLista(Tabuleiro, 0, Index, C, TabAlt).

%--------------------------------------------------------------------------------------------------

%dado um valor e um indice, alteraLista irah altera o valor da lista no indice indicado para 'Valor'
alteraLista([_|T], Y, Y, Valor, [Valor|T]).
alteraLista([Head|Tail], IndiceAtual, Indice, Valor, [Head|Resto]):-
	Indice > 0,
	I is IndiceAtual+1,
	alteraLista(Tail, I, Indice, Valor, Resto).

%--------------------------------------------------------------------------------------------------

%pega o valor na lista indicado pelo indice 'Indice'
pegaElemento([Head|_], X, X, Head).
pegaElemento([_|Tail], IndiceAtual, Indice, Elemento):-
	Indice > 0,
	I is IndiceAtual+1,
	pegaElemento(Tail, I, Indice, Elemento).

%--------------------------------------------------------------------------------------------------

concatenaTabuleiro([], Lista2, Lista2).
concatenaTabuleiro([Head1|Tail1], Lista2, [Head1|Tail3]):-
	concatenaTabuleiro(Tail1, Lista2, Tail3).

%--------------------------------------------------------------------------------------------------
