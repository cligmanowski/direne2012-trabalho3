%Jogo Mancala
%Yuri Danielewicz



  
plausivel(Tabuleiro, a, Altura, Proximo):-
    % verifica se o tabuleiro está vazio
    [_, TA, _, _] = Tabuleiro,
    vazio(TA),
    Proximo = Tabuleiro, !;

    % Tabuleiro não está vazio, verifica se é tabuleiro válido e joga
    [CA, TA, TB, CB] = Tabuleiro,
    valida_tabuleiro(CA, TA, TB, CB),
    busca(Tabuleiro, Altura, a, Jogada),
    joga(Tabuleiro, Jogada, a, Proximo).



plausivel(Tabuleiro, b, Altura, Proximo):-
    % verifica se o tabuleiro está vazio
    [_, _, TB, _] = Tabuleiro,
    vazio(TB),
    Proximo = Tabuleiro, !;
  
    % Tabuleiro não está vazio, verifica se é tabuleiro válido e joga
    [CA, TA, TB, CB] = Tabuleiro,
    valida_tabuleiro(CA, TA, TB, CB),
    busca(Tabuleiro, Altura, b, Jogada),
    joga(Tabuleiro, Jogada, b, Proximo).


vazio([0,0,0,0]).


valida_tabuleiro(CA, TA, TB, CB):-
    CA < 12,
    length(TA, L1),
    L1 = 4,
    length(TB, L2),
    L2 = 4,
    CB < 12, !;
    % verifica se o jogador A venceu.
    CA >= 12,
    write('Jogador A venceu!'), !, fail;
    % verifica se o jogador B venceu.
    CB >= 12,
    write('Jogador B venceu!'), !, fail;
    % informa que a configuração do tabuleiro é inválida!
    write('Tabuleiro inválido!'), nl, !, fail.

%Busca MinMax

busca(Tabuleiro, Profundidade, Jogador, Jogada) :- 
    minmax_alf_beta(Jogador, Profundidade, Tabuleiro, -100, 100, Jogada, _).


minmax_alf_beta(Jogador, 0, Tabuleiro, _, _, [], Valor) :- calc_heuristica(Tabuleiro, Jogador, Valor).

minmax_alf_beta(Jogador, Profundidade, Tabuleiro, Alfa, Beta, Jogada, Valor) :- 
    Profundidade > 0, 
    findall(J, possibilidades(Tabuleiro, J, Jogador), Jogadas), 
    Alfa1 is -Beta, 
    Beta1 is -Alfa,
    P1 is Profundidade -1, 
    escolhe(Jogador, Jogadas, Tabuleiro, P1, Alfa1, Beta1, [], Jogada, Valor).


escolhe(_, [],_, _, Alfa, _, Buraco, Buraco, Alfa).
escolhe(Jogador, [Jogada|Jogadas], Tabuleiro, Profundidade, Alfa, Beta, Registro, MelhorJogada, MelhorValor) :-
    joga(Tabuleiro, Jogada, Jogador, NovoTabuleiro), 
    oponente(Jogador, Oponente),
    minmax_alf_beta(Oponente, Profundidade, NovoTabuleiro, Alfa, Beta, _, Valor),
    Valor1 is -Valor,
    corta(Jogador, Jogada, Valor1, Profundidade, Alfa, Beta, Jogadas, Tabuleiro, Registro, MelhorJogada, MelhorValor).


corta(_, Jogada, Valor, _, _, Beta, _, _, _, Jogada, Valor) :- 
   Valor >= Beta, !.
corta(Jogador, Jogada, Valor, Profundidade, Alfa, Beta, Jogadas, Tabuleiro, _, MelhorJogada, MelhorValor) :- 
   Alfa < Valor, Valor < Beta, !, 
   escolhe(Jogador, Jogadas, Tabuleiro, Profundidade, Valor, Beta, Jogada, MelhorJogada, MelhorValor).
corta(Jogador,_, Valor, Profundidade, Alfa, Beta, Jogadas, Tabuleiro, Registro, MelhorJogada, MelhorValor) :- 
   Valor =< Alfa, !, 
   escolhe(Jogador, Jogadas, Tabuleiro, Profundidade, Alfa, Beta, Registro, MelhorJogada, MelhorValor).


calc_heuristica(Tabuleiro, a, Heuristica):-
    [CA, _, _, CB] = Tabuleiro,
    Heuristica is CA - CB.
