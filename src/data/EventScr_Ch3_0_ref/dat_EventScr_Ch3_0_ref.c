#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch3_0.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_FormatFlashingCursor[];

SECTION(".rodata.dat_EventScr_Ch3_0_ref") EventListScr EventScr_Ch3_0[] = {
    CAMERA2(7, 7)
    STAL(0xF)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x30002)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xA0006)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5000A)
    SENQUEUE1
    CALL(EventScr_FormatFlashingCursor)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x94D)
    TEXTEND
    REMA
    CAMERA2(7, 0xA)
    STAL(0xF)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x90004)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xC0004)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x80008)
    SENQUEUE1
    CALL(EventScr_FormatFlashingCursor)
    STAL(0x3C)
    CURE
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0x95B)
    TEXTEND
    REMA
    ENUT(0xD3)
    ENDA
};

