#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch2Tutorial4.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_Ch2Tutorial5[];

SECTION(".rodata.dat_EventScr_Ch2Tutorial4_ref") EventListScr EventScr_Ch2Tutorial4[] = {
    EVBIT_T(7)
    IGNORE_KEYS(0)
    MUSI
    TEXTSTART
    TEXTSHOW(0x91D)
    TEXTEND
    REMA
    MUNO
    DISABLEOPTIONS(0)
    SHOW_ATTACK_RANGE(6)
    CURSOR_FLASHING(8, 4)
    STAL(0x3C)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x580010)
    TEXTSHOW(0x933)
    TEXTEND
    REMA
    CURE
    IGNORE_KEYS(0x10A)
    EvtEnqueueConditionalTutCall(EventScr_Ch2Tutorial5, 3)
    ENDA
};

