        ; https://cs61.seas.harvard.edu/site/2018/Asm2/
        ; On x86-64 Linux, the first six function arguments are passed in registers %rdi, %rsi, %rdx, %rcx, %r8, and %r9, respectively
        ; %rdi, %rsi, %rdx, %rcx, %r8(d), and %r9(d)
        ; %edi, %esi, %edx, %ecx;
        ; there is no %e8(d), or %e9(d)
        ;
        ; however, for windows it is different
        ; https://docs.microsoft.com/en-us/cpp/build/x64-calling-convention?view=msvc-170
        ; RCX, RDX, R8, R9, stack for integer
default rel
bits 64

section .data
section .text
global factorial

    ; Define constants to refer to the function arguments as offsets from RSP/RBP
    a equ    0
    result equ 8

factorial:
    push    rbp                 ; Set up a stack frame for the function
    mov    rbp, rsp             ; Continuing the linked list here, by pointing rbp to this stack frame
    sub    rsp, 32              ; Must align on 16 byte boundary

    n equ 16                    ; Refers to current accumulated value

    ; Save local variables onto the stack frame
    mov    [rsp + a], rcx       ; save parameter a (rcx)

    cmp    rcx, 1
    jg    if_greater            ; If n <= 1, return 1
    mov    eax, 1

    leave
    ret

if_greater:
    mov    [rsp + n], rcx          ; Save current accumulated value
    dec    rcx                     ; call factorial(n-1)
    call    factorial
    mov    rcx, [rsp + n]       ; Restore original accumulated value
    imul    rax, rcx            ; Multiply factoral(n -1) * n

    leave                       ; Undo the stack frame (it sets rsp to rbp, then pops rbp.)
    ret                         ; return to calling procedure (main).
