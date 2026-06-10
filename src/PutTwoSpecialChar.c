#include "global.h"
#include "fontgrp.h"

void PutTwoSpecialChar(u16 *tm, int color, int id_a, int id_b)
{
    PutSpecialChar(tm++, color, id_a);
    PutSpecialChar(tm,   color, id_b);
}
