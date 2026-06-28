#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch13B_0.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch14BAlly_7[];
extern const u8 EventScr_UnTriggerIfNotUnit[];

SECTION(".rodata.dat_EventScr_Ch13B_0_ref") EventListScr EventScr_Ch13B_0[] = {
    CHECK_EVENTID(2)
    BNE(0, 0xC, 0)
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_2, 0xF)
    CALL(EventScr_UnTriggerIfNotUnit)
    MUSI
    TEXTSTART
    TEXTSHOW(0xAB4)
    TEXTEND
    REMA
    MUNO
    LABEL(0)
    EVBIT_T(7)
    ENDA
};

