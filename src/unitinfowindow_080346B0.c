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
extern struct ProcCmd gProcScr_UnitInfoWindow[];

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

//! FE8U = 0x080347A8
struct UnitInfoWindowProc* NewUnitInfoWindow(ProcPtr parent) {
    struct UnitInfoWindowProc* proc = Proc_Start(gProcScr_UnitInfoWindow, parent);

    InitTextDb(&proc->name, 6);

    ResetIconGraphics();
    LoadIconPalettes(4);

    return proc;
}
