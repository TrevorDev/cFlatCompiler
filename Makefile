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
all: nodeGen

cflatc: parser.o lex.yy.o nodes.o
	$(CC) $^ -o $@ $(LIBS)

nodeGen: proNode/app.js
	cd proNode; node app.js; cd ..;make cflatc;

parser.o: y.tab.c y.tab.h

y.tab.c: parser.y
	yacc -d -v -y parser.y

lex.yy.c: scanner.l
	flex --header-file=scanner.h scanner.l

%.o: %.c %.h
	$(CC) -g -c $< -o $@ $(CFLAGS) $(CPPFLAGS)

run: all
	./cflatc < testFiles/ints.txt

graph: run
	-rm -f graph.txt graph.png
	./cflatc -a < testFiles/ints.txt
	dot -Tpng graph.txt -o graph.png

clean: 
	rm -f *.o
	rm -f lex.yy.c
	rm -f cflatc
	rm -f y.tab.h
	rm -f scanner.h
	rm nodes.c
	rm nodes.h