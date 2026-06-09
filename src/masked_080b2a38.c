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

void BgAffinScalingHighPrecision(u8 bg, int sy, int sx)
{
    struct BgAffineDstData * affin = NULL;
    if (bg == BG_2)
        affin = &gLCDControlBuffer.bg2affin;

    affin->pb = (affin->pb * sy) >> 0x10;
    affin->pd = (affin->pd * sy) >> 0x10;
    affin->pa = (affin->pa * sx) >> 0x10;
    affin->pc = (affin->pc * sx) >> 0x10;
}

void BgAffinAnchoringHighPrecision(u8 bg, int q0_x, int q0_y, int p0_x, int p0_y)
{
    struct BgAffineDstData * affin = NULL;
    if (bg == BG_2)
        affin = &gLCDControlBuffer.bg2affin;

    affin->dx = ((affin->pa * (-q0_x) + affin->pb * (-q0_y)) >> 8) + p0_x;
    affin->dy = ((affin->pc * (-q0_x) + affin->pd * (-q0_y)) >> 8) + p0_y;
}
