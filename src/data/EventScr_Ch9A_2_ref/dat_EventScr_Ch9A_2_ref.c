#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch9A_2.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A60354[];
extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_Ch9A_2_ref") EventListScr EventScr_Ch9A_2[] = {
    MUSS(0x2A)
    STAL(0x21)
    SVAL(EVT_SLOT_2, 0)
    SVAL(EVT_SLOT_3, 0x9EA)
    CALL(data_08A60354 + 0xF4)
    MURE(2)
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x60)
    GIVEITEMTO(0xFFFF)
    EVBIT_T(7)
    ENDA
};

