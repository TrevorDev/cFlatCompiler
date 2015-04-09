

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


fibonacci:
#setup framepointer and save ra
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var n
#push stack pointer forward for var ___temp0
li	$a0,0
sw	$a0, -8($fp)
#push stack pointer forward for var ___temp1
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-8($fp)	#load global variable ___temp0 to register $a1
subu $t2,$a0,$a1
sltu $t2,$zero,$t2
xori $t2, $t2, 1
sw	$t2, -12($fp)	#store variable ___temp1 in local variable ___temp1
lw	$a0,-12($fp)	#load global variable ___temp1 to register $a0
beq	$zero, $a0, ___label0
#push stack pointer forward for var ___temp2
li	$a0,0
sw	$a0, -16($fp)
lw	$a0,-16($fp)	#load global variable ___temp2 to register $a0
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
j ___label1 
___label0: 
#push stack pointer forward for var ___temp3
li	$a0,1
sw	$a0, -20($fp)
#push stack pointer forward for var ___temp4
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-20($fp)	#load global variable ___temp3 to register $a1
subu $t2,$a0,$a1
sltu $t2,$zero,$t2
xori $t2, $t2, 1
sw	$t2, -24($fp)	#store variable ___temp4 in local variable ___temp4
lw	$a0,-24($fp)	#load global variable ___temp4 to register $a0
beq	$zero, $a0, ___label2
#push stack pointer forward for var ___temp5
li	$a0,1
sw	$a0, -28($fp)
lw	$a0,-28($fp)	#load global variable ___temp5 to register $a0
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
j ___label3 
___label2: 
#push stack pointer forward for var ___temp6
li	$a0,1
sw	$a0, -32($fp)
#push stack pointer forward for var ___temp7
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-32($fp)	#load global variable ___temp6 to register $a1
sub $a0,$a0,$a1
sw	$a0, -36($fp)	#store variable ___temp7 in local variable ___temp7
#frame pointer push for func call
addi     $sp,$fp,-40
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-36($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		fibonacci
#storing return val in temp
#push stack pointer forward for var ___temp8
sw	$a0, -40($fp)	#store variable ___temp8 in local variable ___temp8
#push stack pointer forward for var ___temp9
li	$a0,2
sw	$a0, -44($fp)
#push stack pointer forward for var ___temp10
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-44($fp)	#load global variable ___temp9 to register $a1
sub $a0,$a0,$a1
sw	$a0, -48($fp)	#store variable ___temp10 in local variable ___temp10
#frame pointer push for func call
addi     $sp,$fp,-52
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-48($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		fibonacci
#storing return val in temp
#push stack pointer forward for var ___temp11
sw	$a0, -52($fp)	#store variable ___temp11 in local variable ___temp11
#push stack pointer forward for var ___temp12
lw	$a0,-40($fp)	#load global variable ___temp8 to register $a0
lw	$a1,-52($fp)	#load global variable ___temp11 to register $a1
add $a0,$a0,$a1
sw	$a0, -56($fp)	#store variable ___temp12 in local variable ___temp12
lw	$a0,-56($fp)	#load global variable ___temp12 to register $a0
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
___label3: 
___label1: 
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
#push stack pointer forward for var i
#push stack pointer forward for var ___temp13
li	$a0,0
sw	$a0, -8($fp)
lw	$a0,-8($fp)	#load local variable ___temp13 to register $a0
sw	$a0, -4($fp)	#store variable ___temp13 in local variable i
___label4: 
#push stack pointer forward for var ___temp14
li	$a0,30
sw	$a0, -12($fp)
#push stack pointer forward for var ___temp15
lw	$a0,-4($fp)	#load global variable i to register $a0
lw	$a1,-12($fp)	#load global variable ___temp14 to register $a1
slt $a0,$a0,$a1
sw	$a0, -16($fp)	#store variable ___temp15 in local variable ___temp15
lw	$a0,-16($fp)	#load global variable ___temp15 to register $a0
beq	$zero, $a0, ___label5
#frame pointer push for func call
addi     $sp,$fp,-20
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-4($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		fibonacci
#storing return val in temp
#push stack pointer forward for var ___temp16
sw	$a0, -20($fp)	#store variable ___temp16 in local variable ___temp16
#Inline puti
lw      $a0,-20($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp17
li	$a0,32
sw	$a0, -24($fp)
#Inline putf
lw      $a0,-24($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp18
lw	$a1,-4($fp)	#load global variable i to register $a1
sw	$a1, -28($fp)	#store variable ___temp18 in local variable ___temp18
addi $a0, $a1, 1
sw	$a0, -4($fp)	#store variable i in local variable i
j ___label4 
___label5: 
#push stack pointer forward for var ___temp19
li	$a0,1
sw	$a0, -32($fp)
lw	$a0,-32($fp)	#load global variable ___temp19 to register $a0
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
