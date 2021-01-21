#include<stdio.h>
/*
gramatica
A ->aAa
A ->bAb
A ->c
*/
char entrada[1024]
int i;

void empatar(char x){
	if x==entrada[i]{
		i++
		
	}else{
		printf("Error: simbolo no esperado"); 
		exit(1);	
	}
}
void A(void){
	switch( entrada [i] ){
		case 'a': i++; A(); empatar('a'); break;
		case 'b': i++; A(); empatar('b');break;
		case 'c': i++; break;
	}

}



int main(void){

	scanf("%s", entrada);
	i=0
	A();

	if(entrada[i] =='\0'){
		printf("aceptada");
	}else{
		printf("rechazada");
	}	return 0;
}
