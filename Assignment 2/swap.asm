global swap


section .data

section .bss

section .text
swap:

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

    ; Put values passed into less volitile registers
    movsd   xmm10, xmm0
    movsd   xmm11, xmm1

    ; Swap the values in the registers
    xorpd   xmm10, xmm11
    xorpd   xmm11, xmm10
    xorpd   xmm10, xmm11


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

 