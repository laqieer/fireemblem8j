#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch20B_2.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_LoadReinforce[];
extern const u8 UnitDef_Ch14BAlly_7[];

SECTION(".rodata.dat_EventScr_Ch20B_2_ref") EventListScr EventScr_Ch20B_2[] = {
    SVAL(EVT_SLOT_2, 0x891F914)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(1)
    ENUF(0xC)
    COUNTER_CHECK(1)
    BNE(0, 0xC, 0)
    ENUT(0xC)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
};

