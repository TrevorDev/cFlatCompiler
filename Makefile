#Variables 
CFLAGS = 
CPPFLAGS = 

# Mac OS X needs -ll; Linux needs -lfl
UNAME := $(shell uname)
ifeq ($(UNAME), Linux)
LIBS = -lfl -lm
endif
ifeq ($(UNAME), Darwin)
LIBS = -ll -lm
endif

#Rules
all: cflatc 

cflatc: parser.o lex.yy.o
	$(CC) $^ -o $@ $(LIBS)

parser.o: y.tab.c y.tab.h

y.tab.c: parser.y
	yacc -d -y parser.y

lex.yy.c: scanner.l
	flex --header-file=scanner.h scanner.l

%.o: %.c %.h
	$(CC) -g -c $< -o $@ $(CFLAGS) $(CPPFLAGS)

run: all

clean: 
	rm -f *.o
	rm -f lex.yy.c
	rm -f cflatc
	rm -f y.tab.h