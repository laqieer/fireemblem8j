#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch15A_0.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch15AAlly_1[];
extern const u8 data_08A60354[];

SECTION(".rodata.dat_EventScr_Ch15A_0_ref") EventListScr EventScr_Ch15A_0[] = {
    MUSC(0x25)
    EVBIT_T(9)
    LOAD1(1, UnitDef_Ch15AAlly_1)
    ENUN
    EVBIT_F(9)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x49)
    SVAL(EVT_SLOT_3, 0xADC)
    CALL(data_08A60354 + 0xF4)
    REVEAL(0xF)
    EVBIT_T(7)
    ENDA
};

