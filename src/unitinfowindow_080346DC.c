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

//! FE8U = 0x080347D4
void UnitInfoWindow_PositionUnitName(struct UnitInfoWindowProc* proc) {
    if (GetStringTextLen(GetStringFromIndex(proc->unit->pCharacterData->nameTextId)) < 40) {
        proc->xUnitSprite = 4;
        proc->xNameText = 24;
    } else {
        proc->xUnitSprite = 0;
        proc->xNameText = 16;
    }

    if (proc->unit->pClassData->number == CLASS_DEMON_KING) {
        proc->xNameText += 6;
    } else if (proc->unit->pClassData->number == CLASS_MANAKETE_2) {
        proc->xUnitSprite -= 3;
        proc->xNameText += 3;
    }

    proc->xUnitSprite += 8;
    proc->xNameText -= 16;

    return;
}
