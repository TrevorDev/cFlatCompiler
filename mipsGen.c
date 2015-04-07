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
		fprintf(fp, "\n\nmain:\n"
				    "move	$gp, $sp\n"
				    "move   $fp, $sp\n"
					"#stack frame pushing\n"
					"sub     $sp,$sp,4\n"
					"sw      $ra,4($sp)\n"
				    );
	}

	//fprintf(fp, "%s\n", instruction);
	va_list args;
    va_start( args, instruction );
    vfprintf( fp, instruction, args );
    va_end( args );
    fprintf(fp, "\n");


	fflush(fp);
}


// a = 8 + 7 + 9;
// 	li	$a0, 8
// 	li	$a1, 7
// 	add $a0, $a0, $a1
// 	sub     $sp,$sp,4
// 	sw	$a0, 4($sp)
// 	lw	$a0, 4($sp)
// 	addi     $sp,$sp,4
// 	li	$a1, 9
// 	add $a0, $a0, $a1
// 	sw	$a0, aoff($gp)