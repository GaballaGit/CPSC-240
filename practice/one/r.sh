rm *.o
rm *.out

echo "Assemble the source file getnum.asm"
nasm -f elf64 -o getnum.o getnum.asm

echo "Compile the source file geometry.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o -std=c2x -o driver.o -c driver.c

echo "Link the object modules to create an executable file"
gcc -m64 -Wall -fno-pie -no-pie -z noexecstack -std=c2x -o getnum.out driver.o getnum.o -lm

echo "Execute the program"
chmod +x getnum.out
./getnum.out

echo "This bash script will now terminate."