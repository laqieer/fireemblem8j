#include "global.h"
#include "classchg.h"
#include "proc.h"
#include "hardware.h"
#include "scene.h"
#include "classdisplayfont.h"
#include "constants/video-global.h"
#include "constants/classes.h"
#include "bmlib.h"
#include "ctc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmsave.h"
#include "bm.h"
#include "bmmind.h"
#include "bmio.h"
#include "bmmap.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmitem.h"
#include "prepscreen.h"

void EndBanimTerrain(void *);
void InitBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);

/* file-scope type definitions used by this run */


struct Struct_8A30978 {
    u8 a;
    u8 b; // Accessed indirectly, strangely
    u16 longBuffer[0x4B2];
};

/* prototypes for same-file helpers called by this run */
void RegisterTsaWithOffset(u16 *_dst, u16 *_src, u32 offset);

void ClassChgLoadUI(void)
{
    u8 *src = gUnkData_83;
    u32 off = GetBackgroundTileDataOffset(BG_2);
    Decompress(src, (void *)VRAM + 0x3000 + off);
    RegisterTsaWithOffset(gBG2TilemapBuffer, gUnkData_84, TILEREF(0x180, BGPAL_TEXT_DEFAULT) + 0x1000);
}
