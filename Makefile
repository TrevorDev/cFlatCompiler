#Variables 
CFLAGS = -Wall -ansi
CPPFLAGS = -Iinclude

vpath %.c src
vpath %.h include

#Rules
all: cflatc 

cflatc: lex.yy.o
	$(CC) $^ -o $@ 

lex.yy.c: scanner.l
	lex scanner.l

%.o: %.c %.h
	$(CC) -c $< -o $@ $(CFLAGS) $(CPPFLAGS)

run: all
	

clean: 
	rm -f *.o
	rm -f cflatc