#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch2Tutorial21.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_Ch2_7[];

SECTION(".rodata.dat_EventScr_Ch2Tutorial21_ref") EventListScr EventScr_Ch2Tutorial21[] = {
    IGNORE_KEYS(0)
    TEXTSTART
    TEXTSHOW(0x91F)
    TEXTEND
    REMA
    ENUT(0xC0)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0x93D)
    TEXTEND
    REMA
    ENUT(0xC4)
    DISABLEOPTIONS(0)
    EvtEnqueueCallDirectly(EventScr_Ch2_7)
    EVBIT_T(7)
    ENDA
};

