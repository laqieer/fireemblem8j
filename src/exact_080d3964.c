#include "global.h"

#include "eventinfo.h"
#include "bmshop.h"
#include "fontgrp.h"
#include "ctc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmlib.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bm.h"

#include "bmguide.h"
#include "constants/songs.h"



// clang-format off











// clang-format on

extern u8 Tsa_UnkData_5[]; // tsa
extern u8 Img_UnkData_2[]; // gfx
extern u8 Img_UnkData_3[]; // gfx
extern u16 Pal_UnkData_3[]; // pal

// TODO: Implicit declarations
void UpdateMenuScrollBarConfig(int, int, int, int);
ProcPtr StartMenuScrollBarExt(ProcPtr, int, int, int, int);
void UnlockMenuScrollBar(void);
void LockMenuScrollBar(void);
void EndMenuScrollBar(void);

//! FE8U = 0x080CEC68
void SetGuidePanelTilemapPalette(u16 off)
{
    int ix;
    int iy;

    int yBase = 160;

    for (iy = 0; iy < 12; iy++)
    {
        for (ix = 0; ix < 9; ix++)
        {
            gBG2TilemapBuffer[yBase + ix] = off + (gBG2TilemapBuffer[yBase + ix] & 0xFFF);
        }

        yBase += 32;
    }

    return;
}
