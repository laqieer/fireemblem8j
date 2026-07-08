#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch2_Village1.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 Event_TextWithBG[];
extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_Ch2_Village1_ref") EventListScr EventScr_Ch2_Village1[] = {
    IGNORE_KEYS(0)
    CHECK_ACTIVE
    SVAL(EVT_SLOT_1, 1)
    BNE(0, 0xC, 1)
    MUSI
    SVAL(EVT_SLOT_2, 2)
    SVAL(EVT_SLOT_3, 0x929)
    CALL(Event_TextWithBG)
    MUNO
    GOTO(1)
    LABEL(0)
    MUSI
    SVAL(EVT_SLOT_2, 2)
    SVAL(EVT_SLOT_3, 0x92A)
    CALL(Event_TextWithBG)
    MUNO
    LABEL(1)
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x76)
    GIVEITEMTO(0xFFFF)
    EVBIT_T(7)
    ENDA
};

