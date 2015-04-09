

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


fibonacci:
#setup framepointer and save ra
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var n
#push stack pointer forward for var ret
#push stack pointer forward for var ___temp23
li	$a0,0
sw	$a0, -12($fp)
#push stack pointer forward for var ___temp24
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-12($fp)	#load global variable ___temp23 to register $a1
subu $t2,$a0,$a1
sltu $t2,$zero,$t2
xori $t2, $t2, 1
sw	$t2, -16($fp)	#store variable ___temp24 in local variable ___temp24
lw	$a0,-16($fp)	#load global variable ___temp24 to register $a0
beq	$zero, $a0, ___label6
#push stack pointer forward for var ___temp25
li	$a0,0
sw	$a0, -20($fp)
lw	$a0,-20($fp)	#load local variable ___temp25 to register $a0
sw	$a0, -8($fp)	#store variable ___temp25 in local variable ret
j ___label7 
___label6: 
#push stack pointer forward for var ___temp26
li	$a0,1
sw	$a0, -24($fp)
#push stack pointer forward for var ___temp27
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-24($fp)	#load global variable ___temp26 to register $a1
subu $t2,$a0,$a1
sltu $t2,$zero,$t2
xori $t2, $t2, 1
sw	$t2, -28($fp)	#store variable ___temp27 in local variable ___temp27
lw	$a0,-28($fp)	#load global variable ___temp27 to register $a0
beq	$zero, $a0, ___label8
#push stack pointer forward for var ___temp28
li	$a0,1
sw	$a0, -32($fp)
lw	$a0,-32($fp)	#load local variable ___temp28 to register $a0
sw	$a0, -8($fp)	#store variable ___temp28 in local variable ret
j ___label9 
___label8: 
#push stack pointer forward for var ___temp29
li	$a0,1
sw	$a0, -36($fp)
#push stack pointer forward for var ___temp30
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-36($fp)	#load global variable ___temp29 to register $a1
sub $a0,$a0,$a1
sw	$a0, -40($fp)	#store variable ___temp30 in local variable ___temp30
#frame pointer push for func call
addi     $sp,$fp,-44
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-40($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		fibonacci
#storing return val in temp
#push stack pointer forward for var ___temp31
sw	$a0, -44($fp)	#store variable ___temp31 in local variable ___temp31
#push stack pointer forward for var ___temp32
li	$a0,2
sw	$a0, -48($fp)
#push stack pointer forward for var ___temp33
lw	$a0,-4($fp)	#load global variable n to register $a0
lw	$a1,-48($fp)	#load global variable ___temp32 to register $a1
sub $a0,$a0,$a1
sw	$a0, -52($fp)	#store variable ___temp33 in local variable ___temp33
#frame pointer push for func call
addi     $sp,$fp,-56
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-52($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		fibonacci
#storing return val in temp
#push stack pointer forward for var ___temp34
sw	$a0, -56($fp)	#store variable ___temp34 in local variable ___temp34
#push stack pointer forward for var ___temp35
lw	$a0,-44($fp)	#load global variable ___temp31 to register $a0
lw	$a1,-56($fp)	#load global variable ___temp34 to register $a1
add $a0,$a0,$a1
sw	$a0, -60($fp)	#store variable ___temp35 in local variable ___temp35
lw	$a0,-60($fp)	#load local variable ___temp35 to register $a0
sw	$a0, -8($fp)	#store variable ___temp35 in local variable ret
___label9: 
___label7: 
lw	$a0,-8($fp)	#load global variable ret to register $a0
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra


multiply:
#setup framepointer and save ra
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var a
#push stack pointer forward for var b
#push stack pointer forward for var c
#push stack pointer forward for var d
#push stack pointer forward for var e
#push stack pointer forward for var ___temp36
lw	$a0,-4($fp)	#load global variable a to register $a0
lw	$a1,-8($fp)	#load global variable b to register $a1
mult $a0,$a1
mflo $a0
sw	$a0, -24($fp)	#store variable ___temp36 in local variable ___temp36
#push stack pointer forward for var ___temp37
lw	$a0,-24($fp)	#load global variable ___temp36 to register $a0
lw	$a1,-12($fp)	#load global variable c to register $a1
mult $a0,$a1
mflo $a0
sw	$a0, -28($fp)	#store variable ___temp37 in local variable ___temp37
#push stack pointer forward for var ___temp38
lw	$a0,-28($fp)	#load global variable ___temp37 to register $a0
lw	$a1,-16($fp)	#load global variable d to register $a1
mult $a0,$a1
mflo $a0
sw	$a0, -32($fp)	#store variable ___temp38 in local variable ___temp38
#push stack pointer forward for var ___temp39
lw	$a0,-32($fp)	#load global variable ___temp38 to register $a0
lw	$a1,-20($fp)	#load global variable e to register $a1
mult $a0,$a1
mflo $a0
sw	$a0, -36($fp)	#store variable ___temp39 in local variable ___temp39
lw	$a0,-36($fp)	#load global variable ___temp39 to register $a0
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
#push stack pointer forward for var ___temp40
li	$a0,5
sw	$a0, -8($fp)
lw	$a0,-8($fp)	#load local variable ___temp40 to register $a0
sw	$a0, -4($fp)	#store variable ___temp40 in local variable a
#push stack pointer forward for var ___temp41
li	$a0,5
sw	$a0, -12($fp)
#Inline puti
lw      $a0,-12($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp42
li	$a0,33
sw	$a0, -16($fp)
#Inline putf
lw      $a0,-16($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp43
li	$a0,32
sw	$a0, -20($fp)
#Inline putf
lw      $a0,-20($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp44
li	$a0,61
sw	$a0, -24($fp)
#Inline putf
lw      $a0,-24($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp45
li	$a0,5
sw	$a0, -28($fp)
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
#push stack pointer forward for var ___temp46
sw	$a0, -32($fp)	#store variable ___temp46 in local variable ___temp46
#Inline puti
lw      $a0,-32($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp47
li	$a0,32
sw	$a0, -36($fp)
#Inline putf
lw      $a0,-36($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp48
li	$a0,32
sw	$a0, -40($fp)
#Inline putf
lw      $a0,-40($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp49
li	$a0,32
sw	$a0, -44($fp)
#Inline putf
lw      $a0,-44($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp50
li	$a0,1
sw	$a0, -48($fp)
#push stack pointer forward for var ___temp51
li	$a0,2
sw	$a0, -52($fp)
#push stack pointer forward for var ___temp52
li	$a0,3
sw	$a0, -56($fp)
#push stack pointer forward for var ___temp53
li	$a0,4
sw	$a0, -60($fp)
#push stack pointer forward for var ___temp54
li	$a0,5
sw	$a0, -64($fp)
#frame pointer push for func call
addi     $sp,$fp,-68
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-48($fp)
sw 	$a0,4($sp)
sub     $sp,$sp,4
lw	$a0,-52($fp)
sw 	$a0,4($sp)
sub     $sp,$sp,4
lw	$a0,-56($fp)
sw 	$a0,4($sp)
sub     $sp,$sp,4
lw	$a0,-60($fp)
sw 	$a0,4($sp)
sub     $sp,$sp,4
lw	$a0,-64($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		multiply
#storing return val in temp
#push stack pointer forward for var ___temp55
sw	$a0, -68($fp)	#store variable ___temp55 in local variable ___temp55
#Inline puti
lw      $a0,-68($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp56
li	$a0,32
sw	$a0, -72($fp)
#Inline putf
lw      $a0,-72($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp57
li	$a0,32
sw	$a0, -76($fp)
#Inline putf
lw      $a0,-76($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp58
li	$a0,32
sw	$a0, -80($fp)
#Inline putf
lw      $a0,-80($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp59
li	$a0,3
sw	$a0, -84($fp)
#push stack pointer forward for var ___temp60
li	$a0,2
sw	$a0, -88($fp)
#frame pointer push for func call
addi     $sp,$fp,-92
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-84($fp)
sw 	$a0,4($sp)
sub     $sp,$sp,4
lw	$a0,-88($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		ackermann
#storing return val in temp
#push stack pointer forward for var ___temp61
sw	$a0, -92($fp)	#store variable ___temp61 in local variable ___temp61
#Inline puti
lw      $a0,-92($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp62
li	$a0,32
sw	$a0, -96($fp)
#Inline putf
lw      $a0,-96($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp63
li	$a0,32
sw	$a0, -100($fp)
#Inline putf
lw      $a0,-100($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp64
li	$a0,32
sw	$a0, -104($fp)
#Inline putf
lw      $a0,-104($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp65
li	$a0,8
sw	$a0, -108($fp)
#frame pointer push for func call
addi     $sp,$fp,-112
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-108($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		fibonacci
#storing return val in temp
#push stack pointer forward for var ___temp66
sw	$a0, -112($fp)	#store variable ___temp66 in local variable ___temp66
#Inline puti
lw      $a0,-112($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp67
li	$a0,1
sw	$a0, -116($fp)
lw	$a0,-116($fp)	#load global variable ___temp67 to register $a0
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
