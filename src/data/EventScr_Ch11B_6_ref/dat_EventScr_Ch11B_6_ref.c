#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch11B_6.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch11BEnemy_4[];
extern const u8 EventScr_LoadReinforce[];
extern const u8 EventScr_LoadReinforceHardMode[];
extern const u8 frontier_df3_unitdef_b_030_918784[];

SECTION(".rodata.dat_EventScr_Ch11B_6_ref") EventListScr EventScr_Ch11B_6[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch11BEnemy_4)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_030_918784 + 0x78)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_030_918784 + 0xB4)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_030_918784 + 0xF0)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

