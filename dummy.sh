#!/bin/bash
#set -x
# varaveis gerais
mapa=$( echo $1 | tr -d " ") # mapa atual do juiz
login=$2 # nome do arquivo sem o "pl"
jogador=$3 # vez do jogador


listaJogadas=$(bash testaAdjacente.sh $mapa $jogador | tr -d " ")
tam=$(echo $listaJogadas | wc -w)

valorRandom=$(shuf -i 1-$tam -n 1)

jogadaEscolhida=$(echo $listaJogadas | cut -d" " -f $valorRandom)
echo $jogadaEscolhida
