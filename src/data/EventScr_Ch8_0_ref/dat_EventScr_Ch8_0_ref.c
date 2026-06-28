#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch8_0.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch8Ally_0[];

SECTION(".rodata.dat_EventScr_Ch8_0_ref") EventListScr EventScr_Ch8_0[] = {
    CAMERA(0, 0x17)
    LOAD1(1, UnitDef_Ch8Ally_0)
    ENUN
    REVEAL(0xF)
    REVEAL(0x10)
    REVEAL(0x11)
    SVAL(EVT_SLOT_1, 1)
    SET_STATE(0xF)
    SVAL(EVT_SLOT_1, 1)
    SET_STATE(0x10)
    SVAL(EVT_SLOT_1, 1)
    SET_STATE(0x11)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    MUSC(0x25)
    TEXTSTART
    TEXTSHOW(0x9CE)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

