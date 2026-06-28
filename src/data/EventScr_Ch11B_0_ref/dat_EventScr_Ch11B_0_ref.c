#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch11B_0.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A60354[];
extern const u8 UnitDef_Ch11BEnemy_1[];
extern const u8 UnitDef_Ch11BEnemy_2[];

SECTION(".rodata.dat_EventScr_Ch11B_0_ref") EventListScr EventScr_Ch11B_0[] = {
    MUSC(0x11)
    CAMERA_CAHR(0xF)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xD)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA93)
    TEXTEND
    REMA
    FADI(0x10)
    TILEREVERT(0)
    TILECHANGE(1)
    CLEAN
    CAMERA2(9, 9)
    TEXTSTART
    LOAD1(1, UnitDef_Ch11BEnemy_1)
    ENUN
    LOAD1(1, UnitDef_Ch11BEnemy_2)
    ENUN
    FADU(0x10)
    EVBIT_T(7)
    ENDA
};

