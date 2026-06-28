#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_SuspendPrompt.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 voicegroup031[];

SECTION(".rodata.dat_EventScr_SuspendPrompt_ref") EventListScr EventScr_SuspendPrompt[] = {
    EVBIT_MODIFY(4)
    TEXTSTART
    TEXTSHOW(0x81F)
    TEXTEND
    SVAL(EVT_SLOT_7, 1)
    BNE(0, 0xC, 7)
    ASMC(WriteSuspendPlayerIdle)
    EVENT_WORD_SYM(voicegroup031 + 0x285)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(4)
    MNTS(0)
    LABEL(0)
    REMA
    EVBIT_T(7)
    ENDA
};

