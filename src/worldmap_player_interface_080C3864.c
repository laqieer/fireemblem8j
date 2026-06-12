#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "face.h"
#include "bmlib.h"
#include "uiutils.h"

#include "worldmap.h"

struct UnkParentProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x48);
    /* 48 */ void * unk_48;
};

struct GMapPIProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Text text[2];
    /* 3C */ STRUCT_PAD(0x3C, 0x40);
    /* 40 */ u16 * unk_40;
    /* 44 */ u16 unk_44;
    /* 46 */ STRUCT_PAD(0x46, 0x4C);
    /* 4C */ s8 xPrev;
    /* 4D */ s8 yPrev;
    /* 4E */ s8 xNew;
    /* 4F */ s8 yNew;
    /* 50 */ s8 unk_50;
    /* 51 */ STRUCT_PAD(0x51, 0x54);
    /* 54 */ u8 unk_54;
    /* 55 */ u8 unk_55;
    /* 56 */ u8 unk_56;
    /* 57 */ u8 unk_57;
    /* 58 */ int showHideCnt;
    /* 5C */ u16 nodeId;
    /* 5E */ u8 interfaceKind;
    /* 5F */ u8 pid;
    /* 60 */ u8 jid;
};

struct Unknown8A3E448
{
    /* 00 */ s8 unk_00;
    /* 01 */ s8 unk_01;
    /* 02 */ s8 unk_02;
    /* 03 */ s8 unk_03;
};



// clang-format off









// clang-format on

extern u16 gUnk_16[];
extern u16 gUnk_17[];
extern u16 gUnk_18[];
extern u16 gUnk_19[];
extern u16 gUnk_20[];
extern u16 gUnk_21[];
extern u16 gUnk_22[];
extern u16 gUnk_24[];
extern u16 gUnk_25[];

// forward declarations
void RedrawGMapPIForNode(struct GMapPIProc *, int);

extern u16 gWorldmapMinimap_8[];
extern u16 gWorldmapMinimap_9[];
extern u16 gWorldmapMinimap_10[];
extern u16 gWorldmapMinimap_11[];

//! FE8U = 0x080BEA78
void PutGMapPILevelNumber(struct GMapPIProc * proc)
{
    int level;

    if (proc->pid != 0)
    {
        level = GetUnitFromCharId(proc->pid)->level;
    }
    else if (proc->jid != 0)
    {
        level = 0;
    }

    *(gUnk_22 + TILEMAP_INDEX(0, 0)) = 0x5233;
    *(gUnk_22 + TILEMAP_INDEX(0, 1)) = 0x5253;
    *(gUnk_22 + TILEMAP_INDEX(1, 0)) = 0x5234;
    *(gUnk_22 + TILEMAP_INDEX(1, 1)) = 0x5254;

    if (level == 0)
    {
        *(gUnk_22 + TILEMAP_INDEX(2, 0)) = 0x5234 + 0xb;
        *(gUnk_22 + TILEMAP_INDEX(2, 1)) = 0x5234 + 0x2b;
        *(gUnk_22 + TILEMAP_INDEX(3, 0)) = 0x5234 + 0xb;
        *(gUnk_22 + TILEMAP_INDEX(3, 1)) = 0x5234 + 0x2b;
    }
    else
    {
        int ones;
        if (level > 9)
        {
            int tens = level / 10;
            *(gUnk_22 + TILEMAP_INDEX(2, 0)) = tens + 0x5235;
            *(gUnk_22 + TILEMAP_INDEX(2, 1)) = tens + 0x5255;
        }

        ones = level % 10;
        *(gUnk_22 + TILEMAP_INDEX(3, 0)) = ones + 0x5235;
        *(gUnk_22 + TILEMAP_INDEX(3, 1)) = ones + 0x5255;
    }

    return;
}
