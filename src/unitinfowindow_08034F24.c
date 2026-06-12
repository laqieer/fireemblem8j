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
void DrawUnitHpText(struct Text* text, struct Unit* unit);
void DrawUnitStatusText(struct Text* text, struct Unit* unit);

//! FE8U = 0x0803501C
void RefreshUnitHpStatusInfoWindow(struct Unit* unit) {
    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    struct UnitInfoWindowProc* proc = UnitInfoWindow_DrawBase(0, unit, x, 0, 10, 2);

    DrawUnitHpText(proc->lines + 0, unit);
    PutText(proc->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3));

    DrawUnitStatusText(proc->lines + 1, unit);
    PutText(proc->lines + 1, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 5));

    return;
}
