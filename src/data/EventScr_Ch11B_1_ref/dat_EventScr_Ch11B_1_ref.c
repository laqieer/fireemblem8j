#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch11B_1.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

SECTION(".rodata.dat_EventScr_Ch11B_1_ref") EventListScr EventScr_Ch11B_1[] = {
    MUSC(0x11)
    CAMERA2(9, 9)
    EARTHQUAKE_START(0, 1)
    STAL(0x1E)
    TILECHANGE(2)
    STAL(0x1E)
    EARTHQUAKE_END
    CAMERA_CAHR(0xF)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA94)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

