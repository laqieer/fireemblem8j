#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Prologue_TutorialB.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A618F0[];
extern const u8 EventScr_Tutorial_Exec1[];

SECTION(".rodata.dat_EventScr_Prologue_TutorialB_ref") EventListScr EventScr_Prologue_TutorialB[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x60008)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8E5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x80058)
    SENQUEUE1
    SVAL(EVT_SLOT_1, data_08A618F0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Prologue_TutorialB)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec1)
    DISABLEOPTIONS(0xFFFE)
    IGNORE_KEYS(0x10A)
    ENDA
};

