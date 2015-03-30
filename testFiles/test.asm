#puti function - args: int i
puti:
    #store ra
    move    $fp,$sp
    sub     $sp,$sp,4
    sw      $ra,4($sp)

    #load param
    lw      $a0,8($fp)
    li      $v0, 1
    syscall

    #reset sp and fp, return
    move    $sp,$fp
    lw      $fp, 4($fp)
    jr      $ra

#putc function - args: int c
putc:
    #store ra
    move    $fp,$sp
    sub     $sp,$sp,4
    sw      $ra,4($sp)

    #load param
    lw      $a0,8($fp)
    li      $v0, 11
    syscall

    #reset sp and fp, return
    move    $sp,$fp
    lw      $fp, 4($fp)
    jr      $ra

#puti function - args: float f
putf:
    #store ra
    move    $fp,$sp
    sub     $sp,$sp,4
    sw      $ra,4($sp)

    #load param
    l.s     $f12,8($fp)
    li      $v0, 2
    syscall

    #reset sp and fp, return
    move    $sp,$fp
    lw      $fp, 4($fp)
    jr      $ra

main:
    move    $fp,$sp
    #stack frame pushing
    sub     $sp,$sp,4
    sw      $ra,4($sp)

    # push local variable on stack
    sub     $sp,$sp,4
    #li.s    $f12,1234.5678
    #s.s     $f12,4($sp)
    li      $v0,65
    sw      $v0,4($sp)

    #function call - arguments push
    sub     $sp,$sp,4
    lw      $v0,-4($fp)
    sw      $v0,4($sp)

    #frame pointer push
    sub     $sp,$sp,4
    sw      $fp,4($sp)

    jal     puti

    #stack pop
    addi    $sp,$sp,4

    #function call - arguments push
    sub     $sp,$sp,4
    lw      $v0,-4($fp)
    sw      $v0,4($sp)

    #frame pointer push
    sub     $sp,$sp,4
    sw      $fp,4($sp)

    jal     putc
    jal     putf
    addi    $sp,$sp,4


    #stack pop
    addi    $sp,$sp,8
    lw      $ra, 0($fp)
    jr      $ra
