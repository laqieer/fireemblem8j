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

// TODO: In "worldmap_scrollmanage.c", the signature returns a ProcPtr instead of s8/bool
s8 GmScrollManageExist(void);

// TODO: Implicit declaration?
void GetWMCenteredCameraPosition(int, int, s16 *, s16 *);

extern u16 * Events_WM_Beginning[];
extern u16 * Events_WM_ChapterIntro[];

struct Proc8A3DD30
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u16 unk_34[0x10];
};

struct Proc8A3DD38
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u16 unk_34[0x10];
};

struct Proc8A3DD08
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ u8 unk_30;

    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
    /* 44 */ int unk_44;
};

// clang-format on

//! FE8U = 0x080B955C
int WorldMap_FindNextSelectableNode(ProcPtr proc, int unk)
{
    int idx;
    int i;
    int j;

    for (i = 0; i < 0x1d; i++)
    {
        if (GetWorldMapNodeIdByOrder(i) == unk)
        {
            break;
        }
    }

    for (j = 1; j < 0x1d; j++)
    {
        idx = GetWorldMapNodeIdByOrder((i + j) < 0x1d ? i + j : i + j - 0x1d);

        if (gGMData.nodes[idx].state & 1)
        {
            return idx;
        }
    }

    return -1;
}

//! FE8U = 0x080B95B0
int WorldMap_FindNearestNode(void)
{
    int i;

    int x = gGMData.ix >> 8;
    int y = gGMData.iy >> 8;

    int best = 0x7800;
    int idx = 0;

    for (i = 0; i < 0x1d; i++)
    {
        if (gGMData.nodes[i].state & 1)
        {
            int unk = GetWMPointDistance(x, y, i[gWMNodeData].x, i[gWMNodeData].y, 5);

            if (unk < best)
            {
                idx = i;
                best = unk;
            }
        }
    }

    return idx;
}

void WorldMap_JumpCursorToNode(ProcPtr proc, int nodeId)
{
    s16 x;
    s16 y;
    int unk;
    s16 xOut;
    s16 yOut;
    s16 xCamera;
    s16 yCamera;

    *&x = nodeId[gWMNodeData].x;
    *&y = nodeId[gWMNodeData].y;

    gGMData.ix = x << 8;
    gGMData.iy = y << 8;

    GetWMCenteredCameraPosition(x, y, &xOut, &yOut);

    *&xCamera = gGMData.xCamera;
    *&yCamera = gGMData.yCamera;

    unk = GetWMPointDistance(xCamera, yCamera, xOut, yOut, 4);
    if (unk < 0)
    {
        unk = unk + 0x1FF;
    }

    unk = (unk >> 9) + 6;
    if (unk > 10)
    {
        unk = 10;
    }

    StartGmScroll(-1, -1, xOut, yOut, unk, 0);

    gGMData.sprite_disp = 0;

    Proc_Goto(proc, 8);

    return;
}
