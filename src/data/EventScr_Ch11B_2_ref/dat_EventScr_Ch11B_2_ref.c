#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch11B_2.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A60354[];
extern const u8 frontier_df3_unitdef_b_029_9184F0[];

SECTION(".rodata.dat_EventScr_Ch11B_2_ref") EventListScr EventScr_Ch11B_2[] = {
    MUSC(0x11)
    CAMERA_CAHR(0xF)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xD)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA95)
    TEXTEND
    REMA
    FADI(0x10)
    TILECHANGE(3)
    CLEAN
    CAMERA2(0xC, 0xA)
    TEXTSTART
    EARTHQUAKE_START(0, 1)
    FADU(0x10)
    STAL(0x20)
    EARTHQUAKE_END
    LOAD1(1, frontier_df3_unitdef_b_029_9184F0)
    ENUN
    CURSOR_CHAR(0x19)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA96)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

