#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch4_10.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

SECTION(".rodata.dat_EventScr_Ch4_10_ref") EventListScr EventScr_Ch4_10[] = {
    MOVE(0, 0x13, 6, 3)
    ENUN
    CURSOR_CHAR(0x13)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x96A)
    TEXTEND
    REMA
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x96B)
    TEXTEND
    REMA
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0x979)
    TEXTEND
    REMA
    ENUT(0xCD)
    ENDA
};

