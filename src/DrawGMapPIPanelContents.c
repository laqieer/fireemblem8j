#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "face.h"
#include "bmlib.h"
#include "uiutils.h"

#include "worldmap.h"

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

extern u16 gUnk_18[];
extern u16 gUnk_19[];
extern u16 gUnk_25[];

extern u8 gWorldmapMinimap_12[];
extern u8 gWorldmapMinimap_13[];

void PutGMapPILevelNumber(struct GMapPIProc * proc);
void PutGMapPIFace(struct GMapPIProc * proc);

//! FE8U = 0x080C3918
void DrawGMapPIPanelContents(struct GMapPIProc * proc)
{
    switch (proc->interfaceKind)
    {
        case 0:
            TileMap_FillRect(gUnk_25, 12, 4, 0);
            TileMap_FillRect(gUnk_18, 12, 2, 0);

            CallARM_FillTileRect(gUnk_25, gWorldmapMinimap_12, 0x8000);

            break;

        case 1:
            TileMap_FillRect(gUnk_25, 12, 9, 0);
            TileMap_FillRect(gUnk_18, 12, 7, 0);

            CallARM_FillTileRect(gUnk_25, gWorldmapMinimap_13, 0x8000);

            PutText(&proc->text[1], gUnk_18 + 0x64);

            PutGMapPILevelNumber(proc);
            PutGMapPIFace(proc);

            break;
    }

    PutText(&proc->text[0], gUnk_19);

    return;
}
