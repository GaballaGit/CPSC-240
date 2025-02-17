global computeSum


section .data

section .bss

section .text
computeSum:

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
    mov     r15, rsi ;array size
    mov     r13, 0 ;iterator

    ;Sum register
    xorpd   xmm15, xmm15
    jmp topofloop

; Calculate the sum of the array
topofloop:
	cmp     r13, r15
	jge	outofloop 

    ;add
	addsd	 xmm15, [r14 + 8*r13]
	
    ;increment 1 up
    inc     r13
    jmp     topofloop


; Break the loop
outofloop:

    movsd     xmm0, xmm15
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

    ;Return the sum
    ret

 