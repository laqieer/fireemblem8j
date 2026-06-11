#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "icon.h"
#include "face.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmcontainer.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmind.h"
#include "bmio.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "constants/faces.h"

#include "prepscreen.h"
#include "constants/songs.h"



//! FE8U = 0x0809D244
void PrepItemSupply_PutPromptBoxSprites(void)
{
    int i;
    for (i = 0; i < 4; i++)
        PutSpriteExt(4, 48 + i * 32, 16, gObject_32x16, 0xDFC0 + i * 4);
}

//! FE8U = 0x0809D278
void PrepItemSupply_StartPromptText(int idx, ProcPtr proc)
{
    StartParallelWorker(PrepItemSupply_PutPromptBoxSprites, proc);

    NewSysboxText(
        0x7800,
        0xd,
        GetStringFromIndexInBuffer(gSupplyTextIndexLookup[idx], gpPrepItemSupplyStringBuffer),
        1,
        2,
        3,
        proc
    );

    return;
}

//! FE8U = 0x0809D2C4
void StoreConvoyWeaponIconGraphics(int vramOffset, int pal) {
    ApplyPalette(gUnkData_64, pal);
    Decompress(gUnkData_62, (void*)(VRAM + vramOffset));
    Decompress(gUnkData_63, (void*)(0x6000200 + vramOffset));
    return;
}
