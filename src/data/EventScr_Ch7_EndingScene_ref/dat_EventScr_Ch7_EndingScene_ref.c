#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch7_EndingScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 frontier_df4_banim_b_076_90B4DC[];
extern const u8 Event_TextWithBG[];

SECTION(".rodata.dat_EventScr_Ch7_EndingScene_ref") EventListScr EventScr_Ch7_EndingScene[] = {
    FADI(0x10)
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x44)
    CLEA
    CLEE
    CLEN
    FADU(0x10)
    MUSC(0x53)
    LOAD2(1, frontier_df4_banim_b_076_90B4DC + 0x1B8)
    ENUN
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x9C5)
    TEXTEND
    REMA
    MOVE_1STEP(0, 2, 1)
    MOVE_1STEP(0, 1, 0)
    LOAD2(1, frontier_df4_banim_b_076_90B4DC + 0x1F4)
    ENUN
    ENUN
    CURSOR_CHAR(0x42)
    STAL(0x3C)
    CURE
    MUSI
    SVAL(EVT_SLOT_2, 0x15)
    SVAL(EVT_SLOT_3, 0x9C6)
    CALL(Event_TextWithBG)
    MUNO
    MOVE_1STEP(0, 0x42, 0)
    ENUN
    MOVE(0, 0x42, 9, 0)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x109)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 9)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(1)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x10A)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xA)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(2)
    STAL2(8)
    FADI(0x10)
    ENUN
    ENUT(0xD5)
    MNCH(9)
    ENDA
};

