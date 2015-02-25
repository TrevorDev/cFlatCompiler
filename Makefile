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

cflatc: lex.yy.o
	$(CC) $^ -o $@ $(LIBS)

lex.yy.c: scanner.l
	lex scanner.l

%.o: %.c %.h
	$(CC) -c $< -o $@ $(CFLAGS) $(CPPFLAGS)

run: all

clean: 
	rm -f *.o
	rm -f lex.yy.c
	rm -f cflatc