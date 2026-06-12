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

//! FE8U = 0x08034ADC
void PutUnitAidIconForTextAt(struct Unit* unit, int x, int y) {
    DrawIcon(
        gBG0TilemapBuffer + TILEMAP_INDEX(x + 4, y),
        GetUnitAidIconId(UNIT_CATTRIBUTES(unit)),
        0x5000
    );
    return;
}
