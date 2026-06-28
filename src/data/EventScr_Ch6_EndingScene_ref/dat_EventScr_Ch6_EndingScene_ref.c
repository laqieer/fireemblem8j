#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch6_EndingScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A60354[];
extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_Ch6_EndingScene_ref") EventListScr EventScr_Ch6_EndingScene[] = {
    EvtBgmFadeIn(0x7FFF, 2)
    SVAL(EVT_SLOT_2, 0x22)
    CALL(data_08A60354 + 0xCC)
    CHECK_ALIVE(0xFA)
    BEQ(0, 0xC, 0)
    CHECK_ALIVE(0xFB)
    BEQ(0, 0xC, 0)
    CHECK_ALIVE(0xF9)
    BEQ(0, 0xC, 0)
    MUSC(0x31)
    TEXTSHOW(0x9B2)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x66)
    GIVEITEMTO(1)
    LABEL(0)
    REMA
    MUSC(0x2B)
    TEXTSHOW(0x9B3)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 6)
    STAL(0x3C)
    EvtBgmFadeIn(0x32, 6)
    TEXTCONT
    TEXTEND
    REMA
    ENUT(0xD4)
    ENUT(0xC1)
    MNCH(8)
    ENDA
};

