#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Prologue_Tutorial1.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_Prologue_Tutorial2[];
extern const u8 EventScr_Tutorial_Exec1[];

SECTION(".rodata.dat_EventScr_Prologue_Tutorial1_ref") EventListScr EventScr_Prologue_Tutorial1[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x50004)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8DC)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x80058)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Prologue_Tutorial2)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Prologue_Tutorial1)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec1)
    DISABLEOPTIONS(0xFFFB)
    IGNORE_KEYS(0x10A)
    ENDA
};

