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
sub     $sp,$sp,4
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
#push stack pointer forward for var ericIsDome
sub     $sp,$sp,4
#Inline putc
l.s      $f12,-4($fp)
li      $v0, 2
syscall
#push stack pointer forward for var ___temp0
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -8($fp)
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
#push stack pointer forward for var c
sub     $sp,$sp,4
#push stack pointer forward for var ___temp1
sub     $sp,$sp,4
li.s	$f0,0.000000
s.s	$f0, -8($fp)
lw	$a0,-8($fp)	#load local variable ___temp1 to register $a0
sw	$a0, -4($fp)	#store variable ___temp1 in local variable c
#frame pointer push for func call
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-4($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		foo
#push stack pointer forward for var ___temp2
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -12($fp)
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
