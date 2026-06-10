#include "global.h"
#include "fontgrp.h"

void PutNumberBonus(int number, u16 *tm)
{
    if (number == 0)
        return;
    PutSpecialChar(tm, TEXT_COLOR_SYSTEM_GREEN, TEXT_SPECIAL_PLUS);
    PutNumberSmall(tm + ((number >= 10) ? 2 : 1), TEXT_COLOR_SYSTEM_GREEN, number);
}
