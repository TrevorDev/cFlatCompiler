

main:
move	$gp, $sp
move   $fp, $sp
#stack frame pushing
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var a
sub     $sp,$sp,4
#push stack pointer forward for var d
sub     $sp,$sp,4
#frame pointer push for func call
sub     $sp,$sp,4
sw      $fp,4($sp)
jal     __main
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr		$ra


printfloats:
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
#Inline putc
l.s      $f12,-4($fp)
li      $v0, 2
syscall
#Inline putc
l.s      $f12,-8($fp)
li      $v0, 2
syscall
#Inline putc
l.s      $f12,-12($fp)
li      $v0, 2
syscall
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra


printchars:
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
#Inline putf
lw      $a0,-4($fp)
li      $v0, 11
syscall
#Inline putf
lw      $a0,-8($fp)
li      $v0, 11
syscall
#Inline putf
lw      $a0,-12($fp)
li      $v0, 11
syscall
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra


__main:
#setup framepointer and save ra
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var b
sub     $sp,$sp,4
#push stack pointer forward for var c
sub     $sp,$sp,4
#push stack pointer forward for var e
sub     $sp,$sp,4
#push stack pointer forward for var f
sub     $sp,$sp,4
#push stack pointer forward for var ___temp0
sub     $sp,$sp,4
li.s	$f0,1.000000
s.s	$f0, -20($fp)
lw	$a0,-20($fp)	#load local variable ___temp0 to register $a0
sw	$a0, -4($gp)	#store variable ___temp0 in global variable a
#push stack pointer forward for var ___temp1
sub     $sp,$sp,4
li.s	$f0,2.000000
s.s	$f0, -24($fp)
lw	$a0,-24($fp)	#load local variable ___temp1 to register $a0
sw	$a0, -4($fp)	#store variable ___temp1 in local variable b
#push stack pointer forward for var ___temp2
sub     $sp,$sp,4
li.s	$f0,3.000000
s.s	$f0, -28($fp)
lw	$a0,-28($fp)	#load local variable ___temp2 to register $a0
sw	$a0, -8($fp)	#store variable ___temp2 in local variable c
#push stack pointer forward for var ___temp3
sub     $sp,$sp,4
li	$a0,65
sw	$a0, -32($fp)
lw	$a0,-32($fp)	#load local variable ___temp3 to register $a0
sw	$a0, -8($gp)	#store variable ___temp3 in global variable d
#push stack pointer forward for var ___temp4
sub     $sp,$sp,4
li	$a0,66
sw	$a0, -36($fp)
lw	$a0,-36($fp)	#load local variable ___temp4 to register $a0
sw	$a0, -12($fp)	#store variable ___temp4 in local variable e
#push stack pointer forward for var ___temp5
sub     $sp,$sp,4
li	$a0,67
sw	$a0, -40($fp)
lw	$a0,-40($fp)	#load local variable ___temp5 to register $a0
sw	$a0, -16($fp)	#store variable ___temp5 in local variable f
#frame pointer push for func call
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-4($gp)
sw 	$a0,4($sp)
sub     $sp,$sp,4
lw	$a0,-4($fp)
sw 	$a0,4($sp)
sub     $sp,$sp,4
lw	$a0,-8($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		printfloats
#frame pointer push for func call
sub     $sp,$sp,4
sw      $fp,4($sp)
#store the stack pointer as it is now
move $k0,$sp
sub     $sp,$sp,4
sub     $sp,$sp,4
lw	$a0,-8($gp)
sw 	$a0,4($sp)
sub     $sp,$sp,4
lw	$a0,-12($fp)
sw 	$a0,4($sp)
sub     $sp,$sp,4
lw	$a0,-16($fp)
sw 	$a0,4($sp)
move $sp,$k0 #restore stack pointer
jal		printchars
#push stack pointer forward for var ___temp6
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -44($fp)
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
