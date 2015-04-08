

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
#push stack pointer forward for var ret
#Inline puti
lw      $a0,-4($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp0
li	$a0,32
sw	$a0, -12($fp)
#Inline putf
lw      $a0,-12($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp1
li	$a0,0
sw	$a0, -16($fp)
#push stack pointer forward for var ___temp2
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-16($fp)	#load global variable ___temp1 to register $a1
slt $a0,$a1,$a0
sw	$a0, -20($fp)	#store variable ___temp2 in local variable ___temp2
lw	$a0,-20($fp)	#load global variable ___temp2 to register $a0
beq	$zero, $a0, ___label0
#push stack pointer forward for var ___temp3
li	$a0,1
sw	$a0, -24($fp)
#push stack pointer forward for var ___temp4
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-24($fp)	#load global variable ___temp3 to register $a1
sub $a0,$a0,$a1
sw	$a0, -28($fp)	#store variable ___temp4 in local variable ___temp4
#frame pointer push for func call
addi     $sp,$fp,-32
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-28($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		factorial
#storing return val in temp
#push stack pointer forward for var ___temp5
sw	$a0, -32($fp)	#store variable ___temp5 in local variable ___temp5
#push stack pointer forward for var ___temp6
lw	$a0,-32($fp)	#load global variable ___temp5 to register $a0
lw	$a1,-4($fp)	#load global variable n to register $a1
mult $a0,$a1
mflo $a0
sw	$a0, -36($fp)	#store variable ___temp6 in local variable ___temp6
lw	$a0,-36($fp)	#load local variable ___temp6 to register $a0
sw	$a0, -8($fp)	#store variable ___temp6 in local variable ret
j ___label1 
___label0: 
#push stack pointer forward for var ___temp7
li	$a0,1
sw	$a0, -40($fp)
lw	$a0,-40($fp)	#load local variable ___temp7 to register $a0
sw	$a0, -8($fp)	#store variable ___temp7 in local variable ret
___label1: 
lw	$a0,-8($fp)	#load global variable ret to register $a0
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra


fucked_factorial:
#setup framepointer and save ra
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var n
#push stack pointer forward for var ret
#Inline puti
lw      $a0,-4($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp8
li	$a0,32
sw	$a0, -12($fp)
#Inline putf
lw      $a0,-12($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp9
li	$a0,0
sw	$a0, -16($fp)
#push stack pointer forward for var ___temp10
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-16($fp)	#load global variable ___temp9 to register $a1
sle $a0,$a0,$a1
sw	$a0, -20($fp)	#store variable ___temp10 in local variable ___temp10
lw	$a0,-20($fp)	#load global variable ___temp10 to register $a0
beq	$zero, $a0, ___label2
#push stack pointer forward for var ___temp11
li	$a0,1
sw	$a0, -24($fp)
lw	$a0,-24($fp)	#load local variable ___temp11 to register $a0
sw	$a0, -8($fp)	#store variable ___temp11 in local variable ret
j ___label3 
___label2: 
#push stack pointer forward for var ___temp12
li	$a0,32
sw	$a0, -28($fp)
#Inline putf
lw      $a0,-28($fp)
li      $v0, 11
syscall
#Inline puti
lw      $a0,-4($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp13
li	$a0,1
sw	$a0, -32($fp)
#push stack pointer forward for var ___temp14
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-32($fp)	#load global variable ___temp13 to register $a1
sub $a0,$a0,$a1
sw	$a0, -36($fp)	#store variable ___temp14 in local variable ___temp14
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
jal		fucked_factorial
#storing return val in temp
#push stack pointer forward for var ___temp15
sw	$a0, -40($fp)	#store variable ___temp15 in local variable ___temp15
#push stack pointer forward for var ___temp16
li	$a0,1
sw	$a0, -44($fp)
#push stack pointer forward for var ___temp17
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-44($fp)	#load global variable ___temp16 to register $a1
sub $a0,$a0,$a1
sw	$a0, -48($fp)	#store variable ___temp17 in local variable ___temp17
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
jal		fucked_factorial
#storing return val in temp
#push stack pointer forward for var ___temp18
sw	$a0, -52($fp)	#store variable ___temp18 in local variable ___temp18
#push stack pointer forward for var ___temp19
lw	$a0,-52($fp)	#load global variable ___temp18 to register $a0
lw	$a1,-4($fp)	#load global variable n to register $a1
mult $a0,$a1
mflo $a0
sw	$a0, -56($fp)	#store variable ___temp19 in local variable ___temp19
lw	$a0,-56($fp)	#load local variable ___temp19 to register $a0
sw	$a0, -8($fp)	#store variable ___temp19 in local variable ret
___label3: 
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
#push stack pointer forward for var ___temp20
li	$a0,5
sw	$a0, -4($fp)
#frame pointer push for func call
addi     $sp,$fp,-8
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-4($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		fucked_factorial
#storing return val in temp
#push stack pointer forward for var ___temp21
sw	$a0, -8($fp)	#store variable ___temp21 in local variable ___temp21
#Inline puti
lw      $a0,-8($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp22
li	$a0,1
sw	$a0, -12($fp)
lw	$a0,-12($fp)	#load global variable ___temp22 to register $a0
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
