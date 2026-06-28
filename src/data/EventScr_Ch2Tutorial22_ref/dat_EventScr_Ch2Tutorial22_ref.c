#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch2Tutorial22.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_Ch2Tutorial23[];

SECTION(".rodata.dat_EventScr_Ch2Tutorial22_ref") EventListScr EventScr_Ch2Tutorial22[] = {
    IGNORE_KEYS(0)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x91C)
    TEXTEND
    REMA
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0x940)
    TEXTEND
    REMA
    CURSOR_FLASHING_CHAR(1)
    STAL(0x3C)
    CURE
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial23, 2)
    DISABLEOPTIONS(0x4000)
    EVBIT_T(7)
    ENDA
};

