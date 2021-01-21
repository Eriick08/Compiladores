D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*

%{
#include <stdio.h>
#include "bison.tab.h"
%}

%%
"break"|"case"|"if"|"switch"|"else"|"continue"|"default" 	{printf(" Sentencia de Control ");}
"auto"|"extern"|"static"|"register"				{printf(" Especificador de Almacenamiento");}
"char"|"double"|"float"|"int"|"void"				{printf(" tipo de dato"); }
"do"|"for"|"while"						{printf(" Bucle");}
"*"|"/"|"+"|"-"|"="|"?"		 				{printf(" Operador");}
"<="|">="|"=="|"!="|"<"|">"					{printf(" Operador Relacional");}
"&"|"!"|"|"|"^"|"~"|"&&"|"||"					{printf(" Operador Logico");}
">>"|"<<"							{printf(" Operador de desplazamiento"); }
"signed"|"unsigned"|"long"|"short"				{printf(" Modificador de tipo de dato");}
"const"|"volatile"						{printf(" Modificador de acceso");}		
"++"|"+="							{printf(" Operador de Incremento");}
"--"|"-="							{printf(" Operador de Decremento");}
"goto"								{printf(" Salto de seccion de codigo"); }
">>="								{printf(" Asignacion a Derecha"); }
"<<="								{printf(" Asignacion a Izquierda"); }
"*="								{printf(" Asignacion de Multiplicacion"); }
"/="								{printf(" Asignacion de Division"); }
"%="								{printf(" Asignacion de Modulo"); }
"enum"								{printf(" Enumeracion"); }
"return"							{printf(" Sentencia"); }
"sizeof"							{printf(" Operador"); }
"struct"							{printf(" Estructura"); }
"typedef"|"union"|"main"					{printf(" Palabra Reservada");}
"->"								{printf(" Operador Apuntador");}	
"%"								{printf(" Modulo"); }
";"								{printf(" ;"); }
("{"|"<%")							{printf(" {"); }
("}"|"%>")							{printf(" }");}
","								{printf(" ,");}
":"								{printf(" :");}
"("								{printf(" (");}
")"								{printf(" )");}
("["|"<:")							{printf(" [");}
("]"|":>")							{printf(" ]");}
"."								{printf(" .");}
"\n"								{printf(" Salto de linea \n");}
[\t\v\n\f\b\r\"\´\0\v\a\o\x]					{printf(" Constante de barra invertida");}
"..."								{printf(" Ellipsis"); }
{D}+{E}{FS}?							{printf(" Constante"); }
{L}({L}|{D})*							{printf(" Identificador");}
{D}*"."{D}+({E})?{FS}?						{printf(" Flotante"); }
{D}+"."{D}*({E})?{FS}?						{printf(" Double"); }
L?\"(\\.|[^\\"])*\"						{printf(" Cadena Constante"); }
0[xX]{H}+{IS}?							{printf(" Hexadecimal"); }
0{D}+{IS}?							{printf(" Identificador");}
{D}+{IS}?							{printf(" Digito"); }
L?'(\\.|[^\\'])+'						{printf(" Cadena Constante"); }
%%
