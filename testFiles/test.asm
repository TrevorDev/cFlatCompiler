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

main:
    move    $fp,$sp
    #stack frame pushing
    sub     $sp,$sp,4
    sw      $ra,4($sp)

    sub     $sp,$sp,4
    li.s    $f12,1234.5678      #x = 4
    s.s     $f12,4($sp)

    #function call - arguments push
    sub     $sp,$sp,4
    move    $v0,$fp
    addi    $v0,$v0,-4
    sw      $v0,4($sp)

    #frame pointer push
    sub     $sp,$sp,4
    sw      $fp,4($sp)

    jal     putf

    #stack pop
    addi    $sp,$sp,12

    #jal     putc


    lw      $ra, 0($fp)
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