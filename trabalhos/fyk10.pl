%--------------------------------------------------------------------

%regras auxiliares que dizem o próximo jogador
proximoJogador(a,b).
proximoJogador(b,a).

%--------------------------------------------------------------------

%regras auxiliares que dizem a próxima função
proximaFuncao(min,max).
proximaFuncao(max,min).

%--------------------------------------------------------------------

%regras que definem valores "infinitos"
infinito(max, -999999).
infinito(min, 999999).

%--------------------------------------------------------------------

%retorna a cabeça de um vetor
getHead([], []).
getHead([H|T], H).

%--------------------------------------------------------------------

%entre [A1, A2] e [B1, B2], diz qual é o menor ou maior entre A2 e B2
avalia([A, N1], [B, N2], [A, N1], min) :-
	N1 =< N2, !.
avalia([A, N1], [B, N2], [B, N2], min) :-
	N1 > N2, !.
avalia([A, N1], [B, N2], [A, N1], max) :-
	N1 >= N2, !.
avalia([A, N1], [B, N2], [B, N2], max) :-
	N1 < N2, !.

%--------------------------------------------------------------------		
	
%predicado principal

%depth deve ser maior que 0
plausivel(_, _, Depth, _) :-
	Depth < 1,
	writeln('Depth deve ser >= 1'), !, fail.

%caso onde o estado inicial não tem jogadas possíveis
plausivel(EstadoInicial, Jogador, Depth, EstadoInicial) :-
	findall(Filho, adjacente(EstadoInicial, Jogador, Filho), Filhos),
	Filhos = [],
	!.
%caso onde o estado inicial tem pelo menos uma jogada possível
plausivel(EstadoInicial, Jogador, Depth, Retorno) :-
	findall(Filho, adjacente(EstadoInicial, Jogador, Filho), Filhos),
	getHead(Filhos, HFilhos),
	f(H) = HFilhos,
	proximoJogador(Jogador, ProximoJogador),
	infinito(max, Inf),
	minimax([f(EstadoInicial)], Filhos, [H, Inf], [Retorno, Valor], ProximoJogador, Depth, max).
	
%--------------------------------------------------------------------
	
%função minimax
%caso onde estamos no último nível que podemos explorar
minimax(Pai, _, _, [Pai, Valor], Jogador, 0, _) :-
	proximoJogador(Jogador, JogadorPai),
	avaliaEstado(Pai, JogadorPai, Valor), !.

%caso onde o pai não tem movimentos possíveis
minimax(_, [], [PossivelRetorno, PossivelValor], [PossivelRetorno, PossivelValor], _, _, _) :-
	!.

%caso onde não temos irmãos seguintes, avaliamos nossos filhos e repassamos pra trás o resultado
minimax(Pai, [f(EstadoAtual) | []], [PossivelRetorno, PossivelValor], [Retorno, Valor], Jogador, Depth, MinOuMax) :-
	findall(Filho, adjacente(EstadoAtual, Jogador, Filho), Filhos),
	getHead(Filhos, HFilhos),
	proximoJogador(Jogador, ProximoJogador),
	proximaFuncao(MinOuMax, ProximaFuncao),
	infinito(ProximaFuncao, Inf),
	NovoDepth is Depth - 1,
	minimax(EstadoAtual, Filhos, [HFilhos, Inf], [RetornoFilho, ValorFilho], ProximoJogador, NovoDepth, ProximaFuncao),
	avalia([PossivelRetorno, PossivelValor], [EstadoAtual, ValorFilho], [Retorno, Valor], MinOuMax),
	!.

%caso onde temos irmãos seguintes, avaliamos nossos filhos e jogamos pros próximos irmãos, repassando o resultado deles pra trás
minimax(Pai, [f(EstadoAtual) | Irmaos], [PossivelRetorno, PossivelValor], [Retorno, Valor], Jogador, Depth, MinOuMax) :-
	findall(Filho, adjacente(EstadoAtual, Jogador, Filho), Filhos),
	getHead(Filhos, HFilhos),
	proximoJogador(Jogador, ProximoJogador),
	proximaFuncao(MinOuMax, ProximaFuncao),
	infinito(ProximaFuncao, Inf),
	NovoDepth is Depth - 1,
	minimax(EstadoAtual, Filhos, [HFilhos, Inf], [RetornoFilho, ValorFilho], ProximoJogador, NovoDepth, ProximaFuncao),
	avalia([PossivelRetorno, PossivelValor], [EstadoAtual, ValorFilho], [NovoRetorno, NovoValor], MinOuMax),
	minimax(Pai, Irmaos, [NovoRetorno, NovoValor], [Retorno, Valor], Jogador, Depth, MinOuMax),
	!.

%--------------------------------------------------------------------

%avalia o estado em relação ao jogador
avaliaEstado([[PotA], _, _, [PotB]], a, Sum) :-
	Sum is PotA-PotB, !.
avaliaEstado([[PotA], _, _, [PotB]], b, Sum) :-
	Sum is PotB-PotA, !.

%--------------------------------------------------------------------
%-----------------------------TRABALHO 1-----------------------------
%--------------------------------------------------------------------

