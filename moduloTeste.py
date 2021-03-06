# -*- coding: utf-8 -*-
#!/usr/bin/env/python

# parametros de entrada: [MAPA] jogador = [POTEA,1,2,3,4,5,6,7,8,POTEB]
# parametros de saida: jogadas possiveis

from __future__ import absolute_import, print_function, unicode_literals
import ast 
import sys

def adjacentes(tabuleiro,pote,vez,pote_nao_muda): #faz todas as jogadas possíveis para mostrar todos os estados possíveis e por enquanto faz somente um print delas . 
	
	i=0
	tabuleiro_antigo=list(tabuleiro)
	tamanho = len(tabuleiro)
	status=0

	if ( vez=='a' ):
		for i in range(0, tamanho//2):
			status=jogada(tabuleiro,i,pote,vez,pote_nao_muda)
			if (status==2):
				imprime(tabuleiro,pote,pote_nao_muda,tamanho)
				return 1
			
			tabuleiro=list(tabuleiro_antigo)

	elif ( vez=='b' ):
		for i in range(4, tamanho):
			status=jogada(tabuleiro,i,pote,vez,pote_nao_muda)
			if (status==2):
				imprime(tabuleiro,pote_nao_muda,pote,tamanho)
				return 1

			tabuleiro=list(tabuleiro_antigo)		

def jogada(tabuleiro,lugar,pote,vez,pote_nao_muda): #faz uma jogada em um local específico

	contador = 0
	tamanho = len(tabuleiro)		
	pos=(lugar+contador)%tamanho

	while (tabuleiro[pos] == 0):
		contador = contador+1
		pos=(lugar+contador)%tamanho
		if (contador==4):
			return 2
	
	if (tabuleiro[lugar])==0:
		return 1
  
	sementes = tabuleiro[lugar]
	tabuleiro[lugar]=0
    
	for contador in range(1, sementes+1):
		pos=(lugar+contador)%tamanho
		if ( tabuleiro[pos] == 1):
			tabuleiro[pos] = 0
			pote=pote+2
		else:
			tabuleiro[pos] = tabuleiro[pos] + 1
    
	
	if (vez=='a'): # Se for a vez do jogador a , só o pote dele pode mudar e vice-versa
		imprime(tabuleiro,pote,pote_nao_muda,tamanho)
	elif (vez=='b'):
		imprime(tabuleiro,pote_nao_muda,pote,tamanho)
		
	#print("{} {}".format(pote,tabuleiro))
	return 0

def imprime(tabuleiro,pote,pote2,tamanho): #Imprime no formato da especificação do trabalho
	tab=[]
	temp=[]
	temp2=[]	
	temp.append(pote)
	temp2.append(pote2)
	tab.append(temp)
	tab.append(tabuleiro[0:4])
	tab.append(tabuleiro[4:tamanho])
	tab.append(temp2)
	print(tab)


if __name__ == "__main__":        
	tab=[]
	tab=ast.literal_eval(sys.argv[1])
	poteA=tab[0]
	poteB=tab[9]
	tab=tab[1:9]
	vez = sys.argv[2]

	#print("Tab= {} Pote A={} PoteB={} Vez={}".format(tab,poteA,poteB,vez)) // Teste de variáveis

	if ( vez=='a' ):
			adjacentes(tab,poteA,vez,poteB)
	elif ( vez == 'b'):
			adjacentes(tab,poteB,vez,poteA)





        
        
        
