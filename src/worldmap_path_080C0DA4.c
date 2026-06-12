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
void MapRoute_BlitScrollEdge(int a1, int r8, int r4, int r9, int sp20);

//! FE8U = 0x080BBF60
void MapRoute_Loop(struct GmRouteProc * proc)
{
    s16 x;
    s16 y;

    if (!(proc->flags & 4))
    {
        return;
    }

    proc->x2 = proc->x1;
    proc->y2 = proc->y1;

    *&x = ((struct GmScreenProc *)(proc->proc_parent))->x;
    *&y = ((struct GmScreenProc *)(proc->proc_parent))->y;

    proc->x1 = x / 8;
    proc->y1 = y / 8;

    if (proc->x1 != proc->x2 || proc->y1 != proc->y2)
    {
        if ((ABS(proc->x1 - proc->x2) >= 2) || (ABS(proc->y1 - proc->y2) >= 2))
        {
            MapRoute_BlitFullWindow(proc->x1, proc->y1, proc->bgA);
            BG_EnableSync(proc->bgA);
        }
        else
        {
            MapRoute_BlitScrollEdge(proc->x1, proc->y1, proc->x2, proc->y2, proc->bgA);
            BG_EnableSync(proc->bgA);
        }
    }

    if (proc->flags & 2)
    {
        MapRoute_RenderOpenPaths(proc);
        proc->flags &= ~2;
    }

    if (proc->flags & 1)
    {
        MapRoute_BlitFullWindow(proc->x1, proc->y1, proc->bgA);
        BG_EnableSync(proc->bgA);
        proc->flags &= ~1;
    }

    BG_SetPosition(proc->bgA, x & 0x1FF, y & 0xff);

    return;
}
