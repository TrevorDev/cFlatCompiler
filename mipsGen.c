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
					"#puti function - args: int i\n"
					"puti:\n"
					"\t#store ra\n"
					"\tmove    $fp,$sp\n"
    				"\tsub     $sp,$sp,4\n"
    				"\tsw      $ra,4($sp)\n"

    				"\t#load param\n"
    				"\tlw      $a0,8($fp)\n"
    				"\tli      $v0, 1\n"
    				"\tsyscall\n"

    				"\t#reset sp and fp, return\n"
    				"\tmove    $sp,$fp\n"
    				"\tlw	   $ra,0($fp)\n"
    				"\tlw      $fp,4($fp)\n"
    				"\tjr      $ra\n"

					"\t#putc function - args: int c\n"
					"\tputc:\n"
				    "\t#store ra\n"
				    "\tmove    $fp,$sp\n"
				    "\tsub     $sp,$sp,4\n"
				    "\tsw      $ra,4($sp)\n"

				   "\t#load param\n"
				    "\tlw      $a0,8($fp)\n"
				    "\tli      $v0, 11\n"
				    "\tsyscall\n"

				    "\t#reset sp and fp, return\n"
				    "\tmove    $sp,$fp\n"
				    "\tlw	   $ra,0($fp)\n"
				    "\tlw      $fp, 4($fp)\n"
				    "\tjr      $ra\n"

					"\t#putf function - args: float f\n"
					"\tputf:\n"
				    "\t#store ra\n"
				    "\tmove    $fp,$sp\n"
				    "\tsub     $sp,$sp,4\n"
				    "\tsw      $ra,4($sp)\n"

				    "\t#load param\n"
				    "\tl.s     $f12,8($fp)\n"
				    "\tli      $v0, 2\n"
				    "\tsyscall\n"

				    "\t#reset sp and fp, return\n"
				    "\tmove    $sp,$fp\n"
				    "\tlw	   $ra,0($fp)\n"
				    "\tlw      $fp, 4($fp)\n"
				    "\tjr      $ra\n"
				    "\n\nmain:\n"
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