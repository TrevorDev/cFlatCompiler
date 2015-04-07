

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
sub     $sp,$sp,4
#push stack pointer forward for var y
sub     $sp,$sp,4
#push stack pointer forward for var z
sub     $sp,$sp,4
#push stack pointer forward for var ___temp0
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -16($fp)
lw	$a0,-16($fp)	#load local variable ___temp0 to register $a0
sw	$a0, -4($fp)	#store variable ___temp0 in local variable x
#push stack pointer forward for var ___temp1
sub     $sp,$sp,4
li	$a0,2
sw	$a0, -20($fp)
lw	$a0,-20($fp)	#load local variable ___temp1 to register $a0
sw	$a0, -8($fp)	#store variable ___temp1 in local variable y
#Inline puti
lw      $a0,-12($fp)
li      $v0, 1
syscall
#push stack pointer forward for var ___temp2
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -24($fp)
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
