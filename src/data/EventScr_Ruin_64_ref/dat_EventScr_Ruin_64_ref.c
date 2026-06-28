#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ruin_64.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_ConfigHardModeLoadUnitHard[];
extern const u8 EventScr_9EE84C[];

SECTION(".rodata.dat_EventScr_Ruin_64_ref") EventListScr EventScr_Ruin_64[] = {
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xF)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 2)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 3)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 4)
    SENQUEUE1
    ENDA
};

