#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch16A_1.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_Ch16A_1_ref") EventListScr EventScr_Ch16A_1[] = {
    SADD(EVT_SLOT_A, EVT_SLOT_2, EVT_SLOT_0)
    STARTFADE
    EvtColorFadeSetup(6, 0xA, 0, 0x200, 0x200, 0x200)
    FAWU(0x80)
    CALL((u8 *)data_085B9BBC + 0x168)
    EVBIT_MODIFY(4)
    CALL((u8 *)EventScr_Ch16A_1 + 0x54)
    EvtBgmFadeIn(0x7FFF, 4)
    REMOVEPORTRAITS
    SADD(EVT_SLOT_2, EVT_SLOT_A, EVT_SLOT_0)
    BACG(0xFFFF)
    FAWU(4)
    EVBIT_MODIFY(0)
    ENDA
    CHECK_MODE
    EVENT_WORD(0x00010540)
};

