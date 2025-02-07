/*
****************************************************************************************************************************
 Program name: "Assignment-1-Triangles". This program is designed to calulate the third side of a triangle based on user input.
 Copyright (C) 2025 Mark Gaballa

 This file is part of the software program "Assignment-1-Triangles".

 "Assignment-1-Triangles" is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 "Assignment-1-Triangles" is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>. 

 Author information
   Author name : Mark Gaballa
   Author email: mgaballa@csu.fullerton.edu
   Author section: 240-09
   Author CWID : 885762294
****************************************************************************************************************************

----------------------------------------------------------------------------------------------------------------------------
Author information
  Author name : Mark Gaballa
  Author email: mgaballa@csu.fullerton.edu
  Author section: 240-09
  Author CWID : 885762294

  Class: 240-09 Section 09

Program information
  Program name: Triangles
  Programming languages: C, X86-64, bash
  Date program began: 2025-Feb-4
  Date of last update: 2025-Feb-7
  Files in this program: geometry.c, triangle.asm, r.sh.

Purpose
  This program calulates the third side of a triangle given the user's inputs.

This file:
  File name: geometry.c
  Language: C
  Compile: gcc -c -m64 -Wall -fno-pie -no-pie -o -std=c2x -o geometry.o -c geometry.c
----------------------------------------------------------------------------------------------------------------------------
*/

#include <stdio.h>

extern double triangle();

int main()
{
    printf("Welcome to the Triangle program maintained by Mark Gaballa.\n");

    printf("If errors are discovered please report them to Mark Gaballa at mgaballa@csu.fullerton.edu for a quick fix. At Columbia Software the customer comes first.\n");

    double val = triangle();

    printf("The main function received this number: %f and plans to keep it until needed.\n", val);

    printf("An integer zero will be returned to the operating system. Bye.");

    return 0;
}
