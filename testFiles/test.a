puti:
    li $v0, 1
    li $a0, 33
    syscall
    jr $31

putc:
    li $v0, 11
    li $a0, 'a'
    syscall
    jr $31


putf:
    li $v0, 2
    li.s $f12, 4.5
    syscall
    jr $31


main:
    jal puti
    jal putc
    jal putf
    jr $31