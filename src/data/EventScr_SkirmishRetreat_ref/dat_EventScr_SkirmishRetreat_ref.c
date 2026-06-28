#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_SkirmishRetreat.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 StartRetreatProcessing[];

SECTION(".rodata.dat_EventScr_SkirmishRetreat_ref") EventListScr EventScr_SkirmishRetreat[] = {
    EVBIT_MODIFY(4)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0x8BE)
    TEXTEND
    SVAL(EVT_SLOT_7, 1)
    BNE(0, 0xC, 7)
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(4)
    MNCH(0xFFFF)
    CHECK_SKIRMISH
    SVAL(EVT_SLOT_1, 1)
    BNE(0, 0xC, 1)
    ASMC(StartRetreatProcessing + 0x1)
    LABEL(0)
    REMA
    EVBIT_T(7)
    ENDA
};

