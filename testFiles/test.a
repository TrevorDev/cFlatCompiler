puti:
    move    $fp,$sp
    sub     $sp,$sp,4
    sw      $ra,4($sp)

    lw      $v0,4($fp)
    lw      $v1,0($v0)


    move    $a0,$v1

    li      $v0, 1
    syscall
    #jal     putc

    move    $sp,$fp
    lw      $fp,4($sp)  # pop fp
    lw      $ra,8($sp)  # pop ra
    jr      $ra

#putc:
#    sub     $sp,$sp,4
#    sw      $ra,4($sp)

 #   li      $v0, 11
 #   li      $a0, 'a'
 #   syscall
 #   jal     putf

 #   lw      $ra,4($sp)  # pop ra
 #   addi    $sp,$sp,4
 #   jr      $ra


#putf:
#    sub     $sp,$sp,4
#    sw      $ra,4($sp)

#    li      $v0, 2
#    li.s    $f12, 4.5
#    syscall

 #   lw      $ra,4($sp)  # pop ra
 #   addi    $sp,$sp,4
 #   jr      $ra


main:
    move    $fp,$sp
    #stack frame pushing
    sub     $sp,$sp,4
    sw      $ra,4($sp)

    sub     $sp,$sp,4
    li      $v0,4       #x = 4
    sw      $v0,4($sp)

    #function call - arguments push
    sub     $sp,$sp,4
    move    $v0,$fp
    addi    $v0,$v0,12
    sw      $v0,4($sp)

    #frame pointer push
    sub     $sp,$sp,4
    sw      $fp,4($sp)

    jal     puti

    #stack frame popping
    lw      $ra,4($sp)  # pop ra
    addi    $sp,$sp,4
    jr      $ra