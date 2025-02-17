
#include <stdio.h>

extern double manager();


int main()
{
    printf("Welcome to Arrays of floating point numbers.\nBrought to you by Mark Gaballa\n");

    double sum = manager();


    printf("Main received %f, and will keep it for future use.\nMain will return 0 to the operating system.   Bye.\n", sum);

    return 0;
}