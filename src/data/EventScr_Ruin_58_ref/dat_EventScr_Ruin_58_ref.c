#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ruin_58.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

SECTION(".rodata.dat_EventScr_Ruin_58_ref") EventListScr EventScr_Ruin_58[] = {
    FADI(0x10)
    SVAL(EVT_SLOT_2, 0)
    SVAL(EVT_SLOT_3, 0x4F)
    REMOVEPORTRAITS
    LABEL(0)
    BACG(0xFFFF)
    FADU(0x10)
    STAL1(0xFFFF)
    FADI(0x10)
    SVAL(EVT_SLOT_1, 1)
    SADD(EVT_SLOT_2, EVT_SLOT_2, EVT_SLOT_1)
    BLT(0, 2, 3)
    CLEAN
    FADU(0x10)
    EVBIT_T(7)
    ENDA
};

