#include "global.h"
#include "fontgrp.h"
void PutNumber2Digit(u16 * tm, int color, int number) {
    PutSpecialChar(tm, color, number % 10);
    PutSpecialChar(tm - 1, color, number / 10 % 10);
}
