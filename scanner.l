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
CHARACTER ['].[']

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
	yylval.sval = strdup(yytext);
	return PLUS_PLUS;
}

"+"	{
	yylval.sval = strdup(yytext);
	return PLUS;
}

"--"	{
	yylval.sval = strdup(yytext);
	return MINUS_MINUS;
}

"-"	{
	yylval.sval = strdup(yytext);
	return MINUS;
}

"*"	{
	yylval.sval = strdup(yytext);
	return STAR;
}

"\/"	{
	yylval.sval = strdup(yytext);
	return SLASH;
}

"%"	{
	yylval.sval = strdup(yytext);
	return MODULUS;
}

"=="	{
	yylval.sval = strdup(yytext);
	return EQUALITY;
}

"!="	{
	yylval.sval = strdup(yytext);
	return INEQUALITY;
}

"<"	{
	yylval.sval = strdup(yytext);
	return LESS_THAN;
}

">"	{
	yylval.sval = strdup(yytext);
	return GREATER_THAN;
}

"<="	{
	yylval.sval = strdup(yytext);
	return LESS_THAN_OR_EQUAL_TO;
}

">="	{
	yylval.sval = strdup(yytext);
	return GREATER_THAN_OR_EQUAL_TO;
}

"&&"	{
	yylval.sval = strdup(yytext);
	return LOGICAL_AND;
}

"||"	{
	yylval.sval = strdup(yytext);
	return LOGICAL_OR;
}

"!"	{
	yylval.sval = strdup(yytext);
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

{CHARACTER} {
	sscanf(yytext, "%c", &yylval.cval);
	return CHAR;
}

{FLOAT}	{
	sscanf(yytext, "%f", &yylval.fval);
	return FLOAT;
}

<<EOF>>	{
	return END_OF_FILE;
}

"int"	{
	yylval.sval = strdup("int");
	return INT_LIT;
}

"float"	{
	yylval.sval = strdup("float");
	return FLOAT_LIT;
}

"void"	{
	yylval.sval = strdup("float");
	return VOID_LIT;
}

"char"	{
	yylval.sval = strdup("char");
	return CHAR_LIT;
}

{LETTER}({LETTER}|{DIGIT})*	{
	yylval.sval = strdup(yytext);
	return IDENTIFIER;
}

[\t\s ]	{

}

%%