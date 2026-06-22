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

int GetUnitInfoWindowX(struct Unit* unit, int width);
struct UnitInfoWindowProc* UnitInfoWindow_DrawBase(struct UnitInfoWindowProc* proc, struct Unit* unit, int x, int y, int width, int lines);

//! FE8U = 0x08034B44
void RefreshUnitInventoryInfoWindow(struct Unit* unit) {
    int i;
    int xPos;
    int itemCount;

    struct UnitInfoWindowProc* proc;

    itemCount = GetUnitItemCount(unit);

    xPos = GetUnitInfoWindowX(unit, 0xd);

    proc = UnitInfoWindow_DrawBase(0, unit, xPos, 0, 0xd, itemCount != 0 ? itemCount : 1);

    if (itemCount == 0) {
        int offset;

        ClearText(proc->lines + 0);
        Text_InsertDrawString(proc->lines + 0, 0, 1, GetStringFromIndex(0x533));

        offset = TILEMAP_INDEX(xPos+3, 0+3);
        PutText(proc->lines + 0, gBG0TilemapBuffer + offset);

        return;
    }

    for (i = 0; i < itemCount; i++) {
        int yPos = 0 + i * 2 + 3;

        int item = unit->items[i];

        ClearText(proc->lines + i);
        Text_DrawString(proc->lines + i, GetItemName(item));

        PutText(proc->lines + i, gBG0TilemapBuffer + TILEMAP_INDEX(xPos+3, yPos));
        PutNumberOrBlank(gBG0TilemapBuffer + TILEMAP_INDEX(xPos+11, yPos), 2, GetItemUses(item));
        DrawIcon(gBG0TilemapBuffer + TILEMAP_INDEX(xPos+1, yPos), GetItemIconId(item), 0x4000);
    }

    return;
}
