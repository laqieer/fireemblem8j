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

//! FE8U = 0x080BCFDC
int GetPlayChapterId(u32 chapterId)
{
    int i;

    if (CHAPTER_IS_TOWER(chapterId))
        chapterId = CHAPTER_T_01;
    else if (CHAPTER_IS_RUINS(chapterId))
        chapterId = CHAPTER_R_01;

    for (i = 0; i < NODE_MAX; i++)
        if (chapterId == WMLoc_GetChapterId(i))
            return i;

    return -1;
}
