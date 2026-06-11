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

ProcPtr StartSpriteAnimfx(const u8 * gfx, const u16 * pal, const void * apDef, int x, int y, int animId, int palId, int palCount, u16 chr, int aObjNode)
{
    if (gfx != NULL)
        Decompress(gfx, (void *)(0x06010000 + OAM2_CHR(chr) * CHR_SIZE));

    if (pal != NULL)
    {
        ApplyPalettes(pal, (palId + 0x10), palCount);
    }

    return APProc_Create(apDef, x, y, OAM2_PAL(palId) + chr, animId, aObjNode);
}

int GetBgXOffset(int bg)
{
    switch (bg) {
    case BG_0:
        return gLCDControlBuffer.bgoffset[BG_0].x;

    case BG_1:
        return gLCDControlBuffer.bgoffset[BG_1].x;

    case BG_2:
        return gLCDControlBuffer.bgoffset[BG_2].x;

    case BG_3:
        return gLCDControlBuffer.bgoffset[BG_3].x;
    }
}

int GetBgYOffset(int bg)
{
    switch (bg) {
    case BG_0:
        return gLCDControlBuffer.bgoffset[BG_0].y;

    case BG_1:
        return gLCDControlBuffer.bgoffset[BG_1].y;

    case BG_2:
        return gLCDControlBuffer.bgoffset[BG_2].y;

    case BG_3:
        return gLCDControlBuffer.bgoffset[BG_3].y;
    }
}
