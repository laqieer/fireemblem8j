#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch3_5.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

SECTION(".rodata.dat_EventScr_Ch3_5_ref") EventListScr EventScr_Ch3_5[] = {
    CURSOR_CHAR(8)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x94F)
    TEXTEND
    REMA
    MOVE(0, 8, 3, 9)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x90005)
    FIGHT(8, 0xFFFF, 0, 0)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0x95F)
    TEXTEND
    REMA
    ENDA
};

