.section .text
.global hamming_distance

# long hamming_distance(char *s1, char *s2)

hamming_distance:

    xor %rcx, %rcx        # index = 0
    xor %rax, %rax        # total distance = 0

compare_loop:

    movzbq (%rdi,%rcx), %r8
    movzbq (%rsi,%rcx), %r9

    cmp $0, %r8
    je done
    cmp $0, %r9
    je done

    xor %r9, %r8          # XOR characters

    mov $8, %r10          # 8 bits per character

count_bits:
    test $1, %r8
    jz skip
    inc %rax
skip:
    shr $1, %r8
    dec %r10
    jnz count_bits

    inc %rcx
    jmp compare_loop

done:
    ret

.section .note.GNU-stack,"",@progbits
