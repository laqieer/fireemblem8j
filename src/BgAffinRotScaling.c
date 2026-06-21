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

//! FE8U = 0x080B289C
void BgAffinRotScaling(u8 bg, s16 angle, s16 x_center, s16 y_center, s16 sx, s16 sy)
{
    struct BgAffineSrcData data;
    struct BgAffineDstData * dst;

    int iAngle = angle;
    int iXCenter = x_center;
    int iYCenter = y_center;
    int iSx = sx;
    int iSy = sy;

    if (iSx <= 4)
        iSx = 4;

    if (iSy <= 4)
        iSy = 4;

    data.texX = iXCenter * 0x100;
    data.texY = iYCenter * 0x100;
    data.scrX = 0;
    data.scrY = 0;
    data.sx = 0x10000 / iSx;
    data.sy = 0x10000 / iSy;
    data.alpha = iAngle * 0x10;

    dst = &gLCDControlBuffer.bg3affin;
    if (bg == BG_2)
        dst = &gLCDControlBuffer.bg2affin;

    BgAffineSet(&data, dst, 1);
}
