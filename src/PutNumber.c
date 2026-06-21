#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

extern struct Font gDefaultFont;
void PutNumberExt(u16 *tm, int color, int number, int id_zero);

//! FE8U = 0x08004A90
void PutNumber(u16 *tm, int color, int number)
{
    PutNumberExt(tm, color, number, TEXT_SPECIAL_BIGNUM_0);
}
