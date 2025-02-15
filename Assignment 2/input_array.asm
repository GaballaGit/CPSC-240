global inputArray
extern isfloat
extern atof
extern printf
extern scanf


section .data
    testing     db "Testing input section!!!!!!!!!!!!!!!!", 0
    badFloat    db "This input is not a float!", 10, 0
    stringform   db "%s", 0
    counter     dq 0.0

section .bss
    inputString resb 50

section .text
inputArray:

    ; Save the base pointer
     push    rbp
     mov     rbp, rsp

    ; Save the gprs (general purpose registers)
    push     rbx
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
    mov     r13, 0;iterator

    jmp topofloop

topofloop:
	cmp r13, r15
	jge	outofloop 

	;block prepare scans to input float
	mov	    rax, 0
    push    qword 0
    push    qword 0
	mov     rdi, stringform
    mov     rsi, inputString
	call	scanf
    pop     rax
    pop     rax
	cmp     eax, -1
	je	    outofloop ; check for ctrl d

    ; Validate the string
    mov     rax, 0
    mov     rdi, inputString
    call    isfloat
    cmp     rax, 0
    je      badinput

    ; Convert string to float
    mov     rax, 0
    mov     rdi, inputString
    call    atof
    movsd   [r14 + r13*8], xmm0

    ;increment one
	inc	    r13
    jmp     topofloop

badinput:

    ; print bad input and return?
    mov     rax, 0
    mov     rdi, badFloat
    call    printf
    jmp     topofloop

outofloop:

    mov     rax, r13

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

    ; Return size of array
    
    ret

 