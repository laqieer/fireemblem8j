#include "global.h"
#include "bm.h"
#include "ap.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"

void BgAffinScaling(u8 bg, s16 sy, s16 sx)
{
    int syy = (s16)sy;
    int sxx = (s16)sx;
    struct BgAffineDstData * affin = NULL;
    if (bg == BG_2)
        affin = &gLCDControlBuffer.bg2affin;

    /**
     * y = y * (1 / sy)
     * x = x * (1 / sx)
     *
     * Both of which are 8.8 fixed point numbers:
     * a halfword with 8 integer bits and 8 fractional bits.
     * 
     * See tonc 10.4.1: https://www.coranac.com/tonc/text/affine.htm
     */

    affin->pb = (affin->pb * syy) >> 8;
    affin->pd = (affin->pd * syy) >> 8;
    affin->pa = (affin->pa * sxx) >> 8;
    affin->pc = (affin->pc * sxx) >> 8;
}
