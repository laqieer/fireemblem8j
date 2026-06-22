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
extern const u16 gUnitinfowindow_0[];
extern struct ProcCmd CONST_DATA gProcScr_UnitInfoWindow[];

void UnitInfoWindow_PositionUnitName(struct UnitInfoWindowProc* proc);

//! FE8U = 0x08034744
struct UnitInfoWindowProc* UnitInfoWindow_DrawBase(struct UnitInfoWindowProc* proc, struct Unit* unit, int x, int y, int width, int lines) {
    const u16 *src = gUnitinfowindow_0;

    if (proc == 0) {
        proc = Proc_Find(gProcScr_UnitInfoWindow);
        ClearBg0Bg1();
    }

    proc->unit = unit;
    proc->x = x;
    proc->y = y;

    DrawUiFrame2(x, y + 2, width, 2 + lines * 2, 3);

    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(x, y), gTSA_UnitInfoWindow, 0x1000);

    if (width > 10) {
        int ix, j;

        for (ix = x + 8, j = 0; ix < x + width - 1; ix++) {
            if (ix >= x + width - 3) {
                j++;
            }

            gBG1TilemapBuffer[TILEMAP_INDEX(ix, y+0)] = src[j];
            gBG1TilemapBuffer[TILEMAP_INDEX(ix, y+1)] = src[j + 4];
            gBG1TilemapBuffer[TILEMAP_INDEX(ix, y+2)] = src[j + 8];
        }
        gBG1TilemapBuffer[TILEMAP_INDEX(x+7, y+0)] = src[0];
        gBG1TilemapBuffer[TILEMAP_INDEX(x+7, y+1)] = src[4];
        gBG1TilemapBuffer[TILEMAP_INDEX(x+7, y+2)] = src[8];

        gBG1TilemapBuffer[TILEMAP_INDEX(x+width-1, y+0)] = src[3];
        gBG1TilemapBuffer[TILEMAP_INDEX(x+width-1, y+1)] = src[7];
        gBG1TilemapBuffer[TILEMAP_INDEX(x+width-1, y+2)] = src[11];
    }

    ClearText(&proc->name);

    UnitInfoWindow_PositionUnitName(proc);

    Text_SetCursor(&proc->name, proc->xNameText);
    Text_DrawString(&proc->name, GetStringFromIndex(unit->pCharacterData->nameTextId));

    PutText(&proc->name, gBG0TilemapBuffer + TILEMAP_INDEX(x+3, y+1));

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return proc;
}
