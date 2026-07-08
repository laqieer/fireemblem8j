#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Prologue_EndingScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_SetBackground[];

SECTION(".rodata.dat_EventScr_Prologue_EndingScene_ref") EventListScr EventScr_Prologue_EndingScene[] = {
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x25)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x8D8)
    TEXTEND
    FADI(0x10)
    REMA
    ENUT(0xE0)
    ENUT(0xE1)
    ENUT(0xB7)
    ENUT(0xB4)
    ENUT(0xB5)
    ENUT(0xDC)
    ENUT(0xB9)
    ENUT(0xC2)
    ENUT(0xC3)
    ENUT(0xE7)
    ENUT(0xC9)
    MNC2(1)
    ENDA
};

