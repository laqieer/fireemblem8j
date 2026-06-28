#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch6_0.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_UnTriggerIfNotUnit[];
extern const u8 UnitDef_Ch14BAlly_7[];

SECTION(".rodata.dat_EventScr_Ch6_0_ref") EventListScr EventScr_Ch6_0[] = {
    CHECK_ALIVE(0xF9)
    BEQ(0x63, 0xC, 0)
    CHECK_INAREA(0xF9, 0x18, 9, 4, 6)
    BEQ(4, 0xC, 0)
    SVAL(EVT_SLOT_2, 0xB0)
    CALL(EventScr_UnTriggerIfNotUnit)
    MUSC(0x18)
    CAMERA_CAHR(0xF9)
    CURSOR_CHAR(0xF9)
    STAL(0x3C)
    CURE
    RANDOMNUMBER(2)
    SVAL(EVT_SLOT_7, 1)
    BEQ(1, 0xC, 7)
    SVAL(EVT_SLOT_7, 2)
    BEQ(2, 0xC, 7)
    LABEL(0)
    SVAL(EVT_SLOT_2, 0x9AC)
    GOTO(3)
    LABEL(1)
    SVAL(EVT_SLOT_2, 0x9AD)
    GOTO(3)
    LABEL(2)
    SVAL(EVT_SLOT_2, 0x9AE)
    LABEL(3)
    TEXTSTART
    TEXTSHOW(0xFFFF)
    TEXTEND
    REMA
    LABEL(4)
    CALL(UnitDef_Ch14BAlly_7 + 0x1C)
    LABEL(0x63)
    EVBIT_T(7)
    ENDA
};

