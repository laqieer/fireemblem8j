#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch3_EndingScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A60354[];
extern const u8 EventScr_LoadUniqueAlly[];
extern const u8 EventScr_StrictLoadUniqueAlly[];
extern const u8 EventScr_9EEA58[];
extern const u8 UnitDef_Ch3Enemy_1[];
extern const u8 UnitDef_Ch3Enemy_2[];

SECTION(".rodata.dat_EventScr_Ch3_EndingScene_ref") EventListScr EventScr_Ch3_EndingScene[] = {
    MUSC(0x31)
    CHECK_ALIVE(9)
    BEQ(0, 0xC, 0)
    CHECK_ALIVE(8)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_2, 0x3C)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x955)
    TEXTEND
    REMA
    FADI(0x10)
    SVAL(EVT_SLOT_2, 9)
    CALL(EventScr_LoadUniqueAlly)
    GOTO(1)
    LABEL(0)
    SVAL(EVT_SLOT_2, 9)
    CALL(EventScr_StrictLoadUniqueAlly)
    LABEL(1)
    SVAL(EVT_SLOT_2, 0x3E)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x956)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 6)
    FADI(4)
    SVAL(EVT_SLOT_2, 0x2000F)
    CALL(EventScr_9EEA58)
    SVAL(EVT_SLOT_2, 0x11)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x957)
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    LOAD1(1, UnitDef_Ch3Enemy_1)
    ENUN
    FADU(0x10)
    MUSC(0x2E)
    CURSOR_CHAR(0x6B)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x958)
    TEXTEND
    REMA
    SOUN(0xB1)
    TILECHANGE(0)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x1010E)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1010C)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x1D)
    MOVE_1STEP(0x10, 0x69, 0)
    MOVE_1STEP(0x10, 0x44, 1)
    ENUN
    LOAD1(1, UnitDef_Ch3Enemy_2)
    ENUN
    CURSOR_CHAR(0x6B)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x959)
    TEXTEND
    REMA
    FADI(0x10)
    ENUT(0xD3)
    ENUT(0xD1)
    ENUT(0xE9)
    ENUT(0xD8)
    ENUT(0xD9)
    ENUT(0xC6)
    REVEAL(2)
    MNCH(4)
    ENDA
};

