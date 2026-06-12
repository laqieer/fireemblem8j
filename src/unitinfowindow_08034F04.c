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
struct UnitInfoWindowProc* NewUnitInfoWindow(ProcPtr parent);

//! FE8U = 0x08034FFC
void StartUnitHpStatusInfoWindow(ProcPtr parent) {
    struct UnitInfoWindowProc* proc = NewUnitInfoWindow(parent);

    InitTextDb(proc->lines + 0, 8);
    InitTextDb(proc->lines + 1, 8);

    return;
}
