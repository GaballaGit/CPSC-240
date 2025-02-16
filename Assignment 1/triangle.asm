;****************************************************************************************************************************
; Program name: "Assignment-1-Triangles". This program is designed to calulate the third side of a triangle based on user input.
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
;****************************************************************************************************************************


;----------------------------------------------------------------------------------------------------------------------------
;Author information
;  Author name : Mark Gaballa
;  Author email: mgaballa@csu.fullerton.edu
;  Author section: 240-09
;  Author CWID : 885762294

;  Class: 240-09 Section 09

;Program information
;  Program name: Triangles
;  Programming languages: C, X86-64, bash
;  Date program began: 2025-Feb-4
;  Date of last update: 2025-Feb-7
;  Files in this program: geometry.c, triangle.asm, r.sh.
;
;Purpose
;  This program calulates the third side of a triangle given the user's inputs.
;
;This file:
;  File name: triangle.asm
;  Language: X86-64
;  Assemble: nasm -f elf64 -o triangle.o triangle.asm
;  Link: gcc -m64 -Wall -fno-pie -no-pie -z noexecstack -std=c2x -o triangle.out geometry.o triangle.o -lm
;----------------------------------------------------------------------------------------------------------------------------

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
    third_side      db "The length of the third side is %lf units.", 10, 0
    goodbye         db "Please enjoy your triangles %s %s.", 10, 0
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

    ;Remove newline
    mov             rax, 0
    mov             rdi,  name
    call            strlen
    mov             [name + rax - 1], byte 0

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

    ;Remove newline
    mov             rax, 0
    mov             rdi,  title
    call            strlen
    mov             [title + rax - 1], byte 0

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
    mov             rax, 3

    ; The formula is sqrt(a^2 + b^2 - 2abcos(theta))

    ; Calculate 2 * a * b * cos(theta)
    mulsd           xmm12, xmm11
    mulsd           xmm12, xmm10
    mulsd           xmm12, [two]

    ; Raise sides a and b to the second power
    mulsd           xmm11, xmm11
    mulsd           xmm10, xmm10

    ; add a^2 and b^2
    addsd           xmm10, xmm11

    ; Subtract with 2 * a * b * cos(theta)
    subsd           xmm10, xmm12

    ; Finish off with sqrt
    sqrtsd          xmm15, xmm10

    ; Print third side
    mov             rax, 1
    mov             rdi, third_side
    movsd           xmm0, xmm15
    call            printf

    ; Print goodbye
    mov             rax, 0
    mov             rdi, goodbye
    mov             rsi, title
    mov             rdx, name
    call            printf

    ; Remove newline
    mov             rax, 0
    mov             rdi, goodbye
    call            strlen
    mov             [goodbye + rax - 1], byte 0


    ; Move third side to xmm0 for return value
    movsd             xmm0, xmm15

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

