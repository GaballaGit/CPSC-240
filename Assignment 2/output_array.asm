global outputArray
extern isfloat
extern atof
extern printf
extern scanf


section .data
    floatform   db "%.9f", 0

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
    mov     r14, rdi ;array itself
    mov     r15, rsi
    mov     r13, 0 ;iterator
    jmp topofloop

topofloop:
    cmp r13, r15
	jge	outofloop 


	; Output each float of the array
    movsd   xmm15, [r14 + r13*8]

    mov     rax, 1
    mov     rdi, floatform
    movsd   xmm0, xmm15
    call    printf

    inc     r13
    jmp     topofloop

outofloop:
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

 