#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch13b_EndingScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 frontier_df3_unitdef_b_033_9191E0[];
extern const u8 EventScr_SetBackground[];

SECTION(".rodata.dat_EventScr_Ch13b_EndingScene_ref") EventListScr EventScr_Ch13b_EndingScene[] = {
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    CAMERA2(0xE, 0xD)
    EvtSetLoadUnitNoREDA
    LOAD2(1, frontier_df3_unitdef_b_033_9191E0 + 0x7AC)
    ENUN
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_033_9191E0 + 0x7AC)
    ENUN
    CURSOR_CHAR(0x1E)
    STAL(0x3C)
    CURE
    MUSC(0x32)
    SVAL(EVT_SLOT_2, 0x2C)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xAB3)
    TEXTEND
    REMA
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    ENUT(0x75)
    MNCH(0x1B)
    ENDA
};

