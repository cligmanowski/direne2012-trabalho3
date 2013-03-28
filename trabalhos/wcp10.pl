:- prolog_language('pop11').
false -> popmemlim;
false -> pop_prolog_lim;
10e7 -> pop_callstack_lim;
true -> popdprecision;
12 -> pop_pr_places;
:- prolog_language('prolog').

:- dynamic conjunto_d_alphas_e_betas/1.
:- dynamic altura_maxima/1.
:- dynamic melhor_jogada/2.
:- dynamic jogador_q_eh_maquina/1.

concatena( [], L, L).

concatena( [ X | Xcauda], Lista, [ X | Xcauda_2]) :-
    concatena( Xcauda, Lista, Xcauda_2).

proximo_campo_r( Pote, Pote, Sementes, Sementes, [], []).

proximo_campo_r( Pote, Pote, 0, 0, X, X).

proximo_campo_r( Pote, Pote_prox, Sementes, Sementes_prox, [ X | Xcauda], [ Y | Ycauda]) :-
    Sementes > 0,
    Sementes_prox_aux is Sementes - 1,
    (
        (X is 1, Y is 0, Pote_prox_aux is Pote + 2, !);
        (Y is X + 1, Pote_prox_aux is Pote)
    ),
    proximo_campo_r( Pote_prox_aux, Pote_prox, Sementes_prox_aux, Sementes_prox, Xcauda, Ycauda), !.

proximo_campo_controle( Pote, Pote, 0, Sementes_prox, X, X).

proximo_campo_controle( Pote, Pote_prox, Sementes, Sementes_prox, X, Y) :-
    Sementes > 0,
    proximo_campo_r( Pote, Pote_prox_aux, Sementes, Sementes_prox_aux, X, Saida),
    proximo_campo_controle( Pote_prox_aux, Pote_prox_aux2, Sementes_prox_aux, Sementes_prox_aux2, Saida, Z),
    Pote_prox is Pote_prox_aux2,
    Y is Z.

proximo_campo( Pote, Pote_prox, Sementes, Antes, [X | Xcauda], Y) :-
    Sementes > 0,
    Lista2 is  [ 0 | Lista],
    proximo_campo_r( Pote, Pote_prox_aux, Sementes, Sementes_prox, Xcauda, Lista),
    concatena( Antes, Lista2, Depois),
    proximo_campo_controle( Pote_prox_aux, Pote_prox_aux2, Sementes_prox, Sementes_prox_aux2, Depois, Depois2),
    Pote_prox is Pote_prox_aux2,
    Y is Depois2.

arruma_saida( PoteA, [ BA1, BA2, BA3, BA4, BB1, BB2, BB3, BB4], PoteB, Saida ) :-
    Saida is [[ PoteA], [ BA1, BA2, BA3, BA4], [ BB1, BB2, BB3, BB4], [ PoteB]].


adjacente( [ [ PoteA], [ BA1, BA2, BA3, BA4], [ BB1, BB2, BB3, BB4], [ PoteB] ], a, Jogada) :-
    (
    proximo_campo( PoteA, PoteA_prox, BA1, [], [ BA1, BA2, BA3, BA4, BB1, BB2, BB3, BB4], Proxima_jogada),
    arruma_saida( PoteA_prox, Proxima_jogada, PoteB, Saida),
    Jogada is Saida
    )
    ;
    (
    proximo_campo( PoteA, PoteA_prox, BA2, [ BA1], [ BA2, BA3, BA4, BB1, BB2, BB3, BB4], Proxima_jogada),
    arruma_saida( PoteA_prox, Proxima_jogada, PoteB, Saida),
    Jogada is Saida
    )
    ;
    (
    proximo_campo( PoteA, PoteA_prox, BA3, [ BA1, BA2], [ BA3, BA4, BB1, BB2, BB3, BB4], Proxima_jogada),
    arruma_saida( PoteA_prox, Proxima_jogada, PoteB, Saida),
    Jogada is Saida
    )
    ;
    (
    proximo_campo( PoteA, PoteA_prox, BA4, [ BA1, BA2, BA3], [ BA4, BB1, BB2, BB3, BB4], Proxima_jogada),
    arruma_saida( PoteA_prox, Proxima_jogada, PoteB, Saida),
    Jogada is Saida
    ).

