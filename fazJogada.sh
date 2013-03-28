#!/bin/bash

# parametros de entrada: [MAPA ATUAL DO JOGO] [login.pl]
# parametro de saída: "0 [MAPA]" se jogada válida, "1" se inválida

#debug
#set -x

# varaveis gerais
mapa=$( echo $1 | tr -d " ") # mapa atual do juiz
login=$2 # nome do arquivo sem o "pl"
jogador=$3 # vez do jogador
altura=3 # altura maxima do planejamento
pathTrabalhos=./trabalhos/


if [[ "$login" == "dummy" ]] # se for o jogador dummy faz jogada-dummy
then
	resultadoJogador=$(bash dummy.sh $mapa $login $jogador)
else # se nao for dummy, executa trabalho do aluno
	# execucao do jogo pelo jogador
	cd $pathTrabalhos
	resultadoJogador=$(/usr/bin/prolog -t halt -g "consult($login),plausivel($mapa,$jogador,$altura,Proximo),write(Proximo),nl." 2>/dev/null)
	resultadoJogador=$( echo $resultadoJogador | tr -d " " )
	# volta diretorio
	cd ..
fi

if [[ -z $resultadoJogador ]] #se devolver vazio, gera uma falha do jogador
then
	echo 1
#	exit 1
fi

#testa se resposta do jogador esta em um dos estados presentes
testaValidade=$(bash testaAdjacente.sh $mapa $jogador | tr -d " " | egrep -ic "$(echo $resultadoJogador | sed 's#\[#\\\[#g' | sed 's#\]#\\\]#g')")

if [ $testaValidade -eq 0 ]; # se nao for valido:
then
	echo 1 #devolve falha
#       exit 1
else
	# se for valido:
	echo 0 $resultadoJogador # devolve sucesso e mapa
#	exit 0
fi

