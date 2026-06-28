#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch14B_2.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A60BE4[];

SECTION(".rodata.dat_EventScr_Ch14B_2_ref") EventListScr EventScr_Ch14B_2[] = {
    SVAL(EVT_SLOT_2, 0xA)
    SVAL(EVT_SLOT_3, 0x1C)
    SVAL(EVT_SLOT_4, 0x26FC)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0xAD2)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xAD3)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xAD5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xAD6)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xAD7)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xAD4)
    SENQUEUE1
    CALL(data_08A60BE4)
    ENDA
};

