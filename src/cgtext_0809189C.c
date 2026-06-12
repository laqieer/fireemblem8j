#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "scene.h"
#include "bmio.h"
#include "face.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "event.h"
#include "sysutil.h"
#include "cgtext.h"
#include "constants/songs.h"

extern EWRAM_DATA struct CgTextSt gCgTextSt;

// clang-format off

u16 CONST_DATA gSprite_Cgtext_0[] =
{
    6,
    OAM0_SHAPE_32x8 + OAM0_BLEND, OAM1_SIZE_32x8, OAM2_CHR(0),
    OAM0_SHAPE_32x8 + OAM0_BLEND, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x4),
    OAM0_SHAPE_32x8 + OAM0_Y(8) + OAM0_BLEND, OAM1_SIZE_32x8, OAM2_CHR(0x8),
    OAM0_SHAPE_32x8 + OAM0_Y(8) + OAM0_BLEND, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0xC),
    OAM0_SHAPE_32x8 + OAM0_Y(16) + OAM0_BLEND, OAM1_SIZE_32x8, OAM2_CHR(0x10),
    OAM0_SHAPE_32x8 + OAM0_Y(16) + OAM0_BLEND, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x14),
};

u16 CONST_DATA gSprite_Cgtext_1[] =
{
    2,
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16, OAM2_CHR(0),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x4),
};

/* prototypes for same-file helpers called by this run */
u32 GetCgTextFlags(void);

//! FE8U = 0x0808F5C8
void CgText_Display(struct CgTextMainProc * proc)
{
    int iy;

    int x = proc->x * 8;
    int y = proc->y * 8;
    int ix = 0;

    // FAKE
    int oam2Maybe = (int)-(GetCgTextFlags() & 0x100) >> 0x1f & 0x400;

    switch (GetCgTextFlags() & CG_TEXT_BG_MASK)
    {
        case CG_TEXT_BG(BG_0):
            x -= gLCDControlBuffer.bgoffset[BG_0].x;
            y -= gLCDControlBuffer.bgoffset[BG_0].y;
            break;

        case CG_TEXT_BG(BG_1):
            x -= gLCDControlBuffer.bgoffset[BG_1].x;
            y -= gLCDControlBuffer.bgoffset[BG_1].y;
            break;

        case CG_TEXT_BG(BG_2):
            x -= gLCDControlBuffer.bgoffset[BG_2].x;
            y -= gLCDControlBuffer.bgoffset[BG_2].y;
            break;

        case CG_TEXT_BG(BG_3):
            x -= gLCDControlBuffer.bgoffset[BG_3].x;
            y -= gLCDControlBuffer.bgoffset[BG_3].y;
            break;
    }

    if (GetCgTextFlags() & CG_TEXT_FLAG_16)
    {
        PutSpriteExt(0, OAM1_X(x - 16), OAM0_Y(y - 24), gSprite_Cgtext_0, OAM2_CHR(0x3C8) + OAM2_PAL(1));
        PutSpriteExt(0, OAM1_X(x - 8), OAM0_Y(y - 20), gSprite_Cgtext_1, OAM2_CHR(0x3C0) + OAM2_PAL(2));
    }

    for (iy = 0; iy < proc->boxHeight / 2; iy++)
    {
        for (ix = 0; ix < proc->boxWidth / 4; ix++)
        {
            PutSpriteExt(
                2, OAM1_X(x + ix * 0x20), OAM0_Y(y + iy * 0x10), gObject_32x16,
                proc->palId + ix * 4 + iy * 64 + oam2Maybe);
        }
    }

    if ((proc->boxWidth % 4) != 0)
    {
        int tmp = proc->boxWidth / 4 * 4;
        x += proc->boxWidth / 4 * 32;

        for (iy = 0; iy < proc->boxHeight / 2; iy++)
        {
            // FIXME: The shifts should be a cast to s8, but I can't get it to match that way
            for (ix = 0; ix < (((proc->boxWidth) - (proc->boxWidth / 4) * 4) << 0x18 >> 0x18); ix++)
            {
                PutSpriteExt(
                    2, OAM1_X(x + ix * 8), OAM0_Y(y + iy * 16), gObject_8x16,
                    proc->palId + tmp + ix + iy * 64 + oam2Maybe);
            }
        }
    }

    PutSpriteExt(
        2, OAM1_X(x + ix * 0x20), OAM0_Y(y + iy * 0x10), gObject_32x16, proc->palId + ix * 4 + iy * 64 + oam2Maybe);

    return;
}
