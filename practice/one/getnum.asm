global getnum

extern printf
extern fgets
extern scanf
extern strlen
extern stdin

section .data

    prompt_name     db "What is your name: ", 0
    prompt_number   db "Please enter a number: ", 0
    num             db "%lf %lf %lf", 0

section .bss

    name            resb 32

section .text
getnum:
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

    ;prompt user name:
    mov     rax, 0
    mov     rdi, prompt_name
    call    printf

    ; Get user name
    mov     rax, 0
    mov     rdi, name
    mov     rsi, 32
    mov     rdx, [stdin]
    call    fgets

    ;clear new line
    mov     rax, 0
    mov     rdi, name
    call    strlen
    mov     [name + rax - 1], byte 0

    ; prompt user to enter a number
    mov     rax, 0
    mov     rdi, prompt_number
    call    printf

    ; get user input
    mov     rax, 0
    push    qword 1
    push    qword 1
    mov     rdi, num
    mov     rsi, rsp
    call    scanf
    movsd   xmm10, [rsp]
    pop     rax
    pop     rax

    

    ;hmm?
    mov     rax, 1
    mov     rdi, num
    movsd   xmm0, xmm10
    call    printf

    ;hmm?
    


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

    ; Return
    ret
