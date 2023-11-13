#include "testnum.h"

int MYVAL = 444;

/// \doc a function to get the largest value of the three
int getLargest(int N1, int N2, int N3) {
    int Res;
    if (N1 >= N2) {
        if (N1 >= N3)
            Res = N1;
        else
            Res = N3;
    } else {
        if (N2 >= N3)
            Res = N2;
        else
            Res = N3;
    }
    return Res;
}
