#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch15A_23.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch14BAlly_7[];
extern const u8 EventScr_GiveTreasureToLuckyDog[];

SECTION(".rodata.dat_EventScr_Ch15A_23_ref") EventListScr EventScr_Ch15A_23[] = {
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    CHECK_LUCK(0xFFFF)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x73)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x820C, 0xC, 0)
    CALL(UnitDef_Ch14BAlly_7 + 0x1C)
    LABEL(0x820C)
    EVBIT_T(7)
    ENDA
};

