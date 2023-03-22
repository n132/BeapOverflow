#include <stdio.h>
char buf[0x10] = {};
int main()
{
    char * b = malloc(0);
    void * a = buf;
    size_t x = ((size_t)a>>12)+1;
    size_t y = (size_t)b >>12;
    size_t off = y-x;
    printf("%d\n",off);

}
