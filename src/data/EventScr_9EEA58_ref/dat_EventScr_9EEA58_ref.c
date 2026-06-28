#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_9EEA58.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

SECTION(".rodata.dat_EventScr_9EEA58_ref") EventListScr EventScr_9EEA58[] = {
    CHECK_EVBIT(8)
    BNE(0x801B, 0xC, 0)
    FADI(0x10)
    LABEL(0x801B)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x3F)
    FADU(0x10)
    BROWNBOXTEXT(0x5F4, 8, 8)
    CURSOR_AT(0xA, 4)
    STAL(0x3C)
    CURE
    FADI(0x10)
    SADD(EVT_SLOT_B, EVT_SLOT_2, EVT_SLOT_0)
    LOMA(0x1B)
    ENDA
};

