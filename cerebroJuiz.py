# -*- coding: utf-8 -*-

from operator import itemgetter
import sys
import subprocess
from geraHtml import *
import ast # Contém um método que faz um parser em uma string e caso ela esteja em forma 
#de lista , ela vira uma lista

arquivo_fazjogada="fazJogada.sh"

mapa_inicial=[4,4,4,4,4,4,4,4]
argumentos = sys.argv
tamanho_argumentos = len(sys.argv[1:])
lista_exec=[]


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
		if ((i-1)== 0): #S— para que na primeira itera‹o o œltimo da lista passe
			#para a posi‹o 1 da lista
			jogadores[i]=jogadores[temp2]
		else:
			jogadores[i]=temp2
		if (i+1 < tamanho_argumentos):
			temp2=jogadores[i+1]
			jogadores[i+1]=temp

		i=i+2

#Faz uma rodada 		
def faz_rodada():
	global tamanho_argumentos, lista_programas, lista_exec
	lista_temp = []
	numero_jogos = tamanho_argumentos/2
	
	for i in range(1, numero_jogos+1):
		lista_temp.append("{} vs {}".format(lista_programas[i-1], lista_programas[tamanho_argumentos-i]))
		lista_temp.append(partida(lista_programas[i-1], lista_programas[tamanho_argumentos-i]))
		lista_exec.append(lista_temp)
		lista_temp = []
		lista_temp.append("{} vs {}".format(lista_programas[tamanho_argumentos-i], lista_programas[i-1]))
		lista_temp.append(partida(lista_programas[tamanho_argumentos-i],lista_programas[i-1]))
		lista_exec.append(lista_temp)
		lista_temp = []


#Executa uma partida entre dois jogadores
def partida(jogador1,jogador2):
	global mapa_inicial
	global arquivo_fazjogada
	mapa_inicialA=mapa_inicial[0:4]
	mapa_inicialB=mapa_inicial[4:8]
	vez="a"
	retorno=[]
	poteA=[0]
	poteB=[0]
	

	#print "\n\n INICIO {} VS {} \n\n".format(jogador1[0],jogador2[0])
	#print " ---------------------------------------------------------------------\n\n"
	while((int(poteA[0])<12) and (int(poteB[0])<12)):
		mapa="[{},{},{},{}]".format(poteA,mapa_inicialA,mapa_inicialB,poteB)
		
		if (vez=="a"):
			retorno=subprocess.check_output(["bash",arquivo_fazjogada,mapa,jogador1[0],vez])
			
			
		else:
			retorno=subprocess.check_output(["bash",arquivo_fazjogada,mapa,jogador2[0],vez])
		
		#print ("Jogadores: {} {} Vez:{} Jogada: {}".format(jogador1[0],jogador2[0],vez,retorno[2:]))
		if (retorno[0])=="0":
			mapa=ast.literal_eval(retorno[2:])
			poteA=mapa[0]
			mapa_inicialA=mapa[1]
			mapa_inicialB=mapa[2]
			poteB=mapa[3]
		
		elif (retorno[0])=="1":
			if (vez=="a"):
				jogador2[1]=jogador2[1]+1	
				#print "Jogador {} ganhou".format(jogador2[0])
				return "Jogador {} ganhou".format(jogador2[0])
			else:
				jogador1[1]=jogador1[1]+1
				#print "Jogador {} ganhou".format(jogador1[0])
				return "Jogador {} ganhou".format(jogador1[0])
		
		if (vez=="a"):
			vez="b"
		else:
			vez="a"
	#print "\n\n TERMINOU {} VS {} ".format(jogador1[0],jogador2[0])
	#print " ---------------------------------------------------------------------\n\n"
	if (int(poteA[0])>=12):
		jogador1[1]=jogador1[1]+1
		#print "Jogador {} ganhou".format(jogador1[0])
		return "Jogador {} ganhou".format(jogador1[0])
	else:
		jogador2[1]=jogador2[1]+1
		#print "Jogador {} ganhou".format(jogador2[0])
		return "Jogador {} ganhou".format(jogador2[0])

if __name__ == "__main__":
	lista_programas = []
	monta_lista_programas(sys.argv[1:])

	for i in range(0,tamanho_argumentos-1):
		faz_rodada()
		round_robin(lista_programas)

	lista_programas = sorted(lista_programas,key=itemgetter(1),reverse=True)
	interface().generate(lista_programas,lista_exec)






