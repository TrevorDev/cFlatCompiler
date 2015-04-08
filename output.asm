

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
li.s	$f0,5.000000
s.s	$f0, -8($fp)
#push stack pointer forward for var ___temp2
sub     $sp,$sp,4
l.s	$f0,-4($fp)	#load global variable ___temp0 to register $f0
l.s	$f1,-8($fp)	#load global variable ___temp1 to register $f1
sge.s $a0,$f0,$f1
sw	$a0, -12($fp)	#store variable ___temp2 in local variable ___temp2
