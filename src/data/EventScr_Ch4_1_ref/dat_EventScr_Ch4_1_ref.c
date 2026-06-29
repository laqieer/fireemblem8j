#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch4_1.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A60354[];
extern const u8 data_0890915C[];
extern const u8 UnitDef_Ch4Ally_3[]; /* was data_089092B0 (D312 rename) */
extern const u8 UnitDef_Ch4NPC_1[];

SECTION(".rodata.dat_EventScr_Ch4_1_ref") EventListScr EventScr_Ch4_1[] = {
    MUSC(0x31)
    CHECK_EXISTS(0xC)
    BNE(0xA, 0xC, 0)
    SVAL(EVT_SLOT_2, 2)
    CALL(data_08A60354 + 0xCC)
    CHECK_ALIVE(0x13)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_2, 0x96D)
    GOTO(1)
    LABEL(0)
    SVAL(EVT_SLOT_2, 0x96E)
    LABEL(1)
    TEXTSHOW(0xFFFF)
    TEXTEND
    REMA
    FADI(0x10)
    LOAD1(1, data_0890915C + 0x28)
    ENUN
    LABEL(0xA)
    MUSC(0x32)
    SVAL(EVT_SLOT_2, 0x1E)
    CALL(data_08A60354 + 0xCC)
    CHECK_ALIVE(0x13)
    BEQ(0xB, 0xC, 0)
    CHECK_ALIVE(0xC)
    BEQ(0xB, 0xC, 0)
    SVAL(EVT_SLOT_2, 0x96F)
    GOTO(0xC)
    LABEL(0xB)
    SVAL(EVT_SLOT_2, 0x970)
    LABEL(0xC)
    TEXTSHOW(0xFFFF)
    TEXTEND
    REMA
    FADI(0x10)
    EvtBgmFadeIn(0x7FFF, 4)
    CLEAN
    CAMERA2(7, 7)
    CLEA
    CLEE
    CLEN
    LOAD2(1, UnitDef_Ch4Ally_3)
    ENUN
    FADU(0x10)
    LOAD1(1, UnitDef_Ch4NPC_1)
    ENUN
    MUSC(0x2A)
    CURSOR_CHAR(0x19)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x1E)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x971)
    TEXTEND
    REMA
    ENUT(0xD2)
    ENUT(0xBB)
    ENUT(0xBE)
    ENUT(0xBF)
    ENUT(0xE6)
    ENUT(0xCD)
    MNCH(6)
    ENDA
};

