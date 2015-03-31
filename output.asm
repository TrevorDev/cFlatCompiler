#puti function - args: int i
puti:
	#store ra
	move    $fp,$sp
	sub     $sp,$sp,4
	sw      $ra,4($sp)
	#load param
	lw      $a0,8($fp)
	li      $v0, 1
	syscall
	#reset sp and fp, return
	move    $sp,$fp
	lw	   $ra,0($fp)
	lw      $fp,4($fp)
	jr      $ra
	#putc function - args: int c
	putc:
	#store ra
	move    $fp,$sp
	sub     $sp,$sp,4
	sw      $ra,4($sp)
	#load param
	lw      $a0,8($fp)
	li      $v0, 11
	syscall
	#reset sp and fp, return
	move    $sp,$fp
	lw	   $ra,0($fp)
	lw      $fp, 4($fp)
	jr      $ra
	#putf function - args: float f
	putf:
	#store ra
	move    $fp,$sp
	sub     $sp,$sp,4
	sw      $ra,4($sp)
	#load param
	l.s     $f12,8($fp)
	li      $v0, 2
	syscall
	#reset sp and fp, return
	move    $sp,$fp
	lw	   $ra,0($fp)
	lw      $fp, 4($fp)
	jr      $ra


main:
move	$gp, $sp
move   $fp, $sp
#stack frame pushing
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var a
sub     $gp,$gp,4
#frame pointer push for func call
sub     $sp,$sp,4
sw      $fp,4($sp)
jal     __main
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr		$ra


foo:
#setup framepointer and save ra
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra


__main:
#setup framepointer and save ra
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var j
sub     $sp,$sp,4
#push stack pointer forward for var ___temp0
sub     $sp,$sp,4
li	$a0,5
sw	$a0, -8($fp)
#frame pointer push for func call
sub     $sp,$sp,4
sw      $fp,4($sp)
jal		foo
#frame pointer push for func call
sub     $sp,$sp,4
sw      $fp,4($sp)
jal		foo
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
