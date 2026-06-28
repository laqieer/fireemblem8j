#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch10B_1.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

SECTION(".rodata.dat_EventScr_Ch10B_1_ref") EventListScr EventScr_Ch10B_1[] = {
    CHECK_EXISTS(0xE)
    BEQ(0, 0xC, 0)
    CHECK_ALLEGIANCE(0xE)
    SVAL(EVT_SLOT_1, 0)
    BEQ(0, 0xC, 1)
    MUSC(0x14)
    CAMERA_CAHR(0xE)
    STAL(0xF)
    CURSOR_CHAR(0xE)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA7C)
    TEXTEND
    REMA
    LABEL(0)
    EVBIT_T(7)
    ENDA
};

