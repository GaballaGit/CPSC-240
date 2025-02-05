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



section .bss
    name            resb 32
    title           resb 32

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

    ; Clear new line
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

    ; Remove new line
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

