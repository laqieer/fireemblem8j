#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch1Tut_GuideTerrainHeal.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

SECTION(".rodata.dat_EventScr_Ch1Tut_GuideTerrainHeal_ref") EventListScr EventScr_Ch1Tut_GuideTerrainHeal[] = {
    IGNORE_KEYS(0)
    CURSOR_FLASHING(7, 7)
    CURSOR_FLASHING(7, 2)
    CURSOR_FLASHING(2, 2)
    STAL(0x3C)
    CURE
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0x902)
    TEXTEND
    REMA
    ENUT(0xCE)
    DISABLEOPTIONS(0x200)
    EVBIT_T(7)
    ENDA
};

