#!/bin/bash

#debug
#set -x

# parametros de entrada: nenhum
# parametros de saida: nenhum

# variaveis gerais
pathTrabalhos="./trabalhos"
pathJuiz="cerebroJuiz.py"
jogadores=$( ls $pathTrabalhos | sed 's#\.pl##g' )
numeroJogadores=$( ls $pathTrabalhos | wc -l )

# adiciona jogador aleatorio caso exista numero impar de jogadores
# motivo: um problema inerente do algoritmo de roudrobin eh que
# um (termo) e seu (termo-1) perdem uma jogada quando os termos
# estao em quantidae impar. ha duas solucoes:
# - recuperar as combinacoes perdidas
# - inserir um dummy de repouso
# Escolhemos criar um jogador dummy que faz jogadas aleatorias, uma
# escolha mais interessante

if (( $numeroJogadores % 2 ))
then
	jogadores=$(echo $jogadores dummy)
fi


# inicia juiz
python2.7 $pathJuiz $jogadores
