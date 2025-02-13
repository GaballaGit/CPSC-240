# /bin/bash
#****************************************************************************************************************************
# Program name: "Assignment-1-Triangles". This program is designed to calulate the third side of a triangle based on user input.
# Copyright (C) 2025 Mark Gaballa

# This file is part of the software program "Assignment-1-Triangles".

# "Assignment-1-Triangles" is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# "Assignment-1-Triangles" is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>. 

# Author information
#   Author name : Mark Gaballa
#   Author email: mgaballa@csu.fullerton.edu
#   Author section: 240-09
#   Author CWID : 885762294
#****************************************************************************************************************************

#----------------------------------------------------------------------------------------------------------------------------
#Author information
#  Author name : Mark Gaballa
#  Author email: mgaballa@csu.fullerton.edu
#  Author section: 240-09
#  Author CWID : 885762294

#  Class: 240-09 Section 09

#Program information
#  Program name: Triangles
#  Programming languages: C, X86-64, bash
#  Date program began: 2025-Feb-4
#  Date of last update: 2025-Feb-7
#  Files in this program: geometry.c, triangle.asm, r.sh.
#
#Purpose
#  This program calulates the third side of a triangle given the user's inputs.
#
#This file:
#  File name: r.sh
#  Language: BASH
#  Execute: chmod +x r.sh 
#           ./r.sh
#----------------------------------------------------------------------------------------------------------------------------

rm *.o
rm *.out

echo "Assemble the source file manager.asm"
nasm -f elf64 -o manager.o manager.asm

echo "Assemble the source file input_array.asm"
nasm -f elf64 -o input_array.o input_array.asm

echo "Compile the source file main.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o -std=c2x -o main.o -c main.c

echo "Link the object modules to create an executable file"
gcc -m64 -Wall -fno-pie -no-pie -z noexecstack -std=c2x -o manager.out main.o manager.o input_array.o -lm

echo "Execute the program"
chmod +x manager.out
./manager.out

echo "This bash script will now terminate."