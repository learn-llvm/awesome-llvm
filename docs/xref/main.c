#include "testnum.h"

extern int MYVAL;

// int getLargest(int N1, int N2, int N3);

int main(void) {
    int N1 = 1;
    int N2 = MYVAL;
    int N3 = 5;
    int Res = getLargest(N1, N2, N3);
    return Res;
}
