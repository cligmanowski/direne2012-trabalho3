# -*- coding: utf-8 -*-

#importando classes
from __future__ import absolute_import, print_function, unicode_literals
import sys
import os

class interface():

	def generate(self,listaRanking,listaexec):
		listaRanking 
		genereatingHtml = open("./html/resultado_jogo.html", "w")
		genereatingHtml.write(self.getHeader())
		genereatingHtml.write(self.getBody(listaRanking,listaexec))
		genereatingHtml.write(self.getFooter())
		genereatingHtml.close()

	#gera cabecalho do HTML
	def getHeader(self):
		headHtml = '<html>\n'
		headHtml += '<head><title>INTELIGENCIA ARTIFICIAL - RANKING</title>\n'
		headHtml += '<meta http-equiv="content-type" content="text/html; charset=utf-8"/>\n'
		headHtml += '<meta http-equiv="refresh" content="10">\n'
		headHtml += '</head>\n'
		return headHtml

   # GERA AS TABELAS
	def getBody(self,resposta,resposta2):
		
		contentHtml = '<body>\n'
		contentHtml += '<header text-align="center"><h1> INTELIGENCIA ARTIFICIAL</h1></header><br>\n'
		contentHtml += '<article>\n'
		contentHtml += '<h1> RANKING </h1></ br>\n'
		contentHtml += '<table border="1" bordercolor=\"#FFCC66\" style=\"background-color:#FFFFCC\"  width=\"500\" cellpadding=\"4\" cellspacing=\"0\">\n'
		contentHtml += '<tr><td>LOGIN </td>\n<td>PONTUACAO</td></tr>\n'
		for i in resposta:
			contentHtml += '<tr><td> {} </TD><td> {} </td></tr> \n'.format(i[0],i[1])
		
		contentHtml += '</table>\n'
		contentHtml += '</article>\n'
		contentHtml += '<aside>\n'
		contentHtml += '<h1> Partidas </h1></ br>\n'
		contentHtml += '<table border="1" bordercolor=\"#FFCC66\" style=\"background-color:#FFFFCC\"  width=\"500\" cellpadding=\"4\" cellspacing=\"0\">\n'
		contentHtml += '<tr><td> Jogo </td>\n<td> Ganhador </td></tr>\n'
		for i in resposta2:
			contentHtml += '<tr><td> {} </TD><td> {} </td></tr> \n'.format(i[0],i[1])
		
		contentHtml += '</table>\n'
		contentHtml += '</aside>\n'
		contentHtml += '</body>\n'
		return contentHtml

   #gera o rodapé
	def getFooter(self):
		footer = '</html>\n'
		return footer