adjacente( [ [ PoteA], [ BA1, BA2, BA3, BA4], [ BB1, BB2, BB3, BB4], [ PoteB] ], b, Jogada) :-
    (
    proximo_campo( PoteB, PoteB_prox, BB1, [ BA1, BA2, BA3, BA4], [ BB1, BB2, BB3, BB4], Proxima_jogada),
    arruma_saida( PoteA, Proxima_jogada, PoteB_prox, Saida),
    Jogada is Saida
    )
    ;
    (
    proximo_campo( PoteB, PoteB_prox, BB2, [ BA1, BA2, BA3, BA4, BB1], [ BB2, BB3, BB4], Proxima_jogada),
    arruma_saida( PoteA, Proxima_jogada, PoteB_prox, Saida),
    Jogada is Saida
    )
    ;
    (
    proximo_campo( PoteB, PoteB_prox, BB3, [ BA1, BA2, BA3, BA4, BB1, BB2], [ BB3, BB4], Proxima_jogada),
    arruma_saida( PoteA, Proxima_jogada, PoteB_prox, Saida),
    Jogada is Saida
    )
    ;
    (
    proximo_campo( PoteB, PoteB_prox, BB4, [ BA1, BA2, BA3, BA4, BB1, BB2, BB3], [ BB4], Proxima_jogada),
    arruma_saida( PoteA, Proxima_jogada, PoteB_prox, Saida),
    Jogada is Saida
    ).

fae( [ [PoteA], _, _, _], _, Valor_Fae):-
    jogador_q_eh_maquina( a),
    PoteA >= 12,
    Valor_Fae is 999999,
    !.

fae( [ _, _, _, [PoteB]], _, Valor_Fae):-
    jogador_q_eh_maquina( a),
    PoteB >= 12,
    Valor_Fae is -999999,
    !.

fae( [ [PoteA], [ BA1, BA2, BA3, BA4], [ BB1, BB2, BB3, BB4], [PoteB]], b, Valor_Fae):-
    jogador_q_eh_maquina( a),
    Peso_PoteA is PoteA * 10,
    Peso_PoteB is PoteB * 10,
    Peso_Pote is Peso_PoteA - Peso_PoteB,
    PesoA is BA1 + BA2 + BA3 + BA4,
    PesoB is BB1 + BB2 + BB3 + BB4,
    Peso_Campo is PesoA - PesoB,
    Valor_Fae is Peso_Pote + Peso_Campo,
    !.

fae( [ [PoteA], [ BA1, BA2, BA3, BA4], [ BB1, BB2, BB3, BB4], [PoteB]], a, Valor_Fae):-
    jogador_q_eh_maquina( a),
    Peso_PoteA is PoteA * 10,
    Peso_PoteB is PoteB * 10,
    Peso_Pote is Peso_PoteB - Peso_PoteA,
    PesoA is BA1 + BA2 + BA3 + BA4,
    PesoB is BB1 + BB2 + BB3 + BB4,
    Peso_Campo is PesoB - PesoA,
    Valor_Fae is Peso_Pote + Peso_Campo,
    !.

fae( [ [PoteA], _, _, _], _, Valor_Fae):-
    jogador_q_eh_maquina( b),
    PoteA >= 12,
    Valor_Fae is -999999,
    !.

fae( [ _, _, _, [PoteB]], _, Valor_Fae):-
    jogador_q_eh_maquina( b),
    PoteB >= 12,
    Valor_Fae is 999999,
    !.

fae( [ [PoteA], [ BA1, BA2, BA3, BA4], [ BB1, BB2, BB3, BB4], [PoteB]], a, Valor_Fae):-
    jogador_q_eh_maquina( b),
    Peso_PoteA is PoteA * 10,
    Peso_PoteB is PoteB * 10,
    Peso_Pote is Peso_PoteB - Peso_PoteA,
    PesoA is BA1 + BA2 + BA3 + BA4,
    PesoB is BB1 + BB2 + BB3 + BB4,
    Peso_Campo is PesoB - PesoA,
    Valor_Fae is Peso_Pote + Peso_Campo,
    !.

