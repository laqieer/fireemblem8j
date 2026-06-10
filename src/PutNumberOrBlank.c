#include "global.h"
#include "fontgrp.h"

void PutNumberOrBlank(u16 *tm, int color, int number)
{
    if (number < 0 || number == 0xFF)
        PutTwoSpecialChar(tm - 1, color, TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);
    else
        PutNumber(tm, color, number);
}
