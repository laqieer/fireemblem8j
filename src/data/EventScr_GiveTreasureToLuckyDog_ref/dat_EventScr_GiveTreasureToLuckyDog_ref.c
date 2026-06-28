#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_GiveTreasureToLuckyDog.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_GiveTreasureToLuckyDog_ref") EventListScr EventScr_GiveTreasureToLuckyDog[] = {
    CHECK_CLASS(0xFFFF)
    SVAL(EVT_SLOT_7, 0xD)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 0x33)
    BEQ(0, 0xC, 7)
    RANDOMNUMBER(0x64)
    BLT(1, 2, 0xC)
    LABEL(0)
    CALL(data_085B9BBC + 0x168)
    GIVEITEMTO(0xFFFF)
    SVAL(EVT_SLOT_C, 1)
    GOTO(2)
    LABEL(1)
    SVAL(EVT_SLOT_C, 0)
    LABEL(2)
    ENDA
};

