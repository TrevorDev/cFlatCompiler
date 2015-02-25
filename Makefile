#Variables 
CFLAGS = 
CPPFLAGS = -Iinclude
UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
LIBS = -lfl
endif
ifeq ($(UNAME), Darwin)
LIBS = -ll
endif

vpath %.c src
vpath %.h include

#Rules
all: cflatc 

cflatc: lex.yy.o parser.o
	$(CC) $^ -o $@ $(LIBS)

parser.o: y.tab.c y.tab.h

y.tab.c: parser.y
	yacc -d -y parser.y

lex.yy.c: scanner.l
	flex --header-file=scanner.h scanner.l

%.o: %.c %.h
	$(CC) -c $< -o $@ $(CFLAGS) $(CPPFLAGS)

run: all

clean: 
	rm -f *.o
	rm -f lex.yy.c
	rm -f cflatc
	rm -f y.tab.h