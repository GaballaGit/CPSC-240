global outputArray

extern printf



section .data
    floatform   db "%.9f ", 0
    one         dq 1.0

section .bss
    ; Unused
    
section .text
outputArray:

    ; Save the base pointer
     push    rbp
     mov     rbp, rsp

    ; Save the gprs (general purpose registers)
     push    rbx
     push    rcx
     push    rdx
     push    rsi
     push    rdi
     push    r8 
     push    r9 
     push    r10
     push    r11
     push    r12
     push    r13
     push    r14
     push    r15
     pushf

    ;Recieve the array
    mov     r15, rdi ;array itself
    mov     r14, rsi
    mov     r13, 0 ;iterator

    xorpd   xmm15, xmm15
    ;addsd   xmm15, [one]

topofloop:
    cmp     r13, r14
	jge	    outofloop 

    mov     rax, 1
    movsd   xmm0, [r15 + r13*8]
    mov     rdi, floatform
    call    printf

    inc     r13
    addsd   xmm15, [one]
    jmp     topofloop

outofloop:

    movsd   xmm0, xmm15
    ; Restore the general purpose registers
    popf          
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     r11
    pop     r10
    pop     r9 
    pop     r8 
    pop     rdi
    pop     rsi
    pop     rdx
    pop     rcx
    pop     rbx

    ; Restore the base pointer
    pop     rbp

    ret

 