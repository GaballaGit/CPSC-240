# /bin/bash
#****************************************************************************************************************************
# Program name: "Assignment-1-Triangles". A short description of the purpose of the program
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

rm *.o
rm *.out

echo "Assemble the source file triangle.asm"
nasm -f elf64 -o triangle.o triangle.asm

echo "Compile the source file geometry.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o -std=c2x -o geometry.o -c geometry.c

echo "Link the object modules to create an executable file"
gcc -m64 -Wall -fno-pie -no-pie -z noexecstack -std=c2x -o triangle.out geometry.o triangle.o -lm

echo "Execute the program"
chmod +x triangle.out
./triangle.out

echo "This bash script will now terminate."