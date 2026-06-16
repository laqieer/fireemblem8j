#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

void PutNumberExt(u16 *tm, int color, int number, int id_zero)
{
    if (number == 0) {
        PutSpecialChar(tm, color, id_zero);
        return;
    }

    while (number != 0) {
        PutSpecialChar(tm, color, number % 10 + id_zero);
        number /= 10;

        tm--;
    }
}
