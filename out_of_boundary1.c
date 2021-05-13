// Dreamhack Source
#include <stdio.h>
int main(void) {
    int win;
    int idx;
    int buf[10];
    printf("win : %d\n");
    printf("Which index? ");
    scanf("%d", &idx);
    printf("Value: ");
    scanf("%d", &buf[idx]);
    printf("idx: %d, value: %d win : %d\n", idx, buf[idx], win);
    if(win == 31337){
        printf("Theori{-----------redacted---------}");
    }
}