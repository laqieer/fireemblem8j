#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch1Tut_EirikaVisitHouseInit.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 MultiBootImage_08FE0000[];
extern const u8 EventScr_Ch1Tut_EirikaVisitHouseIdle1[];

SECTION(".rodata.dat_EventScr_Ch1Tut_EirikaVisitHouseInit_ref") EventListScr EventScr_Ch1Tut_EirikaVisitHouseInit[] = {
    MUSC(9)
    TEXTSTART
    TEXTSHOW(0x8EE)
    TEXTEND
    REMA
    CURSOR_FLASHING(0xD, 6)
    STAL(0x3C)
    CURE
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    EVENT_WORD_SYM(MultiBootImage_08FE0000 + 0x1B20)
    TEXTEND
    REMA
    CURSOR_FLASHING_CHAR(1)
    STAL(0x3C)
    CURE
    EvtEnqueueConditionalTutCall(EventScr_Ch1Tut_EirikaVisitHouseIdle1, 2)
    DISABLEOPTIONS(0x4000)
    EVBIT_T(7)
    ENDA
};

