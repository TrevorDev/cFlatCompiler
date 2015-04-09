%{
         #include "nodes.h"
         #include "y.tab.h"
		int commentsOn;
		char *linebuf = NULL;
		int tokenpos, tokenlen;

%}
%x C_COMMENT
%option yylineno
DIGIT		[0-9]
NZDIGIT	[1-9]
LETTER	[a-zA-Z_]
INT		(0|([1-9][0-9]*))
FLOAT	[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?
CHARACTER (['].['])|([']\\n['])

%%

<INITIAL>\n.*    { tokenpos = 0; free(linebuf); linebuf = strdup(yytext+1); yyless(1); }

'	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return SINGLE_QUOTE;
}

"\0"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return NULL_CHAR;
}

"++"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return PLUS_PLUS;
}

"+"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return PLUS;
}

"--"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return MINUS_MINUS;
}

"-"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return MINUS;
}

"*"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return STAR;
}

"\/"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return SLASH;
}

"%"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return MODULUS;
}

"=="	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return EQUALITY;
}

"!="	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return INEQUALITY;
}

"<"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return LESS_THAN;
}

">"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return GREATER_THAN;
}

"<="	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return LESS_THAN_OR_EQUAL_TO;
}

">="	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return GREATER_THAN_OR_EQUAL_TO;
}

"&&"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return LOGICAL_AND;
}

"||"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return LOGICAL_OR;
}

"!"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return NOT;
}

"="	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return ASSIGNMENT;
}

"if"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return IF;
}

"else"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return ELSE;
}

"for"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return FOR;
}

"return"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return RETURN;
}

"while"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return WHILE;
}

"/\*"	{
	tokenpos = 0;
	commentsOn = 1;
	BEGIN(C_COMMENT);
	//return COMMENT_OPEN;
}

<C_COMMENT>"*/" { 
	tokenpos = 0;
	commentsOn = 0;
	BEGIN(INITIAL);
}

<C_COMMENT>.    { }

"\("	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return BRACKET_OPEN;
}

"\)"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return BRACKET_CLOSE;
}

"\["	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return SQUARE_OPEN;
}

"\]"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return SQUARE_CLOSE;
}

"\;"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return SEMICOLON;
}	

"\{"	{
		tokenlen = yyleng;
		tokenpos += yyleng;
		return CONTROL_BLOCK_OPEN;
}

"\}"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return CONTROL_BLOCK_CLOSE;
}

"typedef"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return TYPEDEF;
}

","	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return COMMA;
}

"." {
	tokenlen = yyleng;
	tokenpos += yyleng;
	return DOT;
}

"struct"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	return STRUCT;
}

{INT}	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	sscanf(yytext, "%d", &yylval.ival);
	return INT;
}

{CHARACTER} {
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.cval = yytext[1];
	if(strcmp(yytext, "'\\n'")==0){
		//printf("<<<<<<<<<< %s\n'n", yytext);
		char* ret = calloc(sizeof(*ret), 3);
		ret[0] = '\n';
		yylval.cval = ret[0];
	}
	return CHAR;
}

{FLOAT}	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	sscanf(yytext, "%f", &yylval.fval);
	return FLOAT;
}

<<EOF>>	{
	return END_OF_FILE;
}

"int"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup("int");
	return INT_LIT;
}

"float"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup("float");
	return FLOAT_LIT;
}

"void"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup("void");
	return VOID_LIT;
}

"char"	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup("char");
	return CHAR_LIT;
}

{LETTER}({LETTER}|{DIGIT})*	{
	tokenlen = yyleng;
	tokenpos += yyleng;
	yylval.sval = strdup(yytext);
	return IDENTIFIER;
}

[\t\s ]	{
	tokenpos += yyleng;
}

%%