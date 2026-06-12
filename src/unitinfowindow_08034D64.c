#include "global.h"

#include "bmunit.h"
#include "fontgrp.h"
#include "bmudisp.h"
#include "ctc.h"
#include "icon.h"
#include "uiutils.h"
#include "hardware.h"
#include "bmitem.h"

#include "unitinfowindow.h"

#include "constants/classes.h"

enum { LINES_MAX = 5 };

struct UnitInfoWindowProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* unit;

    /* 30 */ struct Text name;
    /* 38 */ struct Text lines[LINES_MAX];

    /* 60 */ u8 x;
    /* 61 */ u8 y;
    /* 62 */ u8 xUnitSprite;
    /* 63 */ u8 xNameText;
};

extern u16 gTSA_UnitInfoWindow[];

void UnitInfoWindow_OnLoop(struct UnitInfoWindowProc* proc);

extern struct ProcCmd CONST_DATA gProcScr_UnitInfoWindow[];

extern struct UnitInfoWindowProc* EWRAM_DATA sRescueUnitInfoWindows[2];

/* prototypes for same-file helpers called by this run */
struct UnitInfoWindowProc* UnitInfoWindow_DrawBase(struct UnitInfoWindowProc* proc, struct Unit* unit, int x, int y, int width, int lines);
int GetUnitInfoWindowX(struct Unit* unit, int width);

//! FE8U = 0x08034E5C
void RefreshHammerneUnitInfoWindow(struct Unit* unit) {
    int i;
    int color;
    int xPos;
    int itemCount;
    struct UnitInfoWindowProc* proc;

    itemCount = GetUnitItemCount(unit);

    xPos = GetUnitInfoWindowX(unit, 0x10);

    proc = UnitInfoWindow_DrawBase(0, unit, xPos, 0, 0x10, itemCount);

    for (i = 0; i < itemCount; i++) {
        int yPos = 0 + i * 2 + 3;

        int item = unit->items[i];

        color = IsItemHammernable(item) ? 0 : 1;

        ClearText(proc->lines + i);

        Text_SetColor(proc->lines + i, color);
        Text_DrawString(proc->lines + i, GetItemName(item));

        PutText(proc->lines + i, gBG0TilemapBuffer + TILEMAP_INDEX(xPos + 3, yPos));
        PutSpecialChar(gBG0TilemapBuffer + TILEMAP_INDEX(xPos + 12, yPos), color, TEXT_SPECIAL_SLASH);

        color = IsItemHammernable(item) ? 2 : 1;

        PutNumberOrBlank(gBG0TilemapBuffer + TILEMAP_INDEX(xPos + 11, yPos), color, GetItemUses(item));
        PutNumberOrBlank(gBG0TilemapBuffer + TILEMAP_INDEX(xPos + 14, yPos), color, GetItemMaxUses(item));

        DrawIcon(gBG0TilemapBuffer + TILEMAP_INDEX(xPos + 1, yPos), GetItemIconId(item), 0x4000);
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}
