#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch14A_8.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch14BAlly_7[];
extern const u8 EventScr_ChangeAIinQueue[];

SECTION(".rodata.dat_EventScr_Ch14A_8_ref") EventListScr EventScr_Ch14A_8[] = {
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x70008)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x70009)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x7000A)
    SENQUEUE1
    SVAL(EVT_SLOT_2, 0x10000)
    CALL(EventScr_ChangeAIinQueue)
    EVBIT_T(7)
    ENDA
};

