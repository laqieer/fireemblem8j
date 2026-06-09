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
void RefreshGmNodeLinks(struct GMapData * param_1);

//! FE8U = 0x080BC8EC
bool RemoveGmPath(struct GMapData * pGMapData, struct OpenPaths * pPaths, int idx)
{
    int i;

    if (pPaths->openPathsLength <= 0)
    {
        return true;
    }

    if (idx < 0)
    {
        pPaths->openPathsLength--;
        pPaths->openPaths[pPaths->openPathsLength] = 0xff;
        RefreshGmNodeLinks(pGMapData);
        return false;
    }

    for (i = 0; i < pPaths->openPathsLength; i++)
    {
        int j;

        if (pPaths->openPaths[i] != idx)
        {
            continue;
        }

        for (j = i; j < pPaths->openPathsLength - 1; j++)
        {
            pPaths->openPaths[j] = pPaths->openPaths[j + 1];
        }

        pPaths->openPathsLength--;
        RefreshGmNodeLinks(pGMapData);
        return false;
    }

    return true;
}
