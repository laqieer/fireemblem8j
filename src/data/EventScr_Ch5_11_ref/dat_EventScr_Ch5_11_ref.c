#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch5_11.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

SECTION(".rodata.dat_EventScr_Ch5_11_ref") EventListScr EventScr_Ch5_11[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0x995)
    TEXTEND
    REMA
    CAMERA(0xC, 6)
    CURSOR_FLASHING(0xC, 6)
    STAL(0x3C)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0x996)
    TEXTEND
    REMA
    ENUT(0xEA)
    CURE
    ENDA
};

