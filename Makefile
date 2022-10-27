build: ba

ba: lex.yy.c
	gcc -o comp lex.yy.c -lfl

lex.yy.c: comp.l
	flex comp.l

clean:
	rm lex.yy.c comp *.o
