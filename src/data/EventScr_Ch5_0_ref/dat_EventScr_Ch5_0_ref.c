#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch5_0.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 Event_TextWithBG[];
extern const u8 data_085B9BBC[];
extern const u8 EventScr_Ch5_9[];
extern const u8 EventScr_CallOnTutorialMode[];

SECTION(".rodata.dat_EventScr_Ch5_0_ref") EventListScr EventScr_Ch5_0[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0)
    SVAL(EVT_SLOT_3, 0x98D)
    CALL(Event_TextWithBG)
    MUNO
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0xE)
    GIVEITEMTO(0xFFFF)
    SVAL(EVT_SLOT_2, EventScr_Ch5_9)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

