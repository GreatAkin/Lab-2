#include <stdio.h>
#include <string.h>

extern long hamming_distance(char *s1, char *s2);

int main()
{
    char str1[256];
    char str2[256];

    printf("Enter first string: ");
    fgets(str1, 256, stdin);

    printf("Enter second string: ");
    fgets(str2, 256, stdin);

    // Remove newline character if present
    str1[strcspn(str1, "\n")] = 0;
    str2[strcspn(str2, "\n")] = 0;

    long result = hamming_distance(str1, str2);

    printf("Hamming Distance = %ld\n", result);

    return 0;
}