fae( [ [PoteA], [ BA1, BA2, BA3, BA4], [ BB1, BB2, BB3, BB4], [PoteB]], b, Valor_Fae):-
    jogador_q_eh_maquina( b),
    Peso_PoteA is PoteA * 10,
    Peso_PoteB is PoteB * 10,
    Peso_Pote is Peso_PoteA - Peso_PoteB,
    PesoA is BA1 + BA2 + BA3 + BA4,
    PesoB is BB1 + BB2 + BB3 + BB4,
    Peso_Campo is PesoA - PesoB,
    Valor_Fae is Peso_Pote + Peso_Campo,
    !.

min( Tabuleiro, Jogador, Altura, Valor_Fae):-
    altura_maxima( Altura),
    fae( Tabuleiro, Jogador, Valor_Fae),
    !.

min( [ [PoteA], TA, TB, [PoteB]], Joagdor, _, Valor_Fae):-
    PoteA >= 12,
    fae( [ [ PoteA], TA, TB, [ PoteB]], Jogador, Valor_Fae),
    !;
    PoteB >= 12,
    fae( [ [ PoteA], TA, TB, [ PoteB]], Jogador, Valor_Fae),
    !.

min( Tabuleiro, Jogador, Altura, Valor_Fae):-
    adjacente( Tabuleiro, Jogador, Prox_Tabuleiro),
    adversario( Jogador, Prox_Jogador),
    Prox_Altura is Altura + 1,
    conjunto_d_alphas_e_betas( [ [ Alpha, Beta] | Elementos]),
    max( Prox_Tabuleiro, Prox_Jogador, Prox_Altura, Valor_Fae_R),
    menor( Beta, Valor_Fae_R, Menor_Beta),
    Alpha >= Menor_Beta, % Poda
    Valor_Fae is Menor_Beta,
    !.

min( _, _, _, Valor_Fae):-
    conjunto_d_alphas_e_betas( [ [ _, Beta]| _]),
    Valor_Fae is Beta,
    !.

max( Tabuleiro, Jogador, Altura, Valor_Fae):-
    altura_maxima( Altura),
    fae( Tabuleiro, Jogador, Valor_Fae),
    !.

max( [ [PoteA], TA, TB, [PoteB]], Jogador, _, Valor_Fae):-
    PoteA >= 12,
    fae( [ [PoteA], TA, TB, [PoteB]], Jogador, Valor_Fae),
    !;
    PoteB >= 12,
    fae( [ [PoteA], TA, TB, [PoteB]], Jogador, Valor_Fae),
    !.

max( Tabuleiro, Jogador, Altura, Valor_Fae):-
    adjacente( Tabuleiro, Jogador, Prox_Tabuleiro),
    adversario( Jogador, Prox_Jogador),
    Prox_Altura is Altura + 1,
    conjunto_d_alphas_e_betas( [ [ Alpha, Beta]| _]),
    min( Prox_Tabuleiro, Prox_Jogador, Prox_Altura, Valor_Fae_R),
    maior( Alpha, Valor_Fae_R, Alpha_Maior),
    Maior_Alpha >= Beta,
    Valor_Fae is Maior_Alpha,
    !.

max( _, _, _, Valor_Fae):-
    conjunto_d_alphas_e_betas( [ [ Alpha, _]| _]),
    Valor_Fae is Alpha,
    !.

insere_melhor_jogada( Tabuleiro, Valor_Fae):-
    melhor_jogada( Tabuleiro_aux, Valor_Fae_aux),
    Valor_Fae > Valor_Fae_aux,
    retract( melhor_jogada( Tabuleiro_aux, Valor_Fae_aux)),
    assertz( melhor_jogada( Tabuleiro, Valor_Fae)),
    !.

insere_melhor_jogada( Tabuleiro, Valor_Fae):-
    melhor_jogada( Tabuleiro_axu, -99999),
    Valor_Fae == -999999,
    retract( melhor_jogada( Tabuleiro_aux, -999999)),
    assertz( melhor_jogada( Tabuleiro, Valor_Fae)),
    !.

