#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch20B_1.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 frontier_df3_unitdef_b_052_91F89C[];
extern const u8 data_08A60354[];
extern const u8 UnitDef_Ch14BAlly_7[];

SECTION(".rodata.dat_EventScr_Ch20B_1_ref") EventListScr EventScr_Ch20B_1[] = {
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_052_91F89C)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(0)
    ENUF(0xB)
    COUNTER_CHECK(0)
    BNE(0, 0xC, 0)
    ENUT(0xB)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
};

