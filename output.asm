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
#push stack pointer forward for var d
sub     $gp,$gp,4
sub     $sp,$sp,4
#frame pointer push for func call
sub     $sp,$sp,4
sw      $fp,4($sp)
jal     __main
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr		$ra


printfloats:
#setup framepointer and save ra
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var x
sub     $sp,$sp,4
#push stack pointer forward for var y
sub     $sp,$sp,4
#push stack pointer forward for var z
sub     $sp,$sp,4
#Inline putc
l.s      $f12,-4($fp)
li      $v0, 2
syscall
#Inline putc
l.s      $f12,-8($fp)
li      $v0, 2
syscall
#Inline putc
l.s      $f12,-12($fp)
li      $v0, 2
syscall
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra


printchars:
#setup framepointer and save ra
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var x
sub     $sp,$sp,4
#push stack pointer forward for var y
sub     $sp,$sp,4
#push stack pointer forward for var z
sub     $sp,$sp,4
#Inline putf
