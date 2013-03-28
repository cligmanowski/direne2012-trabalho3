#!/bin/bash -x

# parametros de entrada: [MAPA DE JOGO]
# parametros de saida: [TABULEIROS POSSIVEIS]

#nome do modulo python
moduloPython="moduloTeste.py"
#debug
#set -x

# captura parametros
adjacente=$@

#testando validade dos parametros
# expressao regular que valida a sintaxe de chamada
testaValidade=$(echo $adjacente | egrep -c "^\[\[[0-9]+\],\[[0-9]+,[0-9]+,[0-9]+,[0-9]+\],\[[0-9]+,[0-9]+,[0-9]+,[0-9]+\],\[[0-9]+\]\] [a-zA-Z]")

if [ $testaValidade -ne 1 ];
then
	echo -e "SINTAXE ERRADA"
	echo -e "VERIFIQUE A SINTAXE CORRETA NA ESPECIFICACAO"
	exit 1
fi

#parse dos parametros para a sintaxe do modulo python
parseAdjacente=$( echo $adjacente | tr -d "[" | tr -d "]" | tr " " ",")
jogadorA=$(echo $parseAdjacente | cut -d"," -f 1)
jogadorB=$(echo $parseAdjacente | cut -d"," -f 10)
turnoJogador=$(echo $parseAdjacente | cut -d"," -f 11 | tr '[:upper:]' '[:lower:]')
vetorTabuleiro="$(echo $parseAdjacente | cut -d"," -f2-9)"

testaSoma=$(($jogadorA + $jogadorB))
for i in $(echo $vetorTabuleiro | tr "," " ")
do
	testaSoma=$(($i + $testaSoma))
done

if [ $testaSoma -ne 32 ];
then
        echo -e "SINTAXE ERRADA"
        echo -e "TABULEIRO INCORRETO (NAO SOMA 32)"
        exit 1
fi

#tabuleiro na sintaxe correta
tabuleiroTestado="[$jogadorA,$vetorTabuleiro,$jogadorB] $turnoJogador"

#chama modulo python
python2.7 $moduloPython $tabuleiroTestado
