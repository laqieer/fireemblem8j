#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch1_EndingScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A60354[];

SECTION(".rodata.dat_EventScr_Ch1_EndingScene_ref") EventListScr EventScr_Ch1_EndingScene[] = {
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x39)
    CALL(data_08A60354 + 0xCC)
    CHECK_ALIVE(3)
    BEQ(0, 0xC, 0)
    TEXTSHOW(0x8F7)
    TEXTEND
    GOTO(1)
    LABEL(0)
    TEXTSHOW(0x8F8)
    TEXTEND
    LABEL(1)
    REMA
    FADI(0x10)
    ENUT(0xBA)
    ENUT(0xCF)
    ENUT(0xCE)
    ENUT(0xB6)
    ENUT(0xD7)
    ENUT(0xD6)
    ENUT(0xC7)
    ENUT(0xC8)
    ENUT(0xDD)
    REVEAL(2)
    MNCH(0x38)
    ENDA
};