%relacao de qual casa eh de qual jogador
jogavel(0, a).
jogavel(1, a).
jogavel(2, a).
jogavel(3, a).
jogavel(4, b).
jogavel(5, b).
jogavel(6, b).
jogavel(7, b).

%--------------------------------------------------------------------

%verifica se o número de pedras soma 32 e checa se a sintaxe está correta
verificaPedras([[PoteA], [A1, A2, A3, A4], [B1, B2, B3, B4], [PoteB]]) :-
	32 is PoteA+A1+A2+A3+A4+B1+B2+B3+B4+PoteB.

%--------------------------------------------------------------------

%altera um valor de um indice num vetor
alteraValor([Cabeca|Cauda], 0, Valor, [Valor|Cauda]).	
alteraValor([Cabeca|Cauda], Indice, Valor, [Cabeca|Result]) :-
	NovoIndice is Indice-1,
	alteraValor(Cauda, NovoIndice, Valor, Result).

%--------------------------------------------------------------------	
	
%pega o valor de um indice num vetor
getValor([Cabeca|Cauda], 0, Cabeca).	
getValor([Cabeca|Cauda], Indice, Result) :-
	NovoIndice is Indice-1,
	getValor(Cauda, NovoIndice, Result).

%--------------------------------------------------------------------	
	
%retorna o vetor da casa
getVetor(A, B, Casa, A) :-
	Casa < 4.
getVetor(A, B, Casa, B) :-
	Casa >= 4.

%--------------------------------------------------------------------	
	
%retorna o numero de pedras de uma casa
getValorCasa(A, B, Casa, Valor) :-
	getVetor(A, B, Casa, V),
	CasaAjustado is (Casa mod 4),
	getValor(V, CasaAjustado, Valor).

%--------------------------------------------------------------------	
	
%altera o valor de pedras de uma casa
alteraValorCasa(A, B, Casa, Valor, V, B) :-
	Casa < 4,
	alteraValor(A, Casa, Valor, V).
alteraValorCasa(A, B, Casa, Valor, A, V) :-
	Casa >= 4,
	CasaAjustado is (Casa mod 4),
	alteraValor(B, CasaAjustado, Valor, V).

%--------------------------------------------------------------------	
	
%adiciona duas pedras ao pote de um jogador
somaDoisPoteJogador(PoteA, PoteB, a, X, PoteB) :-
	X is PoteA + 2.
somaDoisPoteJogador(PoteA, PoteB, b, PoteA, X) :-
	X is PoteB + 2.

%--------------------------------------------------------------------
	
%funcao principal
adjacente([[PoteA], A, B, [PoteB]], Jogador, f(Proximo)) :-
	verificaPedras([[PoteA], A, B, [PoteB]]),
	jogavel(X, Jogador),
	%guardo quanto tinha na casa, zero o valor e distribui as pedras
	getValorCasa(A, B, X, Valor),
	Valor > 0, %ve se eh jogada valida
	alteraValorCasa(A, B, X, 0, NovoA, NovoB),
	ProxPos is (X + 1) mod 8,
	getValorCasa(A, B, ProxPos, NumPecasCasa),
	distribui([[PoteA], NovoA, NovoB, [PoteB]], Jogador, ProxPos, Valor, NumPecasCasa, Proximo).

%--------------------------------------------------------------------	
%distribui realiza uma jogada

%base, nao tem mais pedras pra distribuir
distribui(EstadoJogo, _, _, 0, _, EstadoJogo) :- 
	!.
	
%casa que vou agora tem soh uma pedra
distribui([[PoteA], A, B, [PoteB]], Jogador, ProxPosicao, NumPecas, 1, Result) :-	
	%soma dois ao meu pote e zero o que tava lah
	somaDoisPoteJogador(PoteA, PoteB, Jogador, NovoPoteA, NovoPoteB),
	alteraValorCasa(A, B, ProxPosicao, 0, NovoA, NovoB),	
	NovoProxPosicao is (ProxPosicao + 1) mod 8,
	NovoNumPecas is NumPecas-1,	
	getValorCasa(A, B, NovoProxPosicao, NovoNumPecasCasa),
	distribui([[NovoPoteA], NovoA, NovoB, [NovoPoteB]], Jogador, NovoProxPosicao, NovoNumPecas, NovoNumPecasCasa, Result), 
	!.

%outros casos
distribui([[PoteA], A, B, [PoteB]], Jogador, ProxPosicao, NumPecas, NumPecasCasa, Result) :-
	%adiciona uma pedra a casa atual
	getValorCasa(A, B, ProxPosicao, ValorAtual),
	NovoValor is ValorAtual + 1,
	alteraValorCasa(A, B, ProxPosicao, NovoValor, NovoA, NovoB),
	
	NovoProxPosicao is (ProxPosicao + 1) mod 8,
	NovoNumPecas is NumPecas-1,
	getValorCasa(A, B, NovoProxPosicao, NovoNumPecasCasa),
	distribui([[PoteA], NovoA, NovoB, [PoteB]], Jogador, NovoProxPosicao, NovoNumPecas, NovoNumPecasCasa, Result).