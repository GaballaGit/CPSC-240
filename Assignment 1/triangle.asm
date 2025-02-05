;****************************************************************************************************************************
; Program name: "Assignment-1-Triangles". A short description of the purpose of the program
; Copyright (C) 2025 Mark Gaballa

; This file is part of the software program "Assignment-1-Triangles".

; "Assignment-1-Triangles" is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

; "Assignment-1-Triangles" is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <https://www.gnu.org/licenses/>. 

; Author information
;   Author name : Mark Gaballa
;   Author email: mgaballa@csu.fullerton.edu
;   Author section: 240-09
;   Author CWID : 885762294

; For research purpose only. Please don't copy word for word. Avoid academic dishonesty. 
;****************************************************************************************************************************

;Declarations
global triangle

extern stdin
extern fgets
extern scanf
extern printf
extern strlen
extern cos


section .data
    prompt_name     db "Please enter your last name: ", 0
    prompt_title    db "Please enter your title (Mr, Ms, Nurse, Engineer, etc): ", 0
    prompt_sides    db "Please enter the sides of your triangle separated by ws: ", 0
    prompt_angle    db "Please enter the size in degrees of the angle between those sides: ", 0
    sides           db "%lf %lf", 0
    angle           db "%lf", 0
    pi              dq 3.141592653589793
    oneEighty       dq 180.0
    cos_result      dq 0.0
    two             dq 2.0


section .bss
    name            resb 32
    title           resb 32
    sideA           resq 1
    sideB           resq 1
    sideC           resq 1

section .text
triangle:

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

    ; Prompt the user's name
    mov             rax, 0
    mov             rdi, prompt_name
    call            printf

    ; Clear newline
    mov             rax, 0
    mov             rsi, prompt_name
    call            strlen
    mov             [prompt_name + rax - 1], byte 0

    ; Get user name
    mov             rax, 0
    mov             rdi, name
    mov             rsi, 32
    mov             rdx, [stdin]
    call            fgets

    ; Prompt user title
    mov             rax, 0
    mov             rdi, prompt_title
    call            printf

    ; Remove newline
    mov             rax, 0
    mov             rdi, prompt_title
    call            strlen
    mov             [prompt_title + rax - 1], byte 0

    ; Get user title
    mov             rax, 0
    mov             rdi, title
    mov             rsi, 32
    mov             rdx, [stdin]
    call            fgets

    ; Prompt two sides
    mov             rax, 0
    mov             rdi, prompt_sides
    call            printf

    ; Remove newline
    mov             rax, 0
    mov             rdi, prompt_sides
    call            strlen
    mov             [prompt_sides + rax - 1], byte 0

    ; Get both sides, utalizing scanf
    mov             rax, 2
    push            qword 1
    push            qword 1
    mov             rdi, sides
    mov             rsi, rsp
    mov             rdx, rsp
    add             rdx, 8
    call            scanf
    movsd           xmm11, qword [rsp]
    movsd           xmm10, qword [rsp + 8]
    pop             rax
    pop             rax

    ; Prompt angle
    mov             rax, 0
    mov             rdi, prompt_angle
    call            printf

    ; Remove newline
    mov             rax, 0
    mov             rdi, prompt_angle
    call            strlen
    mov             [prompt_angle + rax - 1], byte 0

    ; User enters angle
    mov             rax, 1
    push            qword 1
    push            qword 1
    mov             rdi, angle
    mov             rsi, rsp
    call            scanf
    movsd           xmm12, qword [rsp]
    pop             rax
    pop             rax

    ; Convert degeres to radians
    mov             rax, 3
    movsd           xmm0, qword [pi]
    movsd           xmm1, qword [oneEighty]
    divsd           xmm0, xmm1
    mulsd           xmm12, xmm0

    ; Before we do law of cos, get cos of given radians
    mov             rax, 1
    mov             rdi, cos_result
    movsd           xmm0, xmm12
    call            cos
    movsd           xmm12, xmm0

    ; Law of cos to find side 3
    ;mov             rax, 3



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

