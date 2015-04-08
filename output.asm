

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
li	$a0,1
sw	$a0, -4($fp)
#push stack pointer forward for var ___temp1
sub     $sp,$sp,4
li	$a0,0
sw	$a0, -8($fp)
#push stack pointer forward for var ___temp2
sub     $sp,$sp,4
lw	$a0,-4($fp)	#load global variable ___temp0 to register $a0
lw	$a1,-8($fp)	#load global variable ___temp1 to register $a1
slt $a0,$a1,$a0
sw	$a0, -12($fp)	#store variable ___temp2 in local variable ___temp2
#push stack pointer forward for var ___temp3
sub     $sp,$sp,4
li	$a0,2
sw	$a0, -16($fp)
#push stack pointer forward for var ___temp4
sub     $sp,$sp,4
li	$a0,2
sw	$a0, -20($fp)
#push stack pointer forward for var ___temp5
sub     $sp,$sp,4
lw	$a0,-16($fp)	#load global variable ___temp3 to register $a0
lw	$a1,-20($fp)	#load global variable ___temp4 to register $a1
slt $a0,$a1,$a0
sw	$a0, -24($fp)	#store variable ___temp5 in local variable ___temp5
#push stack pointer forward for var ___temp6
sub     $sp,$sp,4
lw	$a0,-12($fp)	#load global variable ___temp2 to register $a0
lw	$a1,-24($fp)	#load global variable ___temp5 to register $a1
and 	$a0,$a0,$a1
sw	$a0, -28($fp)	#store variable ___temp6 in local variable ___temp6
#push stack pointer forward for var ___temp7
sub     $sp,$sp,4
li.s	$f0,5.000000
s.s	$f0, -32($fp)
#push stack pointer forward for var ___temp8
sub     $sp,$sp,4
li.s	$f0,6.500000
s.s	$f0, -36($fp)
#push stack pointer forward for var ___temp9
sub     $sp,$sp,4
l.s	$f0,-32($fp)	#load global variable ___temp7 to register $f0
l.s	$f1,-36($fp)	#load global variable ___temp8 to register $f1
c.lt.s $f0, $f1
cfc1   $t0, $25
andi   $t0, 1
sw	$t0, -40($fp)	#store variable ___temp9 in local variable ___temp9
#push stack pointer forward for var ___temp10
sub     $sp,$sp,4
lw	$a0,-28($fp)	#load global variable ___temp6 to register $a0
lw	$a1,-40($fp)	#load global variable ___temp9 to register $a1
or 	$a0,$a0,$a1
sw	$a0, -44($fp)	#store variable ___temp10 in local variable ___temp10
#Inline puti
lw      $a0,-44($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp11
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -48($fp)
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
