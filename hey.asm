

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


factorial:
#setup framepointer and save ra
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var n
sub     $sp,$sp,4
#push stack pointer forward for var ret
sub     $sp,$sp,4
#push stack pointer forward for var ___temp0
sub     $sp,$sp,4
li	$a0,0
sw	$a0, -12($fp)
#push stack pointer forward for var ___temp1
sub     $sp,$sp,4
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-12($fp)	#load global variable ___temp0 to register $a1
subu $t2,$a0,$a1
sltu $t2,$zero,$t2
xori $t2, $t2, 1
sw	$t2, -16($fp)	#store variable ___temp1 in local variable ___temp1
lw	$a0,-16($fp)	#load global variable ___temp1 to register $a0
beq	$zero, $a0, ___label0
#push stack pointer forward for var ___temp2
sub     $sp,$sp,4
li	$a0,68
sw	$a0, -20($fp)
#Inline putf
lw      $a0,-20($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp3
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -24($fp)
lw	$a0,-24($fp)	#load local variable ___temp3 to register $a0
sw	$a0, -8($fp)	#store variable ___temp3 in local variable ret
j ___label1 
___label0: 
#push stack pointer forward for var ___temp4
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -28($fp)
#push stack pointer forward for var ___temp5
sub     $sp,$sp,4
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-28($fp)	#load global variable ___temp4 to register $a1
sub $a0,$a0,$a1
sw	$a0, -32($fp)	#store variable ___temp5 in local variable ___temp5
#frame pointer push for func call
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-32($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		factorial
#storing return val in temp
#push stack pointer forward for var ___temp6
sub     $sp,$sp,4
sw	$a0, -36($fp)	#store variable ___temp6 in local variable ___temp6
#push stack pointer forward for var ___temp7
sub     $sp,$sp,4
lw	$a0,-36($fp)	#load global variable ___temp6 to register $a0
lw	$a1,-4($fp)	#load global variable n to register $a1
mult $a0,$a1
mflo $a0
sw	$a0, -40($fp)	#store variable ___temp7 in local variable ___temp7
lw	$a0,-40($fp)	#load local variable ___temp7 to register $a0
sw	$a0, -8($fp)	#store variable ___temp7 in local variable ret
___label1: 
lw	$a0,-8($fp)	#load global variable ret to register $a0
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
#push stack pointer forward for var ___temp8
sub     $sp,$sp,4
li	$a0,5
sw	$a0, -4($fp)
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
jal		factorial
#storing return val in temp
#push stack pointer forward for var ___temp9
sub     $sp,$sp,4
sw	$a0, -8($fp)	#store variable ___temp9 in local variable ___temp9
#Inline puti
lw      $a0,-8($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp10
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -12($fp)
lw	$a0,-12($fp)	#load global variable ___temp10 to register $a0
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
