%{ /* definiciones de lenguaje C */
   /* lenguaje C */

  #include<stdio.h>

 /*
   Los analizadores léxico se definen con expresiones regulares.
   Las expresiones regulares son una notación simplificada
   de conjuntos regulares.
   Los conjuntos regulares: conjuntos finitos + operaciones
    operaciones: unión, concatenación, cerraduras ( +, *)
  */
%}


D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*



%%

"auto"			{ printf("--AUTO-- PALABRA RESERVADA"); }
"break"			{ printf("--BREAK-- PALABRA RESERVADA"); }
"case"			{ printf("--CASE-- PALABRA RESERVADA"); }
"char"			{ printf("--CHAR-- TIPO DE DATO"); }
"const"			{ printf("--CONST-- PALABRA RESERVADA"); }
"continue"		{ printf("--CONTINUE-- PALABRA RESERVADA"); }
"default"		{ printf("--DEFAULT-- PALABRA RESERVADA"); }
"do"			{ printf("--DO-- CICLO"); }
"double"		{ printf("--DOUBLE-- TIPO DE DATO"); }
"else"			{ printf("--ELSE-- CONDICIONAL"); }
"enum"			{ printf("--ENUM-- PALABRA RESERVADA"); }
"extern"		{ printf("--EXTERN-- PALABRA RESERVADA"); }
"float"			{ printf("--FLOAT-- TIPO DE DATO"); }
"for"			{ printf("--FOR-- CICLO"); }
"goto"			{ printf("--GOTO-- PALABRA RESERVADA"); }
"if"			{ printf("--IF-- CONDICIONAL"); }
"int"			{ printf("--INT-- TIPO DE DATO"); }
"long"			{ printf("--LONG-- TIPO DE DATO"); }
"register"		{ printf("--REGISTER-- PALABRA RESERVADA"); }
"return"		{ printf("--RETURN-- PALABRA RESERVADA"); }
"short"			{ printf("--SHORT-- TIPO DE DATO"); }
"signed"		{ printf("--SIGNED-- PALABRA RESERVADA"); }
"sizeof"		{ printf("--SIZEOF-- PALABRA RESERVADA"); }
"static"		{ printf("--STATIC-- PALABRA RESERVADA"); }
"struct"		{ printf("--STRUCT-- PALABRA RESERVADA"); }
"switch"		{ printf("--SWITCH-- CONDICIONAL"); }
"typedef"		{ printf("--TYPEDEF-- PALABRA RESERVADA"); }
"union"			{ printf("--UNION-- PALABRA RESERVADA"); }
"unsigned"		{ printf("--UNSIGNED-- TIPO DE DATO"); }
"void"			{ printf("--VOID-- PALABRA RESERVADA"); }
"volatile"		{ printf("--VOLATILE-- PALABRA RESERVADA"); }
"while"			{ printf("--WHILE-- CICLO"); }

{L}({L}|{D})*		{ printf("--ID--"); }

0[xX]{H}+{IS}?		{ printf("--CONSTANTE HEXADECIMAL--"); }
0{D}+{IS}?		{ printf("--IDENTIFICADOR--"); }
{D}+{IS}?		{ printf("--LONG INT--"); }
L?'(\\.|[^\\'])+'	{ printf("-- CADENA --"); }

{D}+{E}{FS}?		{ printf("-- CONSTANTE --"); }
{D}*"."{D}+({E})?{FS}?	{ printf("--FLOTANTE--"); }
{D}+"."{D}*({E})?{FS}?	{ printf("--double--"); }

L?\"(\\.|[^\\"])*\"	{ printf("--STRING_LITERAL--"); }

"..."			{ printf("--ELLIPSIS--"); }
">>="			{ printf("--ASIGNACION A LA DERECHA--"); }
"<<="			{ printf("--ASIGNACION A LA IZQUIERDA--"); }
"+="			{ printf("--OPERADOR_SUMA--"); }
"-="			{ printf("--OPERADOR_RESTA--"); }
"*="			{ printf("--OPERADOR_MULTIPLICACION--"); }
"/="			{ printf("--OPERADOR_DIVISION--"); }
"%="			{ printf("--OPERADOR_MODULO--"); }
"&="			{ printf("--OPERADOR_AND--"); }
"^="			{ printf("--OPERADOR_XOR--"); }
"|="			{ printf("--OPERADOR_OR--"); }
">>"			{ printf("--DESPLAZAMIENTO A LA DERECHA--"); }
"<<"			{ printf("--DESPLAZAMIENTO A LA IZQUIERDA--"); }
"++"			{ printf("--OPERADOR DE INCREMENTO--"); }
"--"			{ printf("--OPERADOR DE DECREMENTO--"); }
"->"			{ printf("--PTR_OP--"); }
"&&"			{ printf("--AND_OP--"); }
"||"			{ printf("--OR_OP--"); }
"<="			{ printf("--LE_OP--"); }
">="			{ printf("--GE_OP--"); }
"=="			{ printf("--EQ_OP--"); }
"!="			{ printf("--NE_OP--"); }
";"			      { printf("--;--"); }
("{"|"<%")		{ printf("--{--"); }
("}"|"%>")		{ printf("--}--"); }
","			{ printf("--,--"); }
":"			{ printf("--:--"); }
"="			{ printf("-- OPERADOR --"); }
"("			{ printf("--(--"); }
")"			{ printf("--)--"); }
("["|"<:")		{ printf("--[--"); }
("]"|":>")		{ printf("--]--"); }
"."			{ printf("-- . --"); }
"&"			{ printf("-- OPERADOR LOGICO --"); }
"!"			{ printf("-- OPERADOR LOGICO --"); }
"~"			{ printf("-- OPERADOR LOGICO --"); }
"-"			{ printf("--- - ---"); }
"+"			{ printf("-- OPERADOR --"); }
"*"			{ printf("-- OPERADOR --"); }
"/"			{ printf("-- OPERADOR--"); }
"%"			{ printf("-- OPERADOR --"); }
"<"			{ printf("--<--"); }
">"			{ printf("-->--"); }
"^"			{ printf("-- OPERADOR LOGICO--"); }
"|"			{ printf("-- OPERADOR LOGICO --"); }
"?"			{printf("--OPERADOR LOGICO--"); }


.			{ /* ignore bad characters */ }

%%

