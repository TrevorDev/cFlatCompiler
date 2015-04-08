

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
li.s	$f0,50.000000
s.s	$f0, -8($fp)
#push stack pointer forward for var ___temp1
sub     $sp,$sp,4
l.s	$f1,-8($fp)	#load global variable ___temp0 to register $f1
s.s	$f0, -12($fp)	#store variable ___temp1 in local variable ___temp1
lw	$a0,-12($fp)	#load local variable ___temp1 to register $a0
sw	$a0, -4($fp)	#store variable ___temp1 in local variable i
#push stack pointer forward for var ___temp2
sub     $sp,$sp,4
l.s	$f1,-4($fp)	#load global variable i to register $f1
li.s $f0, 1.0
add.s $f0, $f0, $f1
s.s	$f0, -4($fp)	#store variable i in local variable i
#push stack pointer forward for var ___temp3
sub     $sp,$sp,4
l.s	$f1,-4($fp)	#load global variable i to register $f1
li.s $f0, 1.0
add.s $f0, $f0, $f1
s.s	$f0, -4($fp)	#store variable i in local variable i
#push stack pointer forward for var ___temp4
sub     $sp,$sp,4
l.s	$f1,-4($fp)	#load global variable i to register $f1
s.s	$f0, -24($fp)	#store variable ___temp4 in local variable ___temp4
#Inline putc
l.s      $f12,-24($fp)
li      $v0, 2
syscall
#push stack pointer forward for var ___temp5
sub     $sp,$sp,4
l.s	$f1,-4($fp)	#load global variable i to register $f1
s.s	$f0, -28($fp)	#store variable ___temp5 in local variable ___temp5
#Inline putc
l.s      $f12,-28($fp)
li      $v0, 2
syscall
#push stack pointer forward for var ___temp6
sub     $sp,$sp,4
l.s	$f1,-4($fp)	#load global variable i to register $f1
li.s $f0, -1.0
add.s $f0, $f0, $f1
s.s	$f0, -4($fp)	#store variable i in local variable i
#push stack pointer forward for var ___temp7
sub     $sp,$sp,4
l.s	$f1,-4($fp)	#load global variable i to register $f1
li.s $f0, -1.0
add.s $f0, $f0, $f1
s.s	$f0, -4($fp)	#store variable i in local variable i
#push stack pointer forward for var ___temp8
sub     $sp,$sp,4
l.s	$f1,-4($fp)	#load global variable i to register $f1
li.s $f0, -1.0
add.s $f0, $f0, $f1
s.s	$f0, -4($fp)	#store variable i in local variable i
#push stack pointer forward for var ___temp9
sub     $sp,$sp,4
l.s	$f1,-4($fp)	#load global variable i to register $f1
li.s $f0, -1.0
mul.s $f0,$f0,$f1
s.s	$f0, -44($fp)	#store variable ___temp9 in local variable ___temp9
#push stack pointer forward for var ___temp10
sub     $sp,$sp,4
l.s	$f1,-44($fp)	#load global variable ___temp9 to register $f1
li.s $f0, -1.0
mul.s $f0,$f0,$f1
s.s	$f0, -48($fp)	#store variable ___temp10 in local variable ___temp10
#Inline putc
l.s      $f12,-48($fp)
li      $v0, 2
syscall
#push stack pointer forward for var ___temp11
sub     $sp,$sp,4
li	$a0,1
sw	$a0, -52($fp)
#reset sp and fp and return
move    $sp,$fp
lw      $ra, 0($fp)
lw      $fp, 4($fp)
jr      $ra
