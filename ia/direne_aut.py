# -*- coding: utf-8 -*-

import sys
import subprocess

arquivo_fazjogada="../fazjogada.sh"
mapa_inicial=[4,4,4,4,4,4,4,4]
argumentos = sys.argv
tamanho_argumentos = len(sys.argv[1:])
if (tamanho_argumentos < 3):
	exit("Poucos argumentos")

print "\nFoi passado como par�metro {0} coisas !!.\n".format(tamanho_argumentos)
print "Argumentos {0}".format(sys.argv[1:])



print tamanho_argumentos
#retorno=subprocess.check_output(["ls","-l","/"], shell=False)
#print retorno

def monta_lista_programas(lista):
	jogador=[]
	global lista_programas
	for i in range(0,len(lista)):
		jogador.append(lista[i])
		jogador.append(0)
		lista_programas.append(jogador)
		jogador=[]

def round_robin(jogadores):
	global tamanho_argumentos
	i=1
	temp = 0
	temp2 = tamanho_argumentos - 1
	while (i<=tamanho_argumentos-1):
		temp=jogadores[i]
		
		if ((i-1)== 0): #S� para que na primeira itera��o o �ltimo da lista passe
			#para a posi��o 1 da lista
			jogadores[i]=jogadores[temp2]
		else:
			jogadores[i]=temp2
		if (i+1 < tamanho_argumentos-1):
			temp2=jogadores[i+1]
			jogadores[i+1]=temp

		i=i+2
		
def faz_rodada():
	global tamanho_argumentos, lista_programas
	
	numero_jogos = tamanho_argumentos/2
	for i in range(1, numero_jogos+1):
		print("Executando {} vs {}".format(lista_programas[i-1], lista_programas[tamanho_argumentos-i]))
		partida(lista_programas[i-1], lista_programas[tamanho_argumentos-i])



def partida(jogador1,jogador2):
	global mapa_inicial
	global arquivo_fazjogada
	mapa_inicialA=mapa_inicial[0:4]
	mapa_inicialB=mapa_inicial[4:8]
	vez="a"
	poteA=[0]
	poteB=[0]
	print "Aqui"
	while((poteA[0]<=12) or (poteB[0]<=12)):
		return
		if (vez=="a"):
			retorno=subprocess.call(["bash",arquivo_fazjogada,jodador1[0],vez])
			print retorno+"Ola"
			vez="b"
		else:
			retorno=subprocess.call(["bash",arquivo_fazjogada,jodador2[0],vez])
			print retorno+"Ola"
			vez="a"
	if (poteA[0]>=12):
		jogador1[1]=jogador1[1]+1
		print "Jogador 1 ganhou"
	else:
		jogador2[1]=jogador2[1]+1
		print "Jogador 2 ganhou"


lista_programas = []
monta_lista_programas(sys.argv[1:])
print lista_programas[0]
#for i in range(0,tamanho_argumentos-1):
faz_rodada()
	#round_robin(lista_programas)
print 





'''
#Algoritmo TODO:
	fazer o controle de uma execu��o 
	fazer html

cont=0
while(cont<tamanho_argumentos):
	faz_rodada(lista_programas)
	giravalores(lista_programas)


temp2 = 9 
	():
		temp = i
		i = temp2
		temp2 = i+1
		i+1 = temp
temp2 = 2
2 = temp
temp = 3
3 = temp2
temp2 = 3
3 = temp

	
Exemplo de execu��o!

0 1 2 3 4 
9 8 7 6 5

0 9 1 2 3
8 7 6 5 4

0 8 9 1 2
7 6 5 4 3

0 7 8 9 1
6 5 4 3 2

0 6 7 6 5
5 4 3 2 1 

0 5 6 7 8
4 3 2 1 9

0 4 5 6 7
3 2 1 9 6

...
'''
