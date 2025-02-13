#include <stdio.h>

extern void inputArray();


int main()
{
    printf("Welcome to Arrays of floating point numbers.\nBrought to you by Mark Gaballa\n");

    inputArray();
    long arr = 0.0000000;

    printf("Main received %ld, and will keep it for future use.\nMain will return 0 to the operating system.   Bye.", arr);

    return 0;
}