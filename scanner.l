%{
         #include "nodes.h"
         #include "y.tab.h"

%}
%option yylineno
DIGIT		[0-9]
NZDIGIT	[1-9]
LETTER	[a-zA-Z_]
INT		[-+]?(0|([1-9][0-9]*))
FLOAT	[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?


%%

'	{
	return SINGLE_QUOTE;
}

"\n"	{
	//EAT NEWLINES AND USE yylineno
	//return NEW_LINE;
}

"\0"	{
	return NULL_CHAR;
}

"++"	{
	return PLUS_PLUS;
}

"+"	{
	return PLUS;
}

"--"	{
	return MINUS_MINUS;
}

"-"	{
	return MINUS;
}

"*"	{
	return STAR;
}

"\/"	{
	return SLASH;
}

"%"	{
	return MODULUS;
}

"=="	{
	return EQUALITY;
}

"!="	{
	return INEQUALITY;
}

"<"	{
	return LESS_THAN;
}

">"	{
	return GREATER_THAN;
}

"<="	{
	return LESS_THAN_OR_EQUAL_TO;
}

">="	{
	return GREATER_THAN_OR_EQUAL_TO;
}

"&&"	{
	return LOGICAL_AND;
}

"||"	{
	return LOGICAL_OR;
}

"!"	{
	return NOT;
}

"="	{
	return ASSIGNMENT;
}

"sizeof"	{	
	return SIZE_OF;
}

"if"	{
	return IF;
}

"else"	{
	return ELSE;
}

"for"	{
	return FOR;
}

"return"	{
	return RETURN;
}

"while"	{
	return WHILE;
}

"/\*"	{	
	return COMMENT_OPEN;
}

"\*/"	{	
	return COMMENT_CLOSE;
}

"\("	{
	return BRACKET_OPEN;
}

"\)"	{
	return BRACKET_CLOSE;
}

"\["	{
	return SQUARE_OPEN;
}

"\]"	{
	return SQUARE_CLOSE;
}

"\;"	{
	return SEMICOLON;
}	

"\{"	{
		return CONTROL_BLOCK_OPEN;
}

"\}"	{
	return CONTROL_BLOCK_CLOSE;
}

"typedef"	{
	return TYPEDEF;
}

","	{
	return COMMA;
}


"struct"	{
	return STRUCT;
}

{INT}	{
	sscanf(yytext, "%d", &yylval.ival);
	return INT;
}

{FLOAT}	{
	sscanf(yytext, "%f", &yylval.fval);
	return FLOAT;
}

<<EOF>>	{
	return END_OF_FILE;
}

"int"	{
	return INT_LIT;
}

"float"	{
	return FLOAT_LIT;
}

"void"	{
	return VOID_LIT;
}

"char"	{
	return CHAR_LIT;
}

{LETTER}({LETTER}|{DIGIT})*	{
	yylval.sval = strdup(yytext);
	return IDENTIFIER;
}

[\t\s ]	{

}

%%