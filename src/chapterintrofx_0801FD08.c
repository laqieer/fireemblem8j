#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmfx.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmlib.h"
#include "sysutil.h"
#include "worldmap.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_ChapterIntro_Bg1And3Scroll[];

//! FE8U = 0x08020010
int ChapterIntro_0(ProcPtr proc, void * vramDst, int palId)
{
    int refPal0;
    int refPal1;
    int i;

    u16 * buffer = gBG1TilemapBuffer;

    if (vramDst == 0)
    {
        vramDst = BG_CHR_ADDR(0x0);
    }

    ApplyPalettes(Pal_CommGameBgScreenInShop, palId, 2);
    Decompress(Img_CommGameBgScreen, vramDst);

    refPal0 = TILEREF(0, palId & 15);
    refPal1 = TILEREF(0, (palId + 1) & 15);

    for (i = 0; i < 224; i++)
    {
        *buffer++ = i + refPal0;
    }

    for (; i < 416; i++)
    {
        *buffer++ = i + refPal1;
    }

    for (; i < 640; i++)
    {
        *buffer++ = i + refPal0;
    }

    Proc_Start(ProcScr_ChapterIntro_Bg1And3Scroll, proc);

    // return; // BUG?
}
