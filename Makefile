#Variables 
CFLAGS = 
CPPFLAGS = 

# Mac OS X needs -ll; Linux needs -lfl
UNAME := $(shell uname)
ifeq ($(UNAME), Linux)
LIBS = -lfl
endif
ifeq ($(UNAME), Darwin)
LIBS = -ll
endif

#Rules
all: clean cflatc

cflatc: scanner
	cc  -g  -c -o lex.yy.o lex.yy.c
	cc -g -c nodes.c -o nodes.o  
	cc parser.o lex.yy.o nodes.o -o cflatc $(LIBS) -g

nodeGen:
	cd proNode; node app.js; cd ..;

parser: nodeGen
	yacc -d -v -y parser.y
	mv -f y.tab.c parser.c
	cc -g   -c -o parser.o parser.c

scanner: parser
	flex --header-file=scanner.h scanner.l

lex.yy.c: scanner.l
	flex --header-file=scanner.h scanner.l

run: all
	./cflatc < testFiles/ints.txt

graph: all
	-rm -f graph.txt graph.png
	./cflatc -a < testFiles/1.cb
	dot -Tpng graph.txt -o graph.png

clean: 
	rm -f *.o
	rm -f lex.yy.c
	rm -f cflatc
	rm -f y.tab.h
	rm -f scanner.h
	rm -f nodes.c
	rm -f nodes.h
	rm -f graph.png
	rm -f nodes.h
	rm -f graph.txt
	rm -f y.output
	rm -f parser.c
	rm -f tokens.h