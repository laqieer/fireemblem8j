#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch2Tutorial18.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_Ch2Tutorial19[];
extern const u8 EventScr_Tutorial_Exec0[];

SECTION(".rodata.dat_EventScr_Ch2Tutorial18_ref") EventListScr EventScr_Ch2Tutorial18[] = {
    EVBIT_T(7)
    CAMERA_CAHR(5)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x30007)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x939)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x580020)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x938)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x580020)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ch2Tutorial18)
    SENQUEUE1
    CALL(EventScr_Tutorial_Exec0)
    IGNORE_KEYS(0x3FE)
    ENDA
};

