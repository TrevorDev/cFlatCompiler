

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
#push stack pointer forward for var ___temp0
li	$a0,0
sw	$a0, -4($fp)
#push stack pointer forward for var a
lw	$a0,-4($fp)	#load local variable ___temp0 to register $a0
sw	$a0, -8($fp)	#store variable ___temp0 in local variable a
#push stack pointer forward for var b
#push stack pointer forward for var c
#push stack pointer forward for var d
#push stack pointer forward for var ___temp1
lw	$a1,-8($fp)	#load global variable a to register $a1
addi $a0, $a1, 1
sw	$a0, -8($fp)	#store variable a in local variable a
#push stack pointer forward for var ___temp2
li	$a0,6
sw	$a0, -28($fp)
#push stack pointer forward for var ___temp3
li	$a0,4
sw	$a0, -32($fp)
#push stack pointer forward for var ___temp4
lw	$a0,-28($fp)	#load global variable ___temp2 to register $a0
lw	$a1,-32($fp)	#load global variable ___temp3 to register $a1
div $a0,$a1
mfhi $a0
sw	$a0, -36($fp)	#store variable ___temp4 in local variable ___temp4
#push stack pointer forward for var ___temp5
lw	$a0,-36($fp)	#load global variable ___temp4 to register $a0
lw	$a1,-8($fp)	#load global variable a to register $a1
add $a0,$a0,$a1
sw	$a0, -40($fp)	#store variable ___temp5 in local variable ___temp5
#push stack pointer forward for var ___temp6
lw	$a0,-8($fp)	#load global variable a to register $a0
lw	$a1,-40($fp)	#load global variable ___temp5 to register $a1
mult $a0,$a1
mflo $a0
sw	$a0, -44($fp)	#store variable ___temp6 in local variable ___temp6
lw	$a0,-44($fp)	#load local variable ___temp6 to register $a0
sw	$a0, -16($fp)	#store variable ___temp6 in local variable c
lw	$a0,-16($fp)	#load local variable c to register $a0
sw	$a0, -12($fp)	#store variable c in local variable b
#push stack pointer forward for var ___temp7
lw	$a1,-8($fp)	#load global variable a to register $a1
sw	$a1, -48($fp)	#store variable ___temp7 in local variable ___temp7
addi $a0, $a1, 1
sw	$a0, -8($fp)	#store variable a in local variable a
#push stack pointer forward for var ___temp8
#push stack pointer forward for var ___temp9
li	$a0,14
sw	$a0, -56($fp)
#push stack pointer forward for var ___temp10
li	$a0,2
sw	$a0, -60($fp)
#push stack pointer forward for var ___temp11
lw	$a0,-56($fp)	#load global variable ___temp9 to register $a0
lw	$a1,-60($fp)	#load global variable ___temp10 to register $a1
div $a0,$a1
mflo $a0
sw	$a0, -64($fp)	#store variable ___temp11 in local variable ___temp11
#push stack pointer forward for var ___temp12
li	$a0,80
sw	$a0, -68($fp)
#push stack pointer forward for var ___temp13
li	$a0,12
sw	$a0, -72($fp)
#push stack pointer forward for var ___temp14
lw	$a0,-68($fp)	#load global variable ___temp12 to register $a0
lw	$a1,-72($fp)	#load global variable ___temp13 to register $a1
mult $a0,$a1
mflo $a0
sw	$a0, -76($fp)	#store variable ___temp14 in local variable ___temp14
#push stack pointer forward for var ___temp15
li	$a0,80
sw	$a0, -80($fp)
#push stack pointer forward for var ___temp16
li	$a0,12
sw	$a0, -84($fp)
#push stack pointer forward for var ___temp17
lw	$a0,-80($fp)	#load global variable ___temp15 to register $a0
lw	$a1,-84($fp)	#load global variable ___temp16 to register $a1
mult $a0,$a1
mflo $a0
sw	$a0, -88($fp)	#store variable ___temp17 in local variable ___temp17
#push stack pointer forward for var ___temp18
lw	$a0,-76($fp)	#load global variable ___temp14 to register $a0
lw	$a1,-88($fp)	#load global variable ___temp17 to register $a1
div $a0,$a1
mflo $a0
sw	$a0, -92($fp)	#store variable ___temp18 in local variable ___temp18
#push stack pointer forward for var ___temp19
lw	$a0,-64($fp)	#load global variable ___temp11 to register $a0
lw	$a1,-92($fp)	#load global variable ___temp18 to register $a1
add $a0,$a0,$a1
sw	$a0, -96($fp)	#store variable ___temp19 in local variable ___temp19
#push stack pointer forward for var ___temp20
li	$a0,0
sw	$a0, -100($fp)
#push stack pointer forward for var ___temp21
lw	$a1,-100($fp)	#load global variable ___temp20 to register $a1
slt $a0, $a1, $zero
slt $a2, $zero, $a1
or $a0,$a0,$a2
xori $a0, $a0, 1
sw	$a0, -104($fp)	#store variable ___temp21 in local variable ___temp21
#push stack pointer forward for var ___temp22
lw	$a0,-96($fp)	#load global variable ___temp19 to register $a0
lw	$a1,-104($fp)	#load global variable ___temp21 to register $a1
sub $a0,$a0,$a1
sw	$a0, -108($fp)	#store variable ___temp22 in local variable ___temp22
lw	$a0,-108($fp)	#load local variable ___temp22 to register $a0
sw	$a0, -20($fp)	#store variable ___temp22 in local variable d
#Inline puti
lw      $a0,-8($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp23
li	$a0,10
sw	$a0, -112($fp)
#Inline putf
lw      $a0,-112($fp)
li      $v0, 11
syscall
#Inline puti
lw      $a0,-12($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp24
li	$a0,10
sw	$a0, -116($fp)
#Inline putf
lw      $a0,-116($fp)
li      $v0, 11
syscall
#Inline puti
lw      $a0,-16($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp25
li	$a0,10
sw	$a0, -120($fp)
#Inline putf
lw      $a0,-120($fp)
li      $v0, 11
syscall
#Inline puti
lw      $a0,-20($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp26
li	$a0,10
sw	$a0, -124($fp)
#Inline putf
lw      $a0,-124($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp27
li	$a0,10
sw	$a0, -128($fp)
#Inline putf
lw      $a0,-128($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp28
li	$a0,0
sw	$a0, -132($fp)
lw	$a0,-132($fp)	#load global variable ___temp28 to register $a0
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