insere_melhor_jogada( Tabuleiro, Valor_Fae):-
    Valor_Fae == 999999,
    jogador_q_eh_maquina( Jogador),
    fae( Tabuleiro, Jogador, Valor_Fae),
    melhor_jogada( Tabuleiro_aux, Valor_Fae_aux),
    retract( melhor_jogada( Tabuleiro_aux, Valor_Fae_aux)),
    assertz( melhor_jogada( Tabuleiro, Valor_Fae)),
    !.

insere_melhor_jogada( _, _):-
    !.

insere_um_elemento_alpha_beta( Elemento_Alpha_Beta):-
    !,
    conjunto_d_alphas_e_betas( Elementos),
    retract( conjunto_d_alphas_e_betas( Elementos)),
    assertz( conjunto_d_alphas_e_betas( [ Elemento_Alpha_Beta| Elementos])),
    conjunto_d_alphas_e_betas( A).

remove_um_elemento_alpha_beta( _):-
    !,
    conjunto_d_alphas_e_betas( [ Elemento_F| Elementos]),
    retract( conjunto_d_alphas_e_betas( [ Elemento_F| Elementos])),
    assertz( conjunto_d_alphas_e_betas( Elementos)),
    conjunto_d_alphas_e_betas( A).

maior( X, Y, X):-
    X >= Y,
    !.
maior( _, Y, Y):-
    !.

menor( X, Y, X):-
    X =< Y,
    !.
menor( _, Y, Y):-
    !.

adversario( a, b):-
    !.
adversario( b, a):-
    !.

jogada_plausivel_poda_ab( Tabuleiro, Jogador, Altura, _):-
    assertz( melhor_jogada( Tabuleiro, -999999)),
    adjacente( Tabuleiro, Jogador, Prox_Tabuleiro),
    adversario( Jogador, Adversario),
    Prox_Altura is Altura + 1,
    assertz( conjunto_d_alphas_e_betas( [ [ -999999, 999999]])),
    min( Prox_Tabuleiro, Adversario, Prox_Altura, Valor_Fae),
    fae( Prox_Tabuleiro, Jogador, Valor_Fae_aux),
    insere_melhor_jogada( Prox_Tabuleiro, Valor_Fae_aux),

    conjunto_d_alphas_e_betas( X),
    retract( conjunto_d_alphas_e_betas( X)),
    fail.

jogada_plausivel_poda_ab( _, _, _, Melhor_Tabuleiro):-
    melhor_jogada( Melhor_Tabuleiro, _),
    !.

plausivel( [ PoteA, [ 0, 0, 0, 0], TB, PoteB ], a, _, Proximo):-
    Proximo is [ PoteA, [ 0, 0, 0, 0], TB, PoteB],
    !.

plausivel( [ PoteA, TA, [ 0, 0, 0, 0], PoteB ], b, _, Proximo):-
    Proximo is [ PoteA, TA, [ 0, 0, 0, 0], PoteB],
    !.

plausivel( Tabuleiro, Jogador, Altura, Proximo):-
    assertz( jogador_q_eh_maquina( Jogador)),
    assertz( altura_maxima( Altura)),
    jogada_plausivel_poda_ab( Tabuleiro, Jogador, 0, Proximo),
    melhor_jogada( Melhor_Tabuleiro, Valor_Fae),

    retract( melhor_jogada( Melhor_Tabuleiro, Valor_Fae)),
    retract( jogador_q_eh_maquina( Jogador)),
    retract( altura_maxima( Altura)),
    !.

% teste
% plausivel( [ [0], [ 4, 4, 4, 4], [ 4, 4, 4, 4], [0]], a, 2, Proximo).
% plausivel( [ [0], [ 4, 4, 4, 4], [ 4, 4, 4, 4], [0]], b, 2, Proximo).
% plausivel( [ [0], [ 4, 4, 4, 4], [ 4, 4, 4, 4], [0]], a, 3, Proximo).
% plausivel( [ [0], [ 4, 4, 4, 4], [ 4, 4, 4, 4], [0]], b, 3, Proximo).
% plausivel( [ [4], [ 0, 0, 0, 0], [ 4, 4, 4, 4], [0]], a, 3, Proximo).
% plausivel( [ [0], [ 4, 4, 4, 4], [ 0, 0, 0, 0], [4]], b, 3, Proximo).
