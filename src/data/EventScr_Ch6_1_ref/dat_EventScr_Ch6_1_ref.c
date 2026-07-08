#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch6_1.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A60354[];
extern const u8 data_085B9BBC[];
extern const u8 EventScr_Ch6_3[];
extern const u8 EventScr_CallOnTutorialMode[];

SECTION(".rodata.dat_EventScr_Ch6_1_ref") EventListScr EventScr_Ch6_1[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0)
    SVAL(EVT_SLOT_3, 0x9B4)
    CALL(data_08A60354 + 0xF4)
    MUNO
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x6F)
    GIVEITEMTO(0xFFFF)
    SVAL(EVT_SLOT_2, EventScr_Ch6_3)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

