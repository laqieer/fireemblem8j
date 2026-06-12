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
/* TU-private data externs bound at their JP addresses */
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

//! FE8U = 0x0803471C
void UnitInfoWindow_OnLoop(struct UnitInfoWindowProc* proc) {
    const u16 factionPalLut[] = {
        0xC,
        0xE,
        0xD,
    };

    int x = proc->x * 8 + proc->xUnitSprite;
    int y = (proc->y + 1) * 8;

    if (proc->unit->state & US_RESCUED) {
        if ((GetGameClock() % 32) < 20) {
            PutSprite(
                2,
                x + 9,
                y + 7,
                gObject_8x8,
                (factionPalLut[proc->unit->rescue >> 6] & 0xf) * 0x1000 + 3
            );
        }
    } else {
        PutUiUnitSprite(2, x, y, 0, proc->unit);
    }

    return;
}
