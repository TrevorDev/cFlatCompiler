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
