all:
	lex -o vowelcount.c vowelcount.l && gcc vowelcount.c -o vowelcount.o && rm vowelcount.c
	lex -o generalcount.c generalcount.l && gcc generalcount.c -o generalcount.o && rm generalcount.c
	lex -o digitcount.c digitcount.l && gcc digitcount.c -o digitcount.o && rm digitcount.c

clean: 
	rm vowelcount.o digitcount.o generalcount.o