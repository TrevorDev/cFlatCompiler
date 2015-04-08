

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
#push stack pointer forward for var i
sub     $sp,$sp,4
#push stack pointer forward for var ___temp0
sub     $sp,$sp,4
li	$a0,0
sw	$a0, -8($fp)
lw	$a0,-8($fp)	#load local variable ___temp0 to register $a0
sw	$a0, -4($fp)	#store variable ___temp0 in local variable i
#push stack pointer forward for var ___temp1
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -12($fp)
#push stack pointer forward for var ___temp2
sub     $sp,$sp,4
li.s	$f0,0.000000
s.s	$f0, -16($fp)
#push stack pointer forward for var ___temp3
sub     $sp,$sp,4
l.s	$f0,-12($fp)	#load global variable ___temp1 to register $f0
l.s	$f1,-16($fp)	#load global variable ___temp2 to register $f1
c.lt.s $f0, $f1
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -20($fp)	#store variable ___temp3 in local variable ___temp3
#Inline puti
lw      $a0,-20($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp4
sub     $sp,$sp,4
li.s	$f0,0.000000
s.s	$f0, -24($fp)
#push stack pointer forward for var ___temp5
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -28($fp)
#push stack pointer forward for var ___temp6
sub     $sp,$sp,4
l.s	$f0,-24($fp)	#load global variable ___temp4 to register $f0
l.s	$f1,-28($fp)	#load global variable ___temp5 to register $f1
c.lt.s $f0, $f1
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -32($fp)	#store variable ___temp6 in local variable ___temp6
#Inline puti
lw      $a0,-32($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp7
sub     $sp,$sp,4
li.s	$f0,0.000000
s.s	$f0, -36($fp)
#push stack pointer forward for var ___temp8
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -40($fp)
#push stack pointer forward for var ___temp9
sub     $sp,$sp,4
l.s	$f0,-36($fp)	#load global variable ___temp7 to register $f0
l.s	$f1,-40($fp)	#load global variable ___temp8 to register $f1
c.lt.s $f1, $f0
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -44($fp)	#store variable ___temp9 in local variable ___temp9
#Inline puti
lw      $a0,-44($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp10
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -48($fp)
#push stack pointer forward for var ___temp11
sub     $sp,$sp,4
li.s	$f0,0.000000
s.s	$f0, -52($fp)
#push stack pointer forward for var ___temp12
sub     $sp,$sp,4
l.s	$f0,-48($fp)	#load global variable ___temp10 to register $f0
l.s	$f1,-52($fp)	#load global variable ___temp11 to register $f1
c.lt.s $f1, $f0
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -56($fp)	#store variable ___temp12 in local variable ___temp12
#Inline puti
lw      $a0,-56($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp13
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -60($fp)
#push stack pointer forward for var ___temp14
sub     $sp,$sp,4
li.s	$f0,0.000000
s.s	$f0, -64($fp)
#push stack pointer forward for var ___temp15
sub     $sp,$sp,4
l.s	$f0,-60($fp)	#load global variable ___temp13 to register $f0
l.s	$f1,-64($fp)	#load global variable ___temp14 to register $f1
c.le.s $f0, $f1
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -68($fp)	#store variable ___temp15 in local variable ___temp15
#Inline puti
lw      $a0,-68($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp16
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -72($fp)
#push stack pointer forward for var ___temp17
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -76($fp)
#push stack pointer forward for var ___temp18
sub     $sp,$sp,4
l.s	$f0,-72($fp)	#load global variable ___temp16 to register $f0
l.s	$f1,-76($fp)	#load global variable ___temp17 to register $f1
c.le.s $f0, $f1
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -80($fp)	#store variable ___temp18 in local variable ___temp18
#Inline puti
lw      $a0,-80($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp19
sub     $sp,$sp,4
li.s	$f0,0.000000
s.s	$f0, -84($fp)
#push stack pointer forward for var ___temp20
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -88($fp)
#push stack pointer forward for var ___temp21
sub     $sp,$sp,4
l.s	$f0,-84($fp)	#load global variable ___temp19 to register $f0
l.s	$f1,-88($fp)	#load global variable ___temp20 to register $f1
c.le.s $f1, $f0
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -92($fp)	#store variable ___temp21 in local variable ___temp21
#Inline puti
lw      $a0,-92($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp22
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -96($fp)
#push stack pointer forward for var ___temp23
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -100($fp)
#push stack pointer forward for var ___temp24
sub     $sp,$sp,4
l.s	$f0,-96($fp)	#load global variable ___temp22 to register $f0
l.s	$f1,-100($fp)	#load global variable ___temp23 to register $f1
c.le.s $f1, $f0
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -104($fp)	#store variable ___temp24 in local variable ___temp24
#Inline puti
lw      $a0,-104($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp25
sub     $sp,$sp,4
li	$a0,5
sw	$a0, -108($fp)
#push stack pointer forward for var ___temp26
sub     $sp,$sp,4
li	$a0,3
sw	$a0, -112($fp)
#push stack pointer forward for var ___temp27
sub     $sp,$sp,4
lw	$a0,-108($fp)	#load global variable ___temp25 to register $a0
lw	$a1,-112($fp)	#load global variable ___temp26 to register $a1
div $a0,$a1
mfhi $a0
sw	$a0, -116($fp)	#store variable ___temp27 in local variable ___temp27
#Inline puti
lw      $a0,-116($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp28
sub     $sp,$sp,4
li	$a0,3
sw	$a0, -120($fp)
#push stack pointer forward for var ___temp29
sub     $sp,$sp,4
lw	$a1,-120($fp)	#load global variable ___temp28 to register $a1
li $a0, -1
mult $a0,$a1
mflo $a0
sw	$a0, -124($fp)	#store variable ___temp29 in local variable ___temp29
#push stack pointer forward for var ___temp30
sub     $sp,$sp,4
li	$a0,5
sw	$a0, -128($fp)
#push stack pointer forward for var ___temp31
sub     $sp,$sp,4
lw	$a0,-124($fp)	#load global variable ___temp29 to register $a0
lw	$a1,-128($fp)	#load global variable ___temp30 to register $a1
div $a0,$a1
mfhi $a0
sw	$a0, -132($fp)	#store variable ___temp31 in local variable ___temp31
#Inline puti
lw      $a0,-132($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp32
sub     $sp,$sp,4
li	$a0,100
sw	$a0, -136($fp)
#push stack pointer forward for var ___temp33
sub     $sp,$sp,4
li	$a0,10
sw	$a0, -140($fp)
#push stack pointer forward for var ___temp34
sub     $sp,$sp,4
lw	$a0,-136($fp)	#load global variable ___temp32 to register $a0
lw	$a1,-140($fp)	#load global variable ___temp33 to register $a1
div $a0,$a1
mfhi $a0
sw	$a0, -144($fp)	#store variable ___temp34 in local variable ___temp34
#Inline puti
lw      $a0,-144($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp35
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -148($fp)
#push stack pointer forward for var ___temp36
sub     $sp,$sp,4
li	$a0,0
sw	$a0, -152($fp)
#push stack pointer forward for var ___temp37
sub     $sp,$sp,4
lw	$a0,-148($fp)	#load global variable ___temp35 to register $a0
lw	$a1,-152($fp)	#load global variable ___temp36 to register $a1
slt $a0,$a1,$a0
sw	$a0, -156($fp)	#store variable ___temp37 in local variable ___temp37
#push stack pointer forward for var ___temp38
sub     $sp,$sp,4
li	$a0,2
sw	$a0, -160($fp)
#push stack pointer forward for var ___temp39
sub     $sp,$sp,4
li	$a0,2
sw	$a0, -164($fp)
#push stack pointer forward for var ___temp40
sub     $sp,$sp,4
lw	$a0,-160($fp)	#load global variable ___temp38 to register $a0
lw	$a1,-164($fp)	#load global variable ___temp39 to register $a1
slt $a0,$a1,$a0
sw	$a0, -168($fp)	#store variable ___temp40 in local variable ___temp40
#push stack pointer forward for var ___temp41
sub     $sp,$sp,4
lw	$a0,-156($fp)	#load global variable ___temp37 to register $a0
lw	$a1,-168($fp)	#load global variable ___temp40 to register $a1
and 	$a0,$a0,$a1
sw	$a0, -172($fp)	#store variable ___temp41 in local variable ___temp41
#push stack pointer forward for var ___temp42
sub     $sp,$sp,4
li.s	$f0,5.000000
s.s	$f0, -176($fp)
#push stack pointer forward for var ___temp43
sub     $sp,$sp,4
li.s	$f0,6.500000
s.s	$f0, -180($fp)
#push stack pointer forward for var ___temp44
sub     $sp,$sp,4
l.s	$f0,-176($fp)	#load global variable ___temp42 to register $f0
l.s	$f1,-180($fp)	#load global variable ___temp43 to register $f1
c.lt.s $f0, $f1
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -184($fp)	#store variable ___temp44 in local variable ___temp44
#push stack pointer forward for var ___temp45
sub     $sp,$sp,4
lw	$a0,-172($fp)	#load global variable ___temp41 to register $a0
lw	$a1,-184($fp)	#load global variable ___temp44 to register $a1
or 	$a0,$a0,$a1
sw	$a0, -188($fp)	#store variable ___temp45 in local variable ___temp45
#Inline puti
lw      $a0,-188($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp46
sub     $sp,$sp,4
lw	$a1,-4($fp)	#load global variable i to register $a1
addi $a0, $a1, 1
sw	$a0, -4($fp)	#store variable i in local variable i
#push stack pointer forward for var ___temp47
sub     $sp,$sp,4
lw	$a1,-4($fp)	#load global variable i to register $a1
addi $a0, $a1, 1
sw	$a0, -4($fp)	#store variable i in local variable i
#push stack pointer forward for var ___temp48
sub     $sp,$sp,4
lw	$a1,-4($fp)	#load global variable i to register $a1
addi $a0, $a1, -1
sw	$a0, -4($fp)	#store variable i in local variable i
#push stack pointer forward for var ___temp49
sub     $sp,$sp,4
lw	$a1,-4($fp)	#load global variable i to register $a1
addi $a0, $a1, -1
sw	$a0, -4($fp)	#store variable i in local variable i
#push stack pointer forward for var ___temp50
sub     $sp,$sp,4
lw	$a1,-4($fp)	#load global variable i to register $a1
addi $a0, $a1, -1
sw	$a0, -4($fp)	#store variable i in local variable i
#push stack pointer forward for var ___temp51
sub     $sp,$sp,4
lw	$a1,-4($fp)	#load global variable i to register $a1
addi $a0, $a1, -1
sw	$a0, -4($fp)	#store variable i in local variable i
#push stack pointer forward for var ___temp52
sub     $sp,$sp,4
lw	$a1,-4($fp)	#load global variable i to register $a1
addi $a0, $a1, -1
sw	$a0, -4($fp)	#store variable i in local variable i
#push stack pointer forward for var ___temp53
sub     $sp,$sp,4
lw	$a1,-4($fp)	#load global variable i to register $a1
addi $a0, $a1, -1
sw	$a0, -4($fp)	#store variable i in local variable i
#push stack pointer forward for var ___temp54
sub     $sp,$sp,4
lw	$a1,-4($fp)	#load global variable i to register $a1
addi $a0, $a1, 1
sw	$a0, -4($fp)	#store variable i in local variable i
#Inline puti
lw      $a0,-4($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp55
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -228($fp)
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
