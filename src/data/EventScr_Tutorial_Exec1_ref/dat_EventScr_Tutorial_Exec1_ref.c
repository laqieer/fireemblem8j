#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Tutorial_Exec1.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 PlayPhaseForcePressAButtonInRangeDisp[];

SECTION(".rodata.dat_EventScr_Tutorial_Exec1_ref") EventListScr EventScr_Tutorial_Exec1[] = {
    CHECK_CURSOR
    SDEQUEUE(0xB)
    BNE(0, 0xC, 0xB)
    ASMC(PlayPhaseForcePressAButtonInRangeDisp + 0x1)
    SDEQUEUE(0xC)
    SDEQUEUE(0xC)
    SDEQUEUE(2)
    EvtEnqueueConditionalTutCall(0xFFFFFFFF, 4)
    SVAL(EVT_SLOT_C, 1)
    GOTO(2)
    LABEL(0)
    SET_CURSOR(0xFF, 0xFF)
    CAMERA(0xFF, 0xFF)
    CURSOR_FLASHING(0xFF, 0xFF)
    STAL3(8)
    TUTORIALTEXTBOXSTART
    SDEQUEUE(2)
    SDEQUEUE(0xB)
    BEQ(1, 2, 0)
    TEXTSHOW(0xFFFF)
    TEXTEND
    REMA
    LABEL(1)
    CURE
    SDEQUEUE(0xC)
    SDEQUEUE(2)
    EvtEnqueueConditionalTutCall(0xFFFFFFFF, 3)
    SVAL(EVT_SLOT_C, 0)
    LABEL(2)
    ENDA
};

