#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_MapSupportConversation.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

SECTION(".rodata.dat_EventScr_MapSupportConversation_ref") EventListScr EventScr_MapSupportConversation[] = {
    EVBIT_MODIFY(3)
    BEQ(0, 2, 0)
    MUSC(0xFFFF)
    GOTO(1)
    LABEL(0)
    MUSI
    LABEL(1)
    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    TEXTSHOW(0xFFFF)
    TEXTEND
    REMA
    NOTIFY(0x80A, 0x5A)
    EVBIT_T(7)
    ENDA
};

