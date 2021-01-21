/*calculadora.y
	y= yacc
	yet another compiler of compilers
	origen:unix
	
	yacc->GNU	
		bison

	Se diseña a la par de flex y por lo tanto cumple
	con funciones complementarias, su sintaxis
	es similar, consta de 3 secciones se separan por	
	un %%
	1-Definiciones de lenguaje c o %token
	2-Gramatica
	3-

	SIMBOLOS TERMINALES EN MAYUSCULAS
	simbolos no terminales en minusculas
*/


%{
#include <stdlib.h>
#include <stdio.h>
/*Manejador de errores*/
void yyerror(char *mensaje){
	printf("ERROR: %s\n", mensaje);
	exit(0);
}
/*fin de manejador de errores*/

%}

%token NUMERO
%%
programa:
;

programa: programa linea
;

linea: '\n'
;

linea: expresion '\n'	{printf("Valor = %d", $1);/*$=stack*/}
/*Avance de pila	$$	$1	$2*/
;

expresion: NUMERO	{ $$ = $1;}
;

%%
