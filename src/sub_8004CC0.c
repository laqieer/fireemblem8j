#include "global.h"
#include "fontgrp.h"
void PutNumber2DigitSmall(u16 * tm, int color, int number) {
    PutSpecialChar(tm, color, number % 10 + 0xa);
    PutSpecialChar(tm - 1, color, number / 10 % 10 + 0xa);
}
