#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch4_2.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 Event_TextWithBG[];
extern const u8 UnitDef_Ch4Ally_2[];

SECTION(".rodata.dat_EventScr_Ch4_2_ref") EventListScr EventScr_Ch4_2[] = {
    MUSS(0x30)
    STAL(0x21)
    CHECK_ACTIVE
    SVAL(EVT_SLOT_7, 0x13)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 1)
    BEQ(1, 0xC, 7)
    SVAL(EVT_SLOT_2, 2)
    SVAL(EVT_SLOT_3, 0x974)
    CALL(Event_TextWithBG)
    GOTO(2)
    LABEL(0)
    SVAL(EVT_SLOT_2, 2)
    SVAL(EVT_SLOT_3, 0x972)
    CALL(Event_TextWithBG)
    GOTO(2)
    LABEL(1)
    SVAL(EVT_SLOT_2, 2)
    SVAL(EVT_SLOT_3, 0x973)
    CALL(Event_TextWithBG)
    LABEL(2)
    MURE(4)
    LOAD1(1, UnitDef_Ch4Ally_2)
    ENUN
    EVBIT_T(7)
    ENDA
};

