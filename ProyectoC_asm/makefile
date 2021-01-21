a.out: main.o lex.yy.o ansic.tab.o
	gcc main.o lex.yy.o ansic.tab.o -ll

main.o: main.c ansic.tab.c
	gcc -c main.c

lex.yy.o: lex.yy.c
	gcc -c lex.yy.c

ansic.tab.o: ansic.tab.c
	gcc -c ansic.tab.c

lex.yy.c: ansic.l ansic.tab.c
	flex ansic.l

ansic.tab.c: ansic.y
	bison -d ansic.y

clean:
	rm -f a.out main.o lex.yy.o ansic.tab.o lex.yy.c ansic.tab.c ansic.tab.h

run: a.out
	./a.out
