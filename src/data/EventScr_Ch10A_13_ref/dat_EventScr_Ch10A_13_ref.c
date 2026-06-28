#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch10A_13.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch14BAlly_7[];
extern const u8 EventScr_ChangeAIinQueue[];

SECTION(".rodata.dat_EventScr_Ch10A_13_ref") EventListScr EventScr_Ch10A_13[] = {
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0xE)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x1D000D)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1C000E)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1D000F)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1C0010)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1D0011)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1E000E)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1E0010)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1E0012)
    SENQUEUE1
    SVAL(EVT_SLOT_2, 0x10000)
    CALL(EventScr_ChangeAIinQueue)
    EVBIT_T(7)
    ENDA
};

