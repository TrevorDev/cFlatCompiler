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
	cc -g -c hashtable.c -o hashtable.o 
	cc -g -c mipsGen.c -o mipsGen.o 
	cc -g -c stack.c -o stack.o 
	cc parser.o lex.yy.o nodes.o mipsGen.o hashtable.o stack.o -o cflatc $(LIBS) -g

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

runtests: all
	@echo "\n\n\n\nCompiling and running 1.cb (should work)..."
	./cflatc < testFiles/1.cb
	dot -Tpng graph.txt -o graph.png
	spim -file output.asm

	@echo "\n\n\n\nCompiling and running 2.cb (should work)..."
	./cflatc < testFiles/2.cb
	dot -Tpng graph.txt -o graph.png
	spim -file output.asm

	@echo "\n\n\n\nCompiling and running 3.cb (should work)..."
	./cflatc < testFiles/3.cb
	dot -Tpng graph.txt -o graph.png
	spim -file output.asm

	@echo "\n\n\n\nCompiling and running 4.cb (should work)..."
	./cflatc < testFiles/4.cb
	dot -Tpng graph.txt -o graph.png
	spim -file output.asm

	@echo "\n\n\n\nCompiling and running 5.cb (should work)..."
	-./cflatc < testFiles/5.cb
	dot -Tpng graph.txt -o graph.png
	spim -file output.asm

	@echo "\n\n\n\nCompiling and running 6.cb (should not work)..."
	-./cflatc < testFiles/6.cb

	@echo "\n\n\n\nCompiling and running 7.cb (should not work)..."
	-./cflatc < testFiles/7.cb

	@echo "\n\n\n\nCompiling and running 8.cb (should not work)..."
	-./cflatc < testFiles/6.cb
	
	@echo "\n\n\n\nCompiling and running 9.cb (should not work)..."
	-./cflatc < testFiles/6.cb

	@echo "\n\n\n\nCompiling and running 10.cb (should not work)..."
	-./cflatc < testFiles/6.cb

clean: 
	rm -f *.o
	rm -f lex.yy.c
	rm -f cflatc
	rm -f y.tab.h
	rm -f scanner.h
	rm -f nodes.c
	rm -f nodes.h
	rm -f graph.png
	rm -f graph.svg
	rm -f nodes.h
	rm -f graph.txt
	rm -f y.output
	rm -f parser.c
	rm -f tokens.h