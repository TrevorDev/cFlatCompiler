

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
li.s	$f0,6.100000
s.s	$f0, -4($fp)
#push stack pointer forward for var ___temp1
sub     $sp,$sp,4
li.s	$f0,6.100000
s.s	$f0, -8($fp)
#push stack pointer forward for var ___temp2
sub     $sp,$sp,4
l.s	$f0,-4($fp)	#load global variable ___temp0 to register $f0
l.s	$f1,-8($fp)	#load global variable ___temp1 to register $f1
c.eq.s $f0, $f1
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -12($fp)	#store variable ___temp2 in local variable ___temp2
#Inline puti
lw      $a0,-12($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp3
sub     $sp,$sp,4
li.s	$f0,6.100000
s.s	$f0, -16($fp)
#push stack pointer forward for var ___temp4
sub     $sp,$sp,4
li.s	$f0,6.100000
s.s	$f0, -20($fp)
#push stack pointer forward for var ___temp5
sub     $sp,$sp,4
l.s	$f0,-16($fp)	#load global variable ___temp3 to register $f0
l.s	$f1,-20($fp)	#load global variable ___temp4 to register $f1
c.eq.s $f0, $f1
cfc1   $t0, $25
andi   $t0, 1
xori	 $t0,$t0,1
sw	$t0, -24($fp)	#store variable ___temp5 in local variable ___temp5
#Inline puti
lw      $a0,-24($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp6
sub     $sp,$sp,4
li.s	$f0,6.100000
s.s	$f0, -28($fp)
#push stack pointer forward for var ___temp7
sub     $sp,$sp,4
li.s	$f0,6.000000
s.s	$f0, -32($fp)
#push stack pointer forward for var ___temp8
sub     $sp,$sp,4
l.s	$f0,-28($fp)	#load global variable ___temp6 to register $f0
l.s	$f1,-32($fp)	#load global variable ___temp7 to register $f1
c.eq.s $f0, $f1
cfc1   $t0, $25
andi   $t0, 1
xori	 $t0,$t0,1
sw	$t0, -36($fp)	#store variable ___temp8 in local variable ___temp8
#Inline puti
lw      $a0,-36($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp9
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -40($fp)
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
