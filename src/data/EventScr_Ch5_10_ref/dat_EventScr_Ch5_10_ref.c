#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch5_10.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

SECTION(".rodata.dat_EventScr_Ch5_10_ref") EventListScr EventScr_Ch5_10[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0x993)
    TEXTEND
    REMA
    CAMERA(2, 1)
    CURSOR_FLASHING(2, 1)
    STAL(0x3C)
    CAMERA(6, 0xA)
    CURSOR_FLASHING(6, 0xA)
    STAL(0x3C)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0x994)
    TEXTEND
    REMA
    ENUT(0xCC)
    CURE
    ENDA
};

