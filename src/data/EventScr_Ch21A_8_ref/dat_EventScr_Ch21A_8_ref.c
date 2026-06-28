#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch21A_8.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 frontier_df3_unitdef_b_023_91512C[];
extern const u8 UnitDef_Ch21AAlly_1[];
extern const u8 EventScr_UnitFlushingOUT[];
extern const u8 EventScr_UnitFlushingIN[];

SECTION(".rodata.dat_EventScr_Ch21A_8_ref") EventListScr EventScr_Ch21A_8[] = {
    REMOVEPORTRAITS
    BACG(0x4F)
    FAWI(2)
    BACG(0x1A)
    FAWU(2)
    EvtBgmFadeIn(0x2C, 6)
    BROWNBOXTEXT(0x196, 8, 8)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0, 0xC, 1)
    TEXTSHOW(0xB7A)
    TEXTEND
    GOTO(1)
    LABEL(0)
    TEXTSHOW(0xB7B)
    TEXTEND
    LABEL(1)
    REMA
    EvtBgmFadeIn(0x7FFF, 8)
    FAWI(2)
    CLEAN
    LOAD1(1, (u8 *)frontier_df3_unitdef_b_023_91512C + 0xAE8)
    ENUN
    FAWU(2)
    LOAD2(1, UnitDef_Ch21AAlly_1)
    ENUN
    MOVE(0x10, 0, 0xB, 0x14)
    ENUN
    CURSOR_CHAR(0)
    STAL(0x3C)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0xA, 0xC, 1)
    MUSC(0x44)
    TEXTSTART
    TEXTSHOW(0xB7C)
    TEXTEND
    REMA
    GOTO(0xB)
    LABEL(0xA)
    TEXTSTART
    TEXTSHOW(0xB7E)
    TEXTEND
    REMA
    LABEL(0xB)
    STARTFADE
    EvtBgmFadeIn(0x7FFF, 6)
    EvtColorFadeSetup(6, 0xA, 8, 0x80, 0x80, 0x80)
    EvtColorFadeSetup(0x1D, 1, 4, 0, 0, 0)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitFlushingOUT)
    DISA(0x40)
    STAL(0x1E)
    SPAWN_ENEMY(0x6C, 0, 0)
    EvtColorFadeSetup(0x1D, 1, 0, 0x100, 0x100, 0x100)
    SVAL(EVT_SLOT_2, 0x6C)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 0xB, 0x12)
    CALL(EventScr_UnitFlushingIN)
    EvtColorFadeSetup(6, 0xA, 8, 0x100, 0x100, 0x100)
    ENDA
};

