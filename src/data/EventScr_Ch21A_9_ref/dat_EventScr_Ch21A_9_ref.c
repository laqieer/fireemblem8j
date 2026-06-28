#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch21A_9.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_UnitWarpOUT[];

SECTION(".rodata.dat_EventScr_Ch21A_9_ref") EventListScr EventScr_Ch21A_9[] = {
    STARTFADE
    EvtColorFadeSetup(6, 0xA, 4, 0, 0, 0)
    STAL(0x1E)
    MOVE_1STEP(2, 0x40, 3)
    ENUN
    STAL2(0x1E)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(0x40)
    TEXTSTART
    TEXTSHOW(0xB87)
    TEXTEND
    REMA
    SOLOTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x800018)
    TEXTSHOW(0xB88)
    TEXTEND
    REMA
    ENDA
};

