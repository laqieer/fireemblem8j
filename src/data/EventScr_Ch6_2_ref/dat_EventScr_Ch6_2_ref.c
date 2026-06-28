#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch6_2.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A60354[];

SECTION(".rodata.dat_EventScr_Ch6_2_ref") EventListScr EventScr_Ch6_2[] = {
    CLEAN
    CAMERA2(7, 8)
    FADU(0x10)
    MUSC(0x11)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x22)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x9AA)
    TEXTEND
    CHECK_ALIVE(9)
    BEQ(0, 0xC, 0)
    EvtTextShow2(0x9AB)
    TEXTEND
    LABEL(0)
    REMA
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0x9B5)
    TEXTEND
    REMA
    ENUT(0xD4)
    ENDA
};

