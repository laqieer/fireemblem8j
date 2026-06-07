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

//! FE8U = 0x080BE594
int GetGMapPIQuadrantFromOffsets(int a, int b)
{
    if (a < 0)
    {
        if (b < 0)
        {
            return 0;
        }
        else
        {
            return 1;
        }
    }
    else if (b < 0)
    {
        return 2;
    }

    return 3;
}

//! FE8U = 0x080BE5B4
void ApplyGMapPIMinimapUnitPalette(int faction, int palId)
{
    u16 * src;

    switch (faction)
    {
        case FACTION_BLUE:
            src = gWorldmapMinimap_8;
            break;

        case FACTION_RED:
            src = gWorldmapMinimap_9;
            break;

        case FACTION_GREEN:
            src = gWorldmapMinimap_10;
            break;

        default:
            src = gWorldmapMinimap_11;
            break;
    }

    ApplyPalette(src, palId);

    return;
}

//! FE8U = 0x080BE5F8
void PutGMapPILevelDigits(u16 * src, struct Unit * unit)
{
    int level;

    src[0] = 0x180;
    src[1] = 0x181;

    level = unit->level;

    if (level > 9)
    {
        src[2] = (level / 10) + 0x188;
    }

    src[3] = (level % 10) + 0x188;

    return;
}

//! FE8U = 0x080BE638
void UpdateGMapPILevelDigits(struct GMapPIProc * proc, struct Unit * unit)
{
    if ((proc->unk_44 & 0x3f) == 0)
    {
        PutGMapPILevelDigits(proc->unk_40, unit);
        BG_EnableSyncByMask(BG0_SYNC_BIT);
    }

    return;
}
