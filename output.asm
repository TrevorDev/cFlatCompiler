

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
li	$a0,10
sw	$a0, -4($fp)
#Inline putf
lw      $a0,-4($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp1
li	$a0,10
sw	$a0, -8($fp)
#Inline putf
lw      $a0,-8($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp2
li	$a0,10
sw	$a0, -12($fp)
#Inline putf
lw      $a0,-12($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp3
li	$a0,10
sw	$a0, -16($fp)
#Inline putf
lw      $a0,-16($fp)
li      $v0, 11
syscall
#push stack pointer forward for var ___temp4
li	$a0,1
sw	$a0, -20($fp)
lw	$a0,-20($fp)	#load global variable ___temp4 to register $a0
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
