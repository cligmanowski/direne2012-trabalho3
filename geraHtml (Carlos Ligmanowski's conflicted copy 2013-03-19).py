# -*- coding: utf-8 -*-

#importando classes
import sys
import os

class interface():

	def generate(self,listaRanking):
		self.listaRanking = lista
		genereatingHtml = open("./html/index.html", "w")
		genereatingHtml.write(self.getHeader())
		genereatingHtml.write(self.getBody(self.lista))
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
	def getBody(self,resposta):
		contentHtml = '<body>\n'
		contentHtml += '<header>\n'
		contentHtml +=
		contentHtml += '<h1> INTELIGENCIA ARTIFICIAÇ</h1><br>\n'
		contentHtml += '<h1> RANKING </h1><br>\n'
		contentHtml += '<br><body>\n'
		contentHtml += '<table border="1" bordercolor="#FFCC66" style="background-color:#FFFFCC" width="500" cellpadding="4" cellspacing="0">\n'
		contentHtml += '<TR><TD>LOGIN <TD>PONTUACAO\n'
		aqui vai ter um FOR pra gerar a tabela
		for (todos da lista)
			contentHtml += '<TR><TD> login.nome <TD> login.pontos \n'		contentHtml += '</TABLE>\n'
		return contentHtml
		contentHtml = '</body>\n'

   #gera o rodapé
	def getFooter(self):
		footer = '</html>\n'
		return footer
