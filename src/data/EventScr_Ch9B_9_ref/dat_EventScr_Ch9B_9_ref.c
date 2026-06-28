#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch9B_9.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch14BAlly_7[];

SECTION(".rodata.dat_EventScr_Ch9B_9_ref") EventListScr EventScr_Ch9B_9[] = {
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    COUNTER_SET(3, 1)
    CHECK_TUTORIAL
    BNE(0, 0xC, 0)
    CHECK_HARD
    BEQ(0, 0xC, 0)
    COUNTER_SET(3, 3)
    LABEL(0)
    ENUF(0xE)
    EVBIT_T(7)
    ENDA
};

