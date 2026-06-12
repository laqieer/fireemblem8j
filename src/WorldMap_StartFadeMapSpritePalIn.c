#include "global.h"
#include "bmlib.h"
#include "bmsave.h"
#include "bmudisp.h"
#include "face.h"
#include "fontgrp.h"
#include "hardware.h"
#include "mu.h"
#include "scene.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "proc.h"
#include "event.h"
#include "chapterdata.h"
#include "ap.h"
#include "uiconfig.h"
#include "savemenu.h"
#include "sysutil.h"
#include "unitlistscreen.h"
#include "bmshop.h"
#include "worldmap.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WorldmapMain_2[];

struct Proc8A3DD38
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u16 unk_34[0x10];
};

// clang-format on

//! FE8U = 0x080BA288
void WorldMap_StartFadeMapSpritePalIn(int color)
{
    int i;

    struct WorldMapMainProc * parent = Proc_Find(ProcScr_WorldMapMain);
    struct Proc8A3DD38 * proc = Proc_Start(ProcScr_WorldmapMain_2, parent);

    proc->unk_30 = color & 0x1f;
    proc->unk_2c = 0;

    ApplyPalettes(gPal_MapSprite, 0x1C, 4);

    for (i = 1; i < 0x10; i++)
    {
        proc->unk_34[i - 1] = PAL_COLOR(color & 0x1f, i);
    }

    return;
}
