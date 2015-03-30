putc:
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#load and deref param
lw      $v0,8($fp)
lw      $v1,0($v0)
#display to screen
move    $a0,$v1
li      $v0, 11
syscall
#reset sp and fp
move    $sp,$fp
lw      $fp, 4($fp)
jr      $ra
puti:
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#load and deref param
lw      $v0,8($fp)
lw      $v1,0($v0)
#display to screen
move    $a0,$v1
li      $v0, 1
syscall
#reset sp and fp
move    $sp,$fp
lw      $fp, 4($fp)
jr      $ra
putf:
move    $fp,$sp
sub     $sp,$sp,4
sw      $ra,4($sp)
#load and deref param
lw      $a0,8($fp)
l.s    $f12,($a0)
#display to screen
#move    $a0,$v1
li      $v0, 2
syscall
#reset sp and fp
move    $sp,$fp
lw      $fp, 4($fp)
jr      $ra
main:
move	$gp, $sp
move   $fp, $sp
#stack frame pushing
sub     $sp,$sp,4
sw      $ra,4($sp)
#push stack pointer forward for var a
sub     $gp,$gp,4
lw      $ra, 0($fp)

jr		$ra

bar:

foo:

#push stack pointer forward for var a
sub     $sp,$sp,4
__main:

#push stack pointer forward for var j
sub     $sp,$sp,4
#push stack pointer forward for var x
sub     $sp,$sp,4
#push stack pointer forward for var a
sub     $sp,$sp,8
#push stack pointer forward for var y
sub     $sp,$sp,4
