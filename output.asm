

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
#push stack pointer forward for var x
#push stack pointer forward for var j
#push stack pointer forward for var ___temp0
li	$a0,3
sw	$a0, -12($fp)
#push stack pointer forward for var size
lw	$a0,-12($fp)	#load local variable ___temp0 to register $a0
sw	$a0, -16($fp)	#store variable ___temp0 in local variable size
#push stack pointer forward for var ___temp1
li	$a0,32
sw	$a0, -20($fp)
#Inline putf
lw      $a0,-20($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp2
li	$a0,32
sw	$a0, -24($fp)
#Inline putf
lw      $a0,-24($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp3
li	$a0,32
sw	$a0, -28($fp)
#Inline putf
lw      $a0,-28($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp4
li	$a0,1
sw	$a0, -32($fp)
lw	$a0,-32($fp)	#load local variable ___temp4 to register $a0
sw	$a0, -4($fp)	#store variable ___temp4 in local variable x
___label0: 
#push stack pointer forward for var ___temp5
lw	$a0,-4($fp)	#load global variable x to register $a0
lw	$a1,-16($fp)	#load global variable size to register $a1
sle $a0,$a0,$a1
sw	$a0, -36($fp)	#store variable ___temp5 in local variable ___temp5
lw	$a0,-36($fp)	#load global variable ___temp5 to register $a0
beq	$zero, $a0, ___label1
#Inline puti
lw      $a0,-4($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp6
li	$a0,32
sw	$a0, -40($fp)
#Inline putf
lw      $a0,-40($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp7
li	$a0,32
sw	$a0, -44($fp)
#Inline putf
lw      $a0,-44($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp8
lw	$a1,-4($fp)	#load global variable x to register $a1
sw	$a1, -48($fp)	#store variable ___temp8 in local variable ___temp8
addi $a0, $a1, 1
sw	$a0, -4($fp)	#store variable x in local variable x
j ___label0 
___label1: 
#push stack pointer forward for var ___temp9
li	$a0,10
sw	$a0, -52($fp)
#Inline putf
lw      $a0,-52($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp10
li	$a0,32
sw	$a0, -56($fp)
#Inline putf
lw      $a0,-56($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp11
li	$a0,32
sw	$a0, -60($fp)
#Inline putf
lw      $a0,-60($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp12
li	$a0,32
sw	$a0, -64($fp)
#Inline putf
lw      $a0,-64($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp13
li	$a0,1
sw	$a0, -68($fp)
lw	$a0,-68($fp)	#load local variable ___temp13 to register $a0
sw	$a0, -4($fp)	#store variable ___temp13 in local variable x
___label2: 
#push stack pointer forward for var ___temp14
lw	$a0,-4($fp)	#load global variable x to register $a0
lw	$a1,-16($fp)	#load global variable size to register $a1
sle $a0,$a0,$a1
sw	$a0, -72($fp)	#store variable ___temp14 in local variable ___temp14
lw	$a0,-72($fp)	#load global variable ___temp14 to register $a0
beq	$zero, $a0, ___label3
#push stack pointer forward for var ___temp15
li	$a0,95
sw	$a0, -76($fp)
#Inline putf
lw      $a0,-76($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp16
li	$a0,32
sw	$a0, -80($fp)
#Inline putf
lw      $a0,-80($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp17
li	$a0,32
sw	$a0, -84($fp)
#Inline putf
lw      $a0,-84($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp18
lw	$a1,-4($fp)	#load global variable x to register $a1
sw	$a1, -88($fp)	#store variable ___temp18 in local variable ___temp18
addi $a0, $a1, 1
sw	$a0, -4($fp)	#store variable x in local variable x
j ___label2 
___label3: 
#push stack pointer forward for var ___temp19
li	$a0,10
sw	$a0, -92($fp)
#Inline putf
lw      $a0,-92($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp20
li	$a0,1
sw	$a0, -96($fp)
lw	$a0,-96($fp)	#load local variable ___temp20 to register $a0
sw	$a0, -4($fp)	#store variable ___temp20 in local variable x
___label4: 
#push stack pointer forward for var ___temp21
lw	$a0,-4($fp)	#load global variable x to register $a0
lw	$a1,-16($fp)	#load global variable size to register $a1
sle $a0,$a0,$a1
sw	$a0, -100($fp)	#store variable ___temp21 in local variable ___temp21
lw	$a0,-100($fp)	#load global variable ___temp21 to register $a0
beq	$zero, $a0, ___label5
#Inline puti
lw      $a0,-4($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp22
li	$a0,32
sw	$a0, -104($fp)
#Inline putf
lw      $a0,-104($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp23
li	$a0,124
sw	$a0, -108($fp)
#Inline putf
lw      $a0,-108($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp24
li	$a0,1
sw	$a0, -112($fp)
lw	$a0,-112($fp)	#load local variable ___temp24 to register $a0
sw	$a0, -8($fp)	#store variable ___temp24 in local variable j
___label6: 
#push stack pointer forward for var ___temp25
lw	$a0,-8($fp)	#load global variable j to register $a0
lw	$a1,-16($fp)	#load global variable size to register $a1
sle $a0,$a0,$a1
sw	$a0, -116($fp)	#store variable ___temp25 in local variable ___temp25
lw	$a0,-116($fp)	#load global variable ___temp25 to register $a0
beq	$zero, $a0, ___label7
#push stack pointer forward for var ___temp26
lw	$a0,-8($fp)	#load global variable j to register $a0
lw	$a1,-4($fp)	#load global variable x to register $a1
mult $a0,$a1
mflo $a0
sw	$a0, -120($fp)	#store variable ___temp26 in local variable ___temp26
#Inline puti
lw      $a0,-120($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp27
li	$a0,32
sw	$a0, -124($fp)
#Inline putf
lw      $a0,-124($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp28
li	$a0,32
sw	$a0, -128($fp)
#Inline putf
lw      $a0,-128($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp29
lw	$a1,-8($fp)	#load global variable j to register $a1
sw	$a1, -132($fp)	#store variable ___temp29 in local variable ___temp29
addi $a0, $a1, 1
sw	$a0, -8($fp)	#store variable j in local variable j
j ___label6 
___label7: 
#push stack pointer forward for var ___temp30
li	$a0,10
sw	$a0, -136($fp)
#Inline putf
lw      $a0,-136($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp31
lw	$a1,-4($fp)	#load global variable x to register $a1
sw	$a1, -140($fp)	#store variable ___temp31 in local variable ___temp31
addi $a0, $a1, 1
sw	$a0, -4($fp)	#store variable x in local variable x
j ___label4 
___label5: 
#push stack pointer forward for var ___temp32
li	$a0,1
sw	$a0, -144($fp)
lw	$a0,-144($fp)	#load global variable ___temp32 to register $a0
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
