#include <stdio.h>

extern void swap(double* a, double* b);

void bubbleSort(double a[], int size)
{
    //printf("NOW SORTING WITH %d\n", size);
    for (int i = 0; i < size - 1; i++)
    {
        //printf("%d\n",i);
        for (int j = 0; j < size - i  - 1; j++)
        {
            //printf("%d", j);
            if (a[j] > a[j+1])
            {
                 //printf("Address of j: %p\n", &a[j]);
                 //printf("Address of j+1: %p\n", &a[j+1]); 

                swap(&a[j], &a[j+1]);
                //printf("After: ", a[j], " | ", a[j+1]);

            }
        }
    }
    
}