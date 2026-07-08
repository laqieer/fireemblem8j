#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch10A_0.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 Event_TextWithBG[];

SECTION(".rodata.dat_EventScr_Ch10A_0_ref") EventListScr EventScr_Ch10A_0[] = {
    CAMERA_CAHR(0x4F)
    CURSOR_CHAR(0x4F)
    STAL(0x3C)
    CURE
    MUSC(0x14)
    TEXTSTART
    TEXTSHOW(0x9F1)
    TEXTEND
    REMA
    CURSOR_AT(0x10, 1)
    STAL(0x3C)
    CURE
    MUSI
    SVAL(EVT_SLOT_2, 0x13)
    SVAL(EVT_SLOT_3, 0x9F2)
    CALL(Event_TextWithBG)
    MUNO
    EVBIT_T(7)
    ENDA
};

