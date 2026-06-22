#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

extern inline void PutNumber2DigitExt(u16 *tm, int color, int number, int id_zero)
{
    PutSpecialChar(tm, color, number % 10 + id_zero);
    PutSpecialChar(tm - 1, color, (number / 10) % 10 + id_zero);
}

void PutTime(u16 * tm, int color, int time, bool always_display_punctuation)
{
    u16 hours, minutes, seconds;
    int punct = always_display_punctuation;
    s8 hs = FormatTime(time, &hours, &minutes, &seconds);
    int hsi = hs;

    PutNumber(tm + 2, color, hours);
    PutNumber2DigitExt(tm + 5, color, minutes, TEXT_SPECIAL_BIGNUM_0);
    PutNumber2DigitExt(tm + 8, color, seconds, TEXT_SPECIAL_SMALLNUM_0);

    if (hsi == FALSE || punct)
    {
        PutSpecialChar(tm + 3, color, TEXT_SPECIAL_COLON);
        PutSpecialChar(tm + 6, color, TEXT_SPECIAL_COLON);
    }
    else
    {
        PutSpecialChar(tm + 3, color, TEXT_SPECIAL_NOTHING);
        PutSpecialChar(tm + 6, color, TEXT_SPECIAL_NOTHING);
    }
}