calc_heuristica(Tabuleiro, b, Heuristica):-
    [CA, _, _, CB] = Tabuleiro,
    Heuristica is CB - CA.


possibilidades([_,[0, 0, 0, 0], _, _], [], a).
possibilidades([_, _,[0, 0, 0, 0], _], [], b).
possibilidades(Tabuleiro, Buraco, a) :-
    member(Buraco, [1, 2, 3, 4]),       % apenas os buracos válidos
    pedras(Tabuleiro, Buraco, Pedras),  % obtém o número de pedras no buraco
    Pedras > 0.
possibilidades(Tabuleiro, Buraco, b) :-
    member(Buraco, [5, 6, 7, 8]),       % apenas os buracos válidos
    pedras(Tabuleiro, Buraco, Pedras),  % obtém o número de pedras no buraco
    Pedras > 0.
    
oponente(a, b).
oponente(b, a).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MANIPULAÇÃO DO TABULEIRO
%%

joga(Tabuleiro, [], _, Tabuleiro):- !.

joga(Tabuleiro, Posicao, a, NovoTabuleiro):-
    Posicao > 0,
    Posicao < 5, !,
    pedras(Tabuleiro, Posicao, Pedras),
    define_tabuleiro(Tabuleiro, 0, Posicao, NT),
    prox_pos(Posicao, NP),
    organiza_tabuleiro(NT, Pedras, NP, a, NovoTabuleiro), !; 
    write('Jogada inválida!'), nl, !, fail.
joga(Tabuleiro, Posicao, b, NovoTabuleiro):-
    Posicao > 4,
    Posicao < 9, !,
    pedras(Tabuleiro, Posicao, Pedras),
    define_tabuleiro(Tabuleiro, 0, Posicao, NT),
    prox_pos(Posicao, NP),
    organiza_tabuleiro(NT, Pedras, NP, b, NovoTabuleiro), !; 
    write('Jogada inválida!'), nl, !, fail.   


organiza_tabuleiro(Tabuleiro, 0, _, _, Tabuleiro).
organiza_tabuleiro(Tabuleiro, Pedras, Posicao, a, NovoTabuleiro):-
    Pedras > 0,
    Posicao > 0, !,
    incrementa(Tabuleiro, Posicao, Quantidade, Capturadas),
    define_tabuleiro(Tabuleiro, Quantidade, Posicao, NT),
    define_capturadas(NT, Capturadas, a, NT2),
    prox_pos(Posicao, NP),
    Restante is Pedras - 1,
    organiza_tabuleiro(NT2, Restante, NP, a, NT3),
    NovoTabuleiro = NT3.
organiza_tabuleiro(Tabuleiro, Pedras, Posicao, b, NovoTabuleiro):-
    Pedras > 0,
    Posicao > 0, !,
    incrementa(Tabuleiro, Posicao, Quantidade, Capturadas),
    define_tabuleiro(Tabuleiro, Quantidade, Posicao, NT),
    define_capturadas(NT, Capturadas, b, NT2),
    prox_pos(Posicao, NP),
    Restante is Pedras - 1,
    organiza_tabuleiro(NT2, Restante, NP, b, NT3),
    NovoTabuleiro = NT3.

define_tabuleiro(Tabuleiro, Pedras, 1, NovoTabuleiro) :-
    [CA, [_, B2, B3, B4], TB, CB] = Tabuleiro,
    NovoTabuleiro = [CA, [Pedras, B2, B3, B4], TB, CB].
define_tabuleiro(Tabuleiro, Pedras, 2, NovoTabuleiro) :-
    [CA, [B1, _, B3, B4], TB, CB] = Tabuleiro,
    NovoTabuleiro = [CA, [B1, Pedras, B3, B4], TB, CB].
define_tabuleiro(Tabuleiro, Pedras, 3, NovoTabuleiro) :-
    [CA, [B1, B2, _, B4], TB, CB] = Tabuleiro,
    NovoTabuleiro = [CA, [B1, B2, Pedras, B4], TB, CB].
define_tabuleiro(Tabuleiro, Pedras, 4, NovoTabuleiro) :-
    [CA, [B1, B2, B3, _], TB, CB] = Tabuleiro,
    NovoTabuleiro = [CA, [B1, B2, B3, Pedras], TB, CB].
