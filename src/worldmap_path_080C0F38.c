#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "rng.h"
#include "soundwrapper.h"
#include "uimenu.h"
#include "uiutils.h"
#include "bmmenu.h"
#include "bmguide.h"

#include "constants/chapters.h"
#include "constants/worldmap.h"

#include "worldmap.h"
#include "constants/songs.h"

// clang-format off









































extern u8 gWorldmapSprite_2[];
extern u8 gWorldmapSprite_3[];
extern u8 gWorldmapSprite_4[];
extern u8 gWorldmapSprite_5[];
extern u8 gWorldmapSprite_6[];
extern u8 gWorldmapSprite_7[];
extern u8 gWorldmapSprite_8[];
extern u8 gWorldmapSprite_9[];
extern u8 gWorldmapSprite_10[];
extern u8 gWorldmapSprite_11[];
extern u8 gWorldmapSprite_12[];
extern u8 gWorldmapSprite_13[];
extern u8 gWorldmapSprite_14[];
extern u8 gWorldmapSprite_15[];
extern u8 gWorldmapSprite_16[];
extern u8 gWorldmapSprite_17[];
extern u8 gWorldmapSprite_18[];
extern u8 gWorldmapSprite_19[];
extern u8 gWorldmapSprite_20[];
extern u8 gWorldmapSprite_21[];
extern u8 gWorldmapSprite_22[];
extern u8 gWorldmapSprite_23[];
extern u8 gWorldmapSprite_24[];
extern u8 gWorldmapSprite_25[];
extern u8 gWorldmapSprite_26[];
extern u8 gWorldmapSprite_27[];
extern u8 gWorldmapSprite_28[];
extern u8 gWorldmapSprite_29[];
extern u8 gWorldmapSprite_30[];
extern u8 gWorldmapSprite_31[];
extern u8 gWorldmapSprite_32[];
extern u8 gWorldmapSprite_33[];

extern const struct GMapPathData gWMPathData[];

extern u16 gUnk_9[];

/* file-scope type definitions used by this run */


struct UnknownWorldMapStructA
{
    /* 00 */ STRUCT_PAD(0x00, 0x34);
    /* 34 */ struct UnknownWorldMapStructB * unk_34[2];
    /* 3C */ STRUCT_PAD(0x3c, 0x60);
    /* 60 */ u8 unk_60;
};

/* prototypes for same-file helpers called by this run */
void MapRoute_RenderOpenPaths(struct GmRouteProc * proc);
void MapRoute_BlitFullWindow(int a, int b, int bg);

//! FE8U = 0x080BC0F4
int MapRoute_PrepareTransition(struct GmRouteProc * proc)
{
    s16 x;
    s16 y;

    SetBlendAlpha(0, 0x10);

    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~(BLDCNT_TARGETA(1, 1, 1, 1, 1) | BLDCNT_TGT1_BD);
    *((u16 *) &gLCDControlBuffer.bldcnt) |= (1 << proc->bgB);
    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~(BLDCNT_TARGETB(1, 1, 1, 1, 1) | BLDCNT_TGT2_BD);
    *((u16 *) &gLCDControlBuffer.bldcnt) |= BLDCNT_TGT2_BG3;

    MapRoute_RenderOpenPaths(proc);
    MapRoute_BlitFullWindow(proc->x1, proc->y1, proc->bgB);

    *&x = ((struct GmScreenProc *)(proc->proc_parent))->x;
    *&y = ((struct GmScreenProc *)(proc->proc_parent))->y;

    BG_SetPosition(proc->bgB, x & 0x1FF, y & 0xff);

    return 0;
}
