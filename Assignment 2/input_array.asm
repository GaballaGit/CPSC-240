global inputArray
extern printf
extern scanf


section .data
    testing     db "Testing input section!!!!!!!!!!!!!!!!", 0
    floatform   db "%lf", 0
section .bss

section .text
inputArray:

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



    
    ;test
    ;mov     rax, 0
    ;mov     rdi, testing
    ;call    printf

    ;Recieve the array
    mov     r14, rdi ;array itself
    mov     r15, rsi ;array size
    xor     r13, r13 ;iterator
    jmp topofloop

topofloop:
	cmp r13, r15
	jge	outofloop 

	;block prepare scans to input float
	mov	    rax, 0
	mov     rdi, floatform
	lea	    rsi, [r14 + 8*r13]
	call	scanf
	cmp     eax, -1
	je	    outofloop
    mov     rax, 0
    mov     rdi,
	inc	    r13
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

    mov     rax, r14
    ret

 