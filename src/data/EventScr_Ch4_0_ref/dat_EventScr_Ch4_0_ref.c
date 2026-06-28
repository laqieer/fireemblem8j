#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch4_0.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch4NPC_0[];

SECTION(".rodata.dat_EventScr_Ch4_0_ref") EventListScr EventScr_Ch4_0[] = {
    CAMERA2(7, 0)
    STAL(0xF)
    LOAD1(1, UnitDef_Ch4NPC_0)
    ENUN
    MUSC(0x2A)
    CURSOR_CHAR(0x19)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x96C)
    TEXTEND
    REMA
    MOVE(0x18, 0x19, 0xF, 2)
    MOVE(0x18, 0x1A, 0xF, 1)
    MOVE(0x18, 0x1C, 0xF, 1)
    ENUN
    CLEN
    EVBIT_T(7)
    ENDA
};

