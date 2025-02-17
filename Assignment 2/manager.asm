

; Declarations
global manager
extern inputArray
extern outputArray
extern computeSum
extern bubbleSort
extern printf
extern scanf
extern strlen
extern atof

section     .data
    greetings       db "This program will manage your arrays of 64-bit floats",10,"For the array enter a sequence of 64-bit floats separated by white space.", 10, "After the last input press enter followed by Control+D:", 10,0
    receivedArray   db "These numbers were received and placed into an array", 10, 0
    theSum          db "The sum of the inputted numbers is %.9f", 10 ,0
    theMean         db "The arithmetic mean of the numbers in the array is %.9f", 10, 0
    afterSort       db "This is the array after the sort process completed:", 10, 0
    num             db "%ld", 0
    stringformat    db "%s", 0
    sizeofArray     db "The size of the array is %ld", 10, 0
    newline         db  "", 10, 0

    

section     .bss
    prices          resq 20

section     .text
manager:

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

    ; Set the array to register r8 (note that accessing an element is [r8 + 8*r12], where r12 is the index)
    mov     r15, prices

    ;Greet the user
    mov     rax, 0
    mov     rdi, greetings
    call    printf

    ; Call input array
    mov      rax, 0
    mov      rdi, r15   ; The array itself
    mov      rsi, 20    ; Size of the Array
    call     inputArray
    mov      r14, rax

    ; Notifiy the user that the input was recieved
    mov     rax, 0
    mov     rdi, receivedArray
    call    printf

    ; Output unsorted array
    mov     rax, 0
    mov     rdi, r15
    mov     rsi, r14
    call    outputArray
    movsd   xmm14, xmm0
    ; xmm14 contains array size in float form

    ; New line
    mov     rax, 0
    mov     rdi, newline
    call    printf

    ; Get the sum of array
    mov     rax, 0
    mov     rdi, r15
    mov     rsi, r14
    call    computeSum
    movsd   xmm10, xmm0

    ; Output the sum
    mov     rax, 1
    mov     rdi, theSum
    movsd   xmm0, xmm10
    call    printf

    ; Calculate the mean
    ; Divide the sum with size
    movsd   xmm13, xmm10 ; Save sum for return
    divsd   xmm13, xmm14

    ; Output the mean
    mov     rax, 1
    mov     rdi, theMean
    movsd   xmm0, xmm13
    call    printf

    ; Sort array
    mov     rax, 0
    mov     rdi, r15
    mov     rsi, r14
    call    bubbleSort

    ; Output the sorted array
    mov     rax, 0
    mov     rdi, afterSort
    call    printf

    mov     rax, 0
    mov     rdi, r15
    mov     rsi, r14
    call    outputArray

    ; Newline
    mov     rax, 0
    mov     rdi, newline
    call    printf

    ; Return sum
    movsd   xmm0, xmm10

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

    ; Return the sum of the array
    ret