#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

inline void PutNumber2DigitExt(u16 *tm, int color, int number, int id_zero)
{
    PutSpecialChar(tm, color, number % 10 + id_zero);
    PutSpecialChar(tm - 1, color, (number / 10) % 10 + id_zero);
}
