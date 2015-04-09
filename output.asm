

main:
move	$gp, $sp
move   $fp, $sp
#stack frame pushing
sub     $sp,$sp,4
sw      $ra,4($sp)
#frame pointer push for func call
sub     $sp,$sp,4
sw      $fp,4($sp)
jal     __main
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr		$ra


multiply:
#setup framepointer and save ra
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var a
#push stack pointer forward for var ___temp0
li.s	$f0,0.300000
s.s	$f0, -8($fp)
lw	$a0,-8($fp)	#load global variable ___temp0 to register $a0
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
#push stack pointer forward for var a
#push stack pointer forward for var ___temp1
li.s	$f0,0.200000
s.s	$f0, -8($fp)
lw	$a0,-8($fp)	#load local variable ___temp1 to register $a0
sw	$a0, -4($fp)	#store variable ___temp1 in local variable a
#push stack pointer forward for var ___temp2
li	$a0,5
sw	$a0, -12($fp)
#frame pointer push for func call
addi     $sp,$fp,-16
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-12($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		multiply
#storing return val in temp
#push stack pointer forward for var ___temp3
s.s	$f0, -16($fp)	#store variable ___temp3 in local variable ___temp3
lw	$a0,-16($fp)	#load local variable ___temp3 to register $a0
sw	$a0, -4($fp)	#store variable ___temp3 in local variable a
#Inline putc
l.s      $f12,-4($fp)
li      $v0, 2
syscall
#push stack pointer forward for var ___temp4
li	$a0,1
sw	$a0, -20($fp)
lw	$a0,-20($fp)	#load global variable ___temp4 to register $a0
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
