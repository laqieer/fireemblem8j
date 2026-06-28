#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch14B_12.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch14BEnemy_8[];
extern const u8 data_08A60354[];
extern const u8 UnitDef_Ch14BEnemy_9[];

SECTION(".rodata.dat_EventScr_Ch14B_12_ref") EventListScr EventScr_Ch14B_12[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_8)
    CALL(data_08A60354 + 0x80)
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_9)
    CALL(data_08A60354 + 0x80)
    COUNTER_DEC(1)
    ENUF(0x10)
    COUNTER_CHECK(1)
    BNE(0, 0xC, 0)
    ENUT(0x10)
    LABEL(0)
    EVBIT_T(7)
    ENDA
};

