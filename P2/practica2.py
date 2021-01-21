import string
import tkinter.messagebox as ms
import re


class Thompson:
	
	def convertir(self,cadena):
		cadena=cadena
		automata_final=[]
		abecedario=string.ascii_lowercase
		error=False
		lenguaje=[]
		separador_or = []
		separador_estrella = []
		separador_positiva = []
		operadores=["+","|","*"]
		lenguaje+=operadores
		for item in abecedario:
			lenguaje.append(item)	#obtenemos el abecedario en minusculas por que es lo que vamos a checar primero en la caden
		#bloque para validar si la cadena ingresada es permitida por el lenguaje
		for item  in cadena:
			if item not in lenguaje:
				error=True
			else:
				error=False
		if(error == True):
			ms.showerror('Cadena Invalida', 'Ingresa otra cadena')
		
		#fin de bloque para validar cadena
		automata_final.append(self.obtenerCerraduraEstrella(cadena))
		automata_final.append(self.obtenerCerraduraPositiva(cadena))
		print(automata_final)



	
	def obtenerCerraduraEstrella(self,cadena):
		automata=[]
		expresion_normal=[]
		expresion_parentesis=[]
		lista_completa=[]
		expresion_normal=re.findall("\w\*",cadena)
		expresion_parentesis=re.findall("\(\w+\)\*",cadena)
		lista_completa+=expresion_normal
		lista_completa+=expresion_parentesis
		automata.append(self.plantillaEstrella(lista_completa))
		return automata

	def obtenerCerraduraPositiva(self,cadena):
		automata=[]
		lista_completa=[]
		expresion_normal=[]
		expresion_parentesis=[]
		expresion_normal=re.findall("\w\+",cadena)
		expresion_parentesis=re.findall("\(\w+\)\+",cadena)
		lista_completa+=expresion_normal
		lista_completa+=expresion_parentesis
		automata.append(self.plantillaPositiva(lista_completa))
		return automata

	def plantillaPositiva(self,Lista):
		automatas=[]
		for item in Lista:
			item=item.replace("+","")
			contador1=1;
			contador2=2;
			if len(item) == 1: 
				lista_nueva=[]
				lista_nueva.append("Estado"+str(contador1)+"->Estado"+str(contador2)+","+item)
				lista_nueva.append("Estado"+str((contador1+1))+"->Estado"+str((contador2+1))+",E")
				lista_nueva.append("Estado"+str((contador1+1))+"->Estado"+str((contador2+3))+",E")
				lista_nueva.append("Estado"+str((contador1+2))+"->Estado"+str(contador2+2)+","+item)
				lista_nueva.append("Estado"+str((contador1+3))+"->Estado"+str(contador2+1)+",E")
				lista_nueva.append("Estado"+str((contador1+3))+"->Estado"+str(contador2+3)+",E")
				automatas.append(lista_nueva)
			if len(item) > 1:
				lista_nueva=[]
				item=item.replace("(","")
				item=item.replace(")","")
				n=1
				contador1=1+len(item)
				contador2=2+len(item)
				for letra in item:
					lista_nueva.append("Estado"+str((n))+"->Estado"+str((n+1))+","+letra)
					n=n+1
				lista_nueva.append("Estado"+str((contador1))+"->Estado"+str(contador2)+",E")
				lista_nueva.append("Estado"+str((contador1))+"->Estado"+str(contador2+1+len(item))+",E")
					#____________________________________________________
				for letra in item:
					lista_nueva.append("Estado"+str((n+1))+"->Estado"+str((n+2))+","+letra)
					n=n+1
					#_____________________________________________
				lista_nueva.append("Estado"+str((contador1+len(item)+1))+"->Estado"+str(contador2+len(item)+1)+",E")
				lista_nueva.append("Estado"+str((contador1+len(item)+1))+"->Estado"+str(contador2+len(item)-4)+",E")
				automatas.append(lista_nueva)
			
		return automatas

	def plantillaEstrella(self,Lista):
		automatas=[]

		for item in Lista:
			item=item.replace("*","")
			contador1=1;
			contador2=2;
			if len(item) == 1: 	
				lista_nueva=[]
				lista_nueva.append("Estado"+str(contador1)+"->Estado"+str(contador2)+",E")
				lista_nueva.append("Estado"+str(contador1)+"->Estado"+str(contador2+2)+",E")
				lista_nueva.append("Estado"+str((contador1+1))+"->Estado"+str((contador2+1))+","+item)
				lista_nueva.append("Estado"+str((contador1+2))+"->Estado"+str(contador2)+",E")
				lista_nueva.append("Estado"+str((contador1+2))+"->Estado"+str(contador2+2)+",E")
				automatas.append(lista_nueva)
			if len(item) > 1:
				lista_nueva=[]
				item=item.replace("(","")
				item=item.replace(")","")
				lista_nueva.append("Estado"+str(contador1)+"->Estado"+str(contador2)+",E")
				lista_nueva.append("Estado"+str(contador1)+"->Estado"+str(contador2+1+len(item))+",E")
				n=1
				for letra in item:				
					lista_nueva.append("Estado"+str((contador1+n))+"->Estado"+str((contador2+n))+","+letra)
					n=n+1
				lista_nueva.append("Estado"+str((contador1+1+len(item)))+"->Estado"+str(contador2)+",E")
				lista_nueva.append("Estado"+str((contador1+1+len(item)))+"->Estado"+str(contador2+1+len(item))+",E")
				automatas.append(lista_nueva)
		return automatas
			

	

automata= Thompson()

automata.convertir("a+b+c*")
