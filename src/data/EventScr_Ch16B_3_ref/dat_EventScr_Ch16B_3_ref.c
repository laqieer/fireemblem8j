#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch16B_3.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch16BEnemy_2[];
extern const u8 EventScr_LoadReinforce[];
extern const u8 frontier_df3_unitdef_b_039_91BED4[];

SECTION(".rodata.dat_EventScr_Ch16B_3_ref") EventListScr EventScr_Ch16B_3[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch16BEnemy_2)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_039_91BED4)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0)
    ENUF(0xE)
    COUNTER_CHECK(0)
    BNE(0, 0xC, 0)
    ENUT(0xE)
    LABEL(0)
    EVBIT_T(7)
    ENDA
};

