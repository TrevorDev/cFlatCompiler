/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INT_LIT = 258,
    CHAR_LIT = 259,
    FLOAT_LIT = 260,
    VOID_LIT = 261,
    SINGLE_QUOTE = 262,
    NEW_LINE = 263,
    NULL_CHAR = 264,
    PLUS_PLUS = 265,
    PLUS = 266,
    MINUS_MINUS = 267,
    MINUS = 268,
    STAR = 269,
    SLASH = 270,
    MODULUS = 271,
    EQUALITY = 272,
    INEQUALITY = 273,
    LESS_THAN = 274,
    GREATER_THAN = 275,
    LESS_THAN_OR_EQUAL_TO = 276,
    GREATER_THAN_OR_EQUAL_TO = 277,
    LOGICAL_AND = 278,
    LOGICAL_OR = 279,
    NOT = 280,
    ASSIGNMENT = 281,
    SIZE_OF = 282,
    IF = 283,
    ELSE = 284,
    FOR = 285,
    RETURN = 286,
    WHILE = 287,
    COMMENT_OPEN = 288,
    COMMENT_CLOSE = 289,
    BRACKET_OPEN = 290,
    BRACKET_CLOSE = 291,
    PARENTHESIS_OPEN = 292,
    PARANTHESIS_CLOSE = 293,
    SEMICOLON = 294,
    CONTROL_BLOCK_OPEN = 295,
    CONTROL_BLOCK_CLOSE = 296,
    IDENTIFIER = 297,
    INT = 298,
    FLOAT = 299,
    TYPEDEF = 300,
    STRUCT = 301,
    END_OF_FILE = 302
  };
#endif
/* Tokens.  */
#define INT_LIT 258
#define CHAR_LIT 259
#define FLOAT_LIT 260
#define VOID_LIT 261
#define SINGLE_QUOTE 262
#define NEW_LINE 263
#define NULL_CHAR 264
#define PLUS_PLUS 265
#define PLUS 266
#define MINUS_MINUS 267
#define MINUS 268
#define STAR 269
#define SLASH 270
#define MODULUS 271
#define EQUALITY 272
#define INEQUALITY 273
#define LESS_THAN 274
#define GREATER_THAN 275
#define LESS_THAN_OR_EQUAL_TO 276
#define GREATER_THAN_OR_EQUAL_TO 277
#define LOGICAL_AND 278
#define LOGICAL_OR 279
#define NOT 280
#define ASSIGNMENT 281
#define SIZE_OF 282
#define IF 283
#define ELSE 284
#define FOR 285
#define RETURN 286
#define WHILE 287
#define COMMENT_OPEN 288
#define COMMENT_CLOSE 289
#define BRACKET_OPEN 290
#define BRACKET_CLOSE 291
#define PARENTHESIS_OPEN 292
#define PARANTHESIS_CLOSE 293
#define SEMICOLON 294
#define CONTROL_BLOCK_OPEN 295
#define CONTROL_BLOCK_CLOSE 296
#define IDENTIFIER 297
#define INT 298
#define FLOAT 299
#define TYPEDEF 300
#define STRUCT 301
#define END_OF_FILE 302

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
