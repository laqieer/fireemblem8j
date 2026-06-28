#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch16A_9.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch16AEnemy_2[];
extern const u8 data_08A60354[];
extern const u8 UnitDef_Ch16AEnemy_3[];
extern const u8 UnitDef_Ch16AEnemy_4[];
extern const u8 frontier_df3_unitdef_b_009_91187C[];

SECTION(".rodata.dat_EventScr_Ch16A_9_ref") EventListScr EventScr_Ch16A_9[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch16AEnemy_2)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, UnitDef_Ch16AEnemy_3)
    CALL(data_08A60354 + 0x58)
    CAMERA(0x13, 0x1B)
    SVAL(EVT_SLOT_2, UnitDef_Ch16AEnemy_4)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_009_91187C)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
};

