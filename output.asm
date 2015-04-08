

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
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -4($fp)
#push stack pointer forward for var ___temp1
sub     $sp,$sp,4
li.s	$f0,0.000000
s.s	$f0, -8($fp)
#push stack pointer forward for var ___temp2
sub     $sp,$sp,4
l.s	$f0,-4($fp)	#load global variable ___temp0 to register $f0
l.s	$f1,-8($fp)	#load global variable ___temp1 to register $f1
c.lt.s $f0, $f1
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -12($fp)	#store variable ___temp2 in local variable ___temp2
#Inline puti
lw      $a0,-12($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp3
sub     $sp,$sp,4
li.s	$f0,0.000000
s.s	$f0, -16($fp)
#push stack pointer forward for var ___temp4
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -20($fp)
#push stack pointer forward for var ___temp5
sub     $sp,$sp,4
l.s	$f0,-16($fp)	#load global variable ___temp3 to register $f0
l.s	$f1,-20($fp)	#load global variable ___temp4 to register $f1
c.lt.s $f0, $f1
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -24($fp)	#store variable ___temp5 in local variable ___temp5
#Inline puti
lw      $a0,-24($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp6
sub     $sp,$sp,4
li.s	$f0,0.000000
s.s	$f0, -28($fp)
#push stack pointer forward for var ___temp7
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -32($fp)
#push stack pointer forward for var ___temp8
sub     $sp,$sp,4
l.s	$f0,-28($fp)	#load global variable ___temp6 to register $f0
l.s	$f1,-32($fp)	#load global variable ___temp7 to register $f1
c.lt.s $f1, $f0
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -36($fp)	#store variable ___temp8 in local variable ___temp8
#Inline puti
lw      $a0,-36($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp9
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -40($fp)
#push stack pointer forward for var ___temp10
sub     $sp,$sp,4
li.s	$f0,0.000000
s.s	$f0, -44($fp)
#push stack pointer forward for var ___temp11
sub     $sp,$sp,4
l.s	$f0,-40($fp)	#load global variable ___temp9 to register $f0
l.s	$f1,-44($fp)	#load global variable ___temp10 to register $f1
c.lt.s $f1, $f0
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -48($fp)	#store variable ___temp11 in local variable ___temp11
#Inline puti
lw      $a0,-48($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp12
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -52($fp)
#push stack pointer forward for var ___temp13
sub     $sp,$sp,4
li.s	$f0,0.000000
s.s	$f0, -56($fp)
#push stack pointer forward for var ___temp14
sub     $sp,$sp,4
l.s	$f0,-52($fp)	#load global variable ___temp12 to register $f0
l.s	$f1,-56($fp)	#load global variable ___temp13 to register $f1
c.le.s $f0, $f1
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -60($fp)	#store variable ___temp14 in local variable ___temp14
#Inline puti
lw      $a0,-60($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp15
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -64($fp)
#push stack pointer forward for var ___temp16
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -68($fp)
#push stack pointer forward for var ___temp17
sub     $sp,$sp,4
l.s	$f0,-64($fp)	#load global variable ___temp15 to register $f0
l.s	$f1,-68($fp)	#load global variable ___temp16 to register $f1
c.le.s $f0, $f1
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -72($fp)	#store variable ___temp17 in local variable ___temp17
#Inline puti
lw      $a0,-72($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp18
sub     $sp,$sp,4
li.s	$f0,0.000000
s.s	$f0, -76($fp)
#push stack pointer forward for var ___temp19
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -80($fp)
#push stack pointer forward for var ___temp20
sub     $sp,$sp,4
l.s	$f0,-76($fp)	#load global variable ___temp18 to register $f0
l.s	$f1,-80($fp)	#load global variable ___temp19 to register $f1
c.le.s $f1, $f0
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -84($fp)	#store variable ___temp20 in local variable ___temp20
#Inline puti
lw      $a0,-84($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp21
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -88($fp)
#push stack pointer forward for var ___temp22
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -92($fp)
#push stack pointer forward for var ___temp23
sub     $sp,$sp,4
l.s	$f0,-88($fp)	#load global variable ___temp21 to register $f0
l.s	$f1,-92($fp)	#load global variable ___temp22 to register $f1
c.le.s $f1, $f0
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -96($fp)	#store variable ___temp23 in local variable ___temp23
#Inline puti
lw      $a0,-96($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp24
sub     $sp,$sp,4
li	$a0,5
sw	$a0, -100($fp)
#push stack pointer forward for var ___temp25
sub     $sp,$sp,4
li	$a0,3
sw	$a0, -104($fp)
#push stack pointer forward for var ___temp26
sub     $sp,$sp,4
lw	$a0,-100($fp)	#load global variable ___temp24 to register $a0
lw	$a1,-104($fp)	#load global variable ___temp25 to register $a1
div $a0,$a1
mfhi $a0
sw	$a0, -108($fp)	#store variable ___temp26 in local variable ___temp26
#Inline puti
lw      $a0,-108($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp27
sub     $sp,$sp,4
li	$a0,3
sw	$a0, -112($fp)
#push stack pointer forward for var ___temp28
sub     $sp,$sp,4
li	$a0,5
sw	$a0, -116($fp)
#push stack pointer forward for var ___temp29
sub     $sp,$sp,4
lw	$a0,-112($fp)	#load global variable ___temp27 to register $a0
lw	$a1,-116($fp)	#load global variable ___temp28 to register $a1
div $a0,$a1
mfhi $a0
sw	$a0, -120($fp)	#store variable ___temp29 in local variable ___temp29
#Inline puti
lw      $a0,-120($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp30
sub     $sp,$sp,4
li	$a0,100
sw	$a0, -124($fp)
#push stack pointer forward for var ___temp31
sub     $sp,$sp,4
li	$a0,10
sw	$a0, -128($fp)
#push stack pointer forward for var ___temp32
sub     $sp,$sp,4
lw	$a0,-124($fp)	#load global variable ___temp30 to register $a0
lw	$a1,-128($fp)	#load global variable ___temp31 to register $a1
div $a0,$a1
mfhi $a0
sw	$a0, -132($fp)	#store variable ___temp32 in local variable ___temp32
#Inline puti
lw      $a0,-132($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp33
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -136($fp)
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