define_tabuleiro(Tabuleiro, Pedras, 5, NovoTabuleiro) :-
    [CA, TA, [_, B6, B7, B8], CB] = Tabuleiro,
    NovoTabuleiro = [CA, TA, [Pedras, B6, B7, B8], CB].
define_tabuleiro(Tabuleiro, Pedras, 6, NovoTabuleiro) :-
    [CA, TA, [B5, _, B7, B8], CB] = Tabuleiro,
    NovoTabuleiro = [CA, TA, [B5, Pedras, B7, B8], CB].
define_tabuleiro(Tabuleiro, Pedras, 7, NovoTabuleiro) :-
    [CA, TA, [B5, B6, _, B8], CB] = Tabuleiro,
    NovoTabuleiro = [CA, TA, [B5, B6, Pedras, B8], CB].
define_tabuleiro(Tabuleiro, Pedras, 8, NovoTabuleiro) :-
    [CA, TA, [B5, B6, B7, _], CB] = Tabuleiro,
    NovoTabuleiro = [CA, TA, [B5, B6, B7, Pedras], CB].
                           

inc_pedras(Pedras, Capturadas, NovasPedras):-
    Pedras > 0,
    Pedras < 2,
    NovasPedras is 0,
    Capturadas is 2;
    NovasPedras is Pedras + 1,
    Capturadas is 0.
    

incrementa([_, [B1, _, _, _], _, _], 1, Pedras, Capturadas):- inc_pedras(B1, Capturadas, Pedras).
incrementa([_, [_, B2, _, _], _, _], 2, Pedras, Capturadas):- inc_pedras(B2, Capturadas, Pedras).
incrementa([_, [_, _, B3, _], _, _], 3, Pedras, Capturadas):- inc_pedras(B3, Capturadas, Pedras).
incrementa([_, [_, _, _, B4], _, _], 4, Pedras, Capturadas):- inc_pedras(B4, Capturadas, Pedras).
incrementa([_, _, [B5, _, _, _], _], 5, Pedras, Capturadas):- inc_pedras(B5, Capturadas, Pedras).
incrementa([_, _, [_, B6, _, _], _], 6, Pedras, Capturadas):- inc_pedras(B6, Capturadas, Pedras).
incrementa([_, _, [_, _, B7, _], _], 7, Pedras, Capturadas):- inc_pedras(B7, Capturadas, Pedras).
incrementa([_, _, [_, _, _, B8], _], 8, Pedras, Capturadas):- inc_pedras(B8, Capturadas, Pedras).

pedras(Tabuleiro, 1, Pedras):- [_, [Pedras, _, _, _], _, _] = Tabuleiro.
pedras(Tabuleiro, 2, Pedras):- [_, [_, Pedras, _, _], _, _] = Tabuleiro.
pedras(Tabuleiro, 3, Pedras):- [_, [_, _, Pedras, _], _, _] = Tabuleiro.
pedras(Tabuleiro, 4, Pedras):- [_, [_, _, _, Pedras], _, _] = Tabuleiro.
pedras(Tabuleiro, 5, Pedras):- [_, _, [Pedras, _, _, _], _] = Tabuleiro.
pedras(Tabuleiro, 6, Pedras):- [_, _, [_, Pedras, _, _], _] = Tabuleiro.
pedras(Tabuleiro, 7, Pedras):- [_, _, [_, _, Pedras, _], _] = Tabuleiro.
pedras(Tabuleiro, 8, Pedras):- [_, _, [_, _, _, Pedras], _] = Tabuleiro.

define_capturadas(Tabuleiro, 0, _, Tabuleiro).
define_capturadas(Tabuleiro, Capturadas, a, NovoTabuleiro):-
    [CA, TA, TB, CB] = Tabuleiro,
    CA2 is CA + Capturadas,
    NovoTabuleiro = [[CA2], TA, TB, CB].
define_capturadas(Tabuleiro, Capturadas, b, NovoTabuleiro):-
    [CA, TA, TB, CB] = Tabuleiro,
    CB2 is CB + Capturadas,
    NovoTabuleiro = [CA, TA, TB, [CB2]].

prox_pos(8, 1).
prox_pos(Posicao, NovaPosicao) :-
    Posicao > 0,
    Posicao < 8, !,
    NovaPosicao is Posicao + 1.
