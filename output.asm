

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
#push stack pointer forward for var z
sub     $sp,$sp,4
#push stack pointer forward for var x
sub     $sp,$sp,4
#push stack pointer forward for var y
sub     $sp,$sp,4
#push stack pointer forward for var ___temp0
sub     $sp,$sp,4
li.s	$f0,15.000000
s.s	$f0, -16($fp)
lw	$a0,-16($fp)	#load local variable ___temp0 to register $a0
sw	$a0, -8($fp)	#store variable ___temp0 in local variable x
#push stack pointer forward for var ___temp1
sub     $sp,$sp,4
li.s	$f0,3.000000
s.s	$f0, -20($fp)
lw	$a0,-20($fp)	#load local variable ___temp1 to register $a0
sw	$a0, -12($fp)	#store variable ___temp1 in local variable y
#push stack pointer forward for var ___temp2
sub     $sp,$sp,4
l.s	$f0,-8($fp)	#load global variable x to register $f0
l.s	$f1,-12($fp)	#load global variable y to register $f1
div.s $f0,$f0,$f1
s.s	$f0, -24($fp)	#store variable ___temp2 in local variable ___temp2
#push stack pointer forward for var ___temp3
sub     $sp,$sp,4
l.s	$f0,-24($fp)	#load global variable ___temp2 to register $f0
l.s	$f1,-12($fp)	#load global variable y to register $f1
mul.s $f0,$f0,$f1
s.s	$f0, -28($fp)	#store variable ___temp3 in local variable ___temp3
#push stack pointer forward for var ___temp4
sub     $sp,$sp,4
l.s	$f0,-28($fp)	#load global variable ___temp3 to register $f0
l.s	$f1,-12($fp)	#load global variable y to register $f1
mul.s $f0,$f0,$f1
s.s	$f0, -32($fp)	#store variable ___temp4 in local variable ___temp4
lw	$a0,-32($fp)	#load local variable ___temp4 to register $a0
sw	$a0, -4($fp)	#store variable ___temp4 in local variable z
#Inline putc
l.s      $f12,-4($fp)
li      $v0, 2
syscall
#push stack pointer forward for var ___temp5
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -36($fp)
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
