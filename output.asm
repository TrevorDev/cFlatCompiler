

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


__main:
#setup framepointer and save ra
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var a
sub     $sp,$sp,4
#push stack pointer forward for var b
sub     $sp,$sp,4
#push stack pointer forward for var ___temp0
sub     $sp,$sp,4
li	$a0,0
sw	$a0, -12($fp)
lw	$a0,-12($fp)	#load local variable ___temp0 to register $a0
sw	$a0, -4($fp)	#store variable ___temp0 in local variable a
#push stack pointer forward for var ___temp1
sub     $sp,$sp,4
li	$a0,0
sw	$a0, -16($fp)
lw	$a0,-16($fp)	#load local variable ___temp1 to register $a0
sw	$a0, -8($fp)	#store variable ___temp1 in local variable b
#push stack pointer forward for var ___temp2
sub     $sp,$sp,4
lw	$a0,-4($fp)	#load global variable a to register $a0
lw	$a1,-8($fp)	#load global variable b to register $a1
slt $a0,$a1,$a0
sw	$a0, -20($fp)	#store variable ___temp2 in local variable ___temp2
lw	$a0,-20($fp)	#load global variable ___temp2 to register $a0
beq	$zero, $a0, ___label0
#push stack pointer forward for var ___temp3
sub     $sp,$sp,4
li	$a0,84
sw	$a0, -24($fp)
#Inline putf
lw      $a0,-24($fp)
li      $v0, 11
syscall
j ___label1 
___label0: 
#push stack pointer forward for var ___temp4
sub     $sp,$sp,4
lw	$a0,-4($fp)	#load global variable a to register $a0
lw	$a1,-8($fp)	#load global variable b to register $a1
slt $a0,$a0,$a1
sw	$a0, -28($fp)	#store variable ___temp4 in local variable ___temp4
lw	$a0,-28($fp)	#load global variable ___temp4 to register $a0
beq	$zero, $a0, ___label2
#push stack pointer forward for var ___temp5
sub     $sp,$sp,4
li	$a0,69
sw	$a0, -32($fp)
#Inline putf
lw      $a0,-32($fp)
li      $v0, 11
syscall
j ___label3 
___label2: 
#push stack pointer forward for var ___temp6
sub     $sp,$sp,4
lw	$a0,-4($fp)	#load global variable a to register $a0
lw	$a1,-8($fp)	#load global variable b to register $a1
subu $t2,$a0,$a1
sltu $t2,$zero,$t2
xori $t2, $t2, 1
sw	$t2, -36($fp)	#store variable ___temp6 in local variable ___temp6
lw	$a0,-36($fp)	#load global variable ___temp6 to register $a0
beq	$zero, $a0, ___label4
#push stack pointer forward for var ___temp7
sub     $sp,$sp,4
li	$a0,33
sw	$a0, -40($fp)
#Inline putf
lw      $a0,-40($fp)
li      $v0, 11
syscall
j ___label5 
___label4: 
___label5: 
___label3: 
___label1: 
#push stack pointer forward for var ___temp8
sub     $sp,$sp,4
li	$a0,104
sw	$a0, -44($fp)
#Inline putf
lw      $a0,-44($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp9
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -48($fp)
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
