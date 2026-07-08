#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Prologue_GiveRapier.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_085B9BBC[];
extern const u8 EventScr_Prologue_9EF828[];
extern const u8 EventScr_CallOnTutorialMode[];

SECTION(".rodata.dat_EventScr_Prologue_GiveRapier_ref") EventListScr EventScr_Prologue_GiveRapier[] = {
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x8CF)
    TEXTEND
    REMA
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 9)
    GIVEITEMTO(1)
    SVAL(EVT_SLOT_2, EventScr_Prologue_9EF828)
    CALL(EventScr_CallOnTutorialMode)
    ENDA
};

