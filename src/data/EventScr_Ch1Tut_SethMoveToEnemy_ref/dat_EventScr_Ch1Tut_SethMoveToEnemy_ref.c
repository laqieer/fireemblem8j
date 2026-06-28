#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch1Tut_SethMoveToEnemy.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_Ch1Tut_BeforeSethMoveToEnemy[];
extern const u8 EventScr_Tutorial_Exec0[];

SECTION(".rodata.dat_EventScr_Ch1Tut_SethMoveToEnemy_ref") EventListScr EventScr_Ch1Tut_SethMoveToEnemy[] = {
    EVBIT_T(7)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 2)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x60009)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x910)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x80008)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x90F)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x80008)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch1Tut_BeforeSethMoveToEnemy)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch1Tut_SethMoveToEnemy)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec0)
    ENDA
};

