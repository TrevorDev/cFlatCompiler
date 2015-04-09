

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
#push stack pointer forward for var ___temp0
li	$a0,0
sw	$a0, -12($fp)
#push stack pointer forward for var ___temp1
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-12($fp)	#load global variable ___temp0 to register $a1
slt $a0,$a1,$a0
sw	$a0, -16($fp)	#store variable ___temp1 in local variable ___temp1
lw	$a0,-16($fp)	#load global variable ___temp1 to register $a0
beq	$zero, $a0, ___label0
#push stack pointer forward for var ___temp2
li	$a0,1
sw	$a0, -20($fp)
#push stack pointer forward for var ___temp3
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-20($fp)	#load global variable ___temp2 to register $a1
sub $a0,$a0,$a1
sw	$a0, -24($fp)	#store variable ___temp3 in local variable ___temp3
#frame pointer push for func call
addi     $sp,$fp,-28
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-24($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		factorial
#storing return val in temp
#push stack pointer forward for var ___temp4
sw	$a0, -28($fp)	#store variable ___temp4 in local variable ___temp4
#push stack pointer forward for var ___temp5
lw	$a0,-28($fp)	#load global variable ___temp4 to register $a0
lw	$a1,-4($fp)	#load global variable n to register $a1
mult $a0,$a1
mflo $a0
sw	$a0, -32($fp)	#store variable ___temp5 in local variable ___temp5
lw	$a0,-32($fp)	#load local variable ___temp5 to register $a0
sw	$a0, -8($fp)	#store variable ___temp5 in local variable ret
j ___label1 
___label0: 
#push stack pointer forward for var ___temp6
li	$a0,1
sw	$a0, -36($fp)
lw	$a0,-36($fp)	#load local variable ___temp6 to register $a0
sw	$a0, -8($fp)	#store variable ___temp6 in local variable ret
___label1: 
lw	$a0,-8($fp)	#load global variable ret to register $a0
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


ackermann:
#setup framepointer and save ra
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var m
#push stack pointer forward for var n
#push stack pointer forward for var ret
#push stack pointer forward for var ___temp7
li	$a0,0
sw	$a0, -16($fp)
#push stack pointer forward for var ___temp8
lw	$a0,-4($fp)	#load global variable m to register $a0
lw	$a1,-16($fp)	#load global variable ___temp7 to register $a1
subu $t2,$a0,$a1
sltu $t2,$zero,$t2
xori $t2, $t2, 1
sw	$t2, -20($fp)	#store variable ___temp8 in local variable ___temp8
lw	$a0,-20($fp)	#load global variable ___temp8 to register $a0
beq	$zero, $a0, ___label2
#push stack pointer forward for var ___temp9
li	$a0,1
sw	$a0, -24($fp)
#push stack pointer forward for var ___temp10
lw	$a0,-8($fp)	#load global variable n to register $a0
lw	$a1,-24($fp)	#load global variable ___temp9 to register $a1
add $a0,$a0,$a1
sw	$a0, -28($fp)	#store variable ___temp10 in local variable ___temp10
lw	$a0,-28($fp)	#load local variable ___temp10 to register $a0
sw	$a0, -12($fp)	#store variable ___temp10 in local variable ret
j ___label3 
___label2: 
#push stack pointer forward for var ___temp11
li	$a0,0
sw	$a0, -32($fp)
#push stack pointer forward for var ___temp12
lw	$a0,-8($fp)	#load global variable n to register $a0
lw	$a1,-32($fp)	#load global variable ___temp11 to register $a1
subu $t2,$a0,$a1
sltu $t2,$zero,$t2
xori $t2, $t2, 1
sw	$t2, -36($fp)	#store variable ___temp12 in local variable ___temp12
lw	$a0,-36($fp)	#load global variable ___temp12 to register $a0
beq	$zero, $a0, ___label4
#push stack pointer forward for var ___temp13
li	$a0,1
sw	$a0, -40($fp)
#push stack pointer forward for var ___temp14
lw	$a0,-4($fp)	#load global variable m to register $a0
lw	$a1,-40($fp)	#load global variable ___temp13 to register $a1
sub $a0,$a0,$a1
sw	$a0, -44($fp)	#store variable ___temp14 in local variable ___temp14
#push stack pointer forward for var ___temp15
li	$a0,1
sw	$a0, -48($fp)
#frame pointer push for func call
addi     $sp,$fp,-52
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-44($fp)
sw 	$a0,4($sp)
sub     $sp,$sp,4
lw	$a0,-48($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		ackermann
#storing return val in temp
#push stack pointer forward for var ___temp16
sw	$a0, -52($fp)	#store variable ___temp16 in local variable ___temp16
lw	$a0,-52($fp)	#load local variable ___temp16 to register $a0
sw	$a0, -12($fp)	#store variable ___temp16 in local variable ret
j ___label5 
___label4: 
#push stack pointer forward for var ___temp17
li	$a0,1
sw	$a0, -56($fp)
#push stack pointer forward for var ___temp18
lw	$a0,-4($fp)	#load global variable m to register $a0
lw	$a1,-56($fp)	#load global variable ___temp17 to register $a1
sub $a0,$a0,$a1
sw	$a0, -60($fp)	#store variable ___temp18 in local variable ___temp18
#push stack pointer forward for var ___temp19
li	$a0,1
sw	$a0, -64($fp)
#push stack pointer forward for var ___temp20
lw	$a0,-8($fp)	#load global variable n to register $a0
lw	$a1,-64($fp)	#load global variable ___temp19 to register $a1
sub $a0,$a0,$a1
sw	$a0, -68($fp)	#store variable ___temp20 in local variable ___temp20
#frame pointer push for func call
addi     $sp,$fp,-72
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-4($fp)
sw 	$a0,4($sp)
sub     $sp,$sp,4
lw	$a0,-68($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		ackermann
#storing return val in temp
#push stack pointer forward for var ___temp21
sw	$a0, -72($fp)	#store variable ___temp21 in local variable ___temp21
#frame pointer push for func call
addi     $sp,$fp,-76
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-60($fp)
sw 	$a0,4($sp)
sub     $sp,$sp,4
lw	$a0,-72($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		ackermann
#storing return val in temp
#push stack pointer forward for var ___temp22
sw	$a0, -76($fp)	#store variable ___temp22 in local variable ___temp22
lw	$a0,-76($fp)	#load local variable ___temp22 to register $a0
sw	$a0, -12($fp)	#store variable ___temp22 in local variable ret
___label5: 
___label3: 
lw	$a0,-12($fp)	#load global variable ret to register $a0
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


fibonacci:
#setup framepointer and save ra
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var n
#push stack pointer forward for var ___temp23
lw	$a1,-4($fp)	#load global variable n to register $a1
slt $a0, $a1, $zero
slt $a2, $zero, $a1
or $a0,$a0,$a2
xori $a0, $a0, 1
sw	$a0, -8($fp)	#store variable ___temp23 in local variable ___temp23
lw	$a0,-8($fp)	#load global variable ___temp23 to register $a0
beq	$zero, $a0, ___label6
#push stack pointer forward for var ___temp24
li	$a0,0
sw	$a0, -12($fp)
lw	$a0,-12($fp)	#load global variable ___temp24 to register $a0
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
j ___label7 
___label6: 
#push stack pointer forward for var ___temp25
li	$a0,1
sw	$a0, -16($fp)
#push stack pointer forward for var ___temp26
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-16($fp)	#load global variable ___temp25 to register $a1
subu $t2,$a0,$a1
sltu $t2,$zero,$t2
xori $t2, $t2, 1
sw	$t2, -20($fp)	#store variable ___temp26 in local variable ___temp26
lw	$a0,-20($fp)	#load global variable ___temp26 to register $a0
beq	$zero, $a0, ___label8
#push stack pointer forward for var ___temp27
li	$a0,1
sw	$a0, -24($fp)
lw	$a0,-24($fp)	#load global variable ___temp27 to register $a0
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
j ___label9 
___label8: 
#push stack pointer forward for var ___temp28
li	$a0,1
sw	$a0, -28($fp)
#push stack pointer forward for var ___temp29
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-28($fp)	#load global variable ___temp28 to register $a1
sub $a0,$a0,$a1
sw	$a0, -32($fp)	#store variable ___temp29 in local variable ___temp29
#frame pointer push for func call
addi     $sp,$fp,-36
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-32($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		fibonacci
#storing return val in temp
#push stack pointer forward for var ___temp30
sw	$a0, -36($fp)	#store variable ___temp30 in local variable ___temp30
#push stack pointer forward for var ___temp31
li	$a0,2
sw	$a0, -40($fp)
#push stack pointer forward for var ___temp32
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-40($fp)	#load global variable ___temp31 to register $a1
sub $a0,$a0,$a1
sw	$a0, -44($fp)	#store variable ___temp32 in local variable ___temp32
#frame pointer push for func call
addi     $sp,$fp,-48
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-44($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		fibonacci
#storing return val in temp
#push stack pointer forward for var ___temp33
sw	$a0, -48($fp)	#store variable ___temp33 in local variable ___temp33
#push stack pointer forward for var ___temp34
lw	$a0,-36($fp)	#load global variable ___temp30 to register $a0
lw	$a1,-48($fp)	#load global variable ___temp33 to register $a1
add $a0,$a0,$a1
sw	$a0, -52($fp)	#store variable ___temp34 in local variable ___temp34
lw	$a0,-52($fp)	#load global variable ___temp34 to register $a0
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
___label9: 
___label7: 
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
#push stack pointer forward for var ___temp35
li	$a0,0
sw	$a0, -8($fp)
lw	$a0,-8($fp)	#load local variable ___temp35 to register $a0
sw	$a0, -4($fp)	#store variable ___temp35 in local variable i
___label10: 
#push stack pointer forward for var ___temp36
li	$a0,30
sw	$a0, -12($fp)
#push stack pointer forward for var ___temp37
lw	$a0,-4($fp)	#load global variable i to register $a0
lw	$a1,-12($fp)	#load global variable ___temp36 to register $a1
slt $a0,$a0,$a1
sw	$a0, -16($fp)	#store variable ___temp37 in local variable ___temp37
lw	$a0,-16($fp)	#load global variable ___temp37 to register $a0
beq	$zero, $a0, ___label11
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
#push stack pointer forward for var ___temp38
sw	$a0, -20($fp)	#store variable ___temp38 in local variable ___temp38
#Inline puti
lw      $a0,-20($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp39
li	$a0,32
sw	$a0, -24($fp)
#Inline putf
lw      $a0,-24($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp40
lw	$a1,-4($fp)	#load global variable i to register $a1
sw	$a1, -28($fp)	#store variable ___temp40 in local variable ___temp40
addi $a0, $a1, 1
sw	$a0, -4($fp)	#store variable i in local variable i
j ___label10 
___label11: 
#push stack pointer forward for var ___temp41
li	$a0,1
sw	$a0, -32($fp)
lw	$a0,-32($fp)	#load global variable ___temp41 to register $a0
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
