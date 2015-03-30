#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "mipsGen.h"



void append_assembler(char *instruction, ...)
{
	static FILE *fp = NULL;


	if (!fp) {
		fp = fopen("output.asm", "wb+");
		if (!fp) {
			fprintf(stderr, "ERROR OUTPUTTING ASM\n");
			exit(1);
		}
		fprintf(fp, 
					"putc:\n"
    				"move    $fp,$sp\n"

				    "sub     $sp,$sp,4\n"
				    "sw      $ra,4($sp)\n"

				    "#load and deref param\n"
				    "lw      $v0,8($fp)\n"
				    "lw      $v1,0($v0)\n"

				    "#display to screen\n"
				    "move    $a0,$v1\n"
				    "li      $v0, 11\n"
				    "syscall\n"

				    "#reset sp and fp\n"
				    "move    $sp,$fp\n"
				    "lw      $fp, 4($fp)\n"

				    "jr      $ra\n"

					"puti:\n"
				    "move    $fp,$sp\n"

				    "sub     $sp,$sp,4\n"
				    "sw      $ra,4($sp)\n"

				    "#load and deref param\n"
				    "lw      $v0,8($fp)\n"
				    "lw      $v1,0($v0)\n"

				    "#display to screen\n"
				    "move    $a0,$v1\n"
				    "li      $v0, 1\n"
				    "syscall\n"

				    "#reset sp and fp\n"
				    "move    $sp,$fp\n"
				    "lw      $fp, 4($fp)\n"

				    "jr      $ra\n"

					"putf:\n"
				    "move    $fp,$sp\n"

				    "sub     $sp,$sp,4\n"
				    "sw      $ra,4($sp)\n"

				    "#load and deref param\n"
				    "lw      $a0,8($fp)\n"
				    "l.s    $f12,($a0)\n"

				    "#display to screen\n"
				    "#move    $a0,$v1\n"
				    "li      $v0, 2\n"
				    "syscall\n"

				    "#reset sp and fp\n"
				    "move    $sp,$fp\n"
				    "lw      $fp, 4($fp)\n"

				    "jr      $ra\n"
				    "main:\n");
	}

	//fprintf(fp, "%s\n", instruction);
	va_list args;
    va_start( args, instruction );
    vfprintf( fp, format, args );
    va_end( args );
    fprintf(fp, "\n");


	fflush(fp);
}