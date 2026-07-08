#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch13A_4.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch13AEnemy_5[];
extern const u8 UnitDef_Ch13AEnemy_6[];
extern const u8 EventScr_LoadReinforce[];

SECTION(".rodata.dat_EventScr_Ch13A_4_ref") EventListScr EventScr_Ch13A_4[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_2, UnitDef_Ch13AEnemy_5)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_Ch13AEnemy_6)
    CALL(EventScr_LoadReinforce)
    LABEL(0)
    EVBIT_T(7)
    ENDA
};

