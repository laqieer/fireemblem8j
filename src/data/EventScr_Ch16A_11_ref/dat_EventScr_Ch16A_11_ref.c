#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch16A_11.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch16AAlly_5[];
extern const u8 EventScr_SetBackground[];
extern const u8 Event_TextWithBG[];
extern const u8 frontier_df3_unitdef_b_012_911C34[];
extern const u8 UnitDef_Ch16AAlly_8[];
extern const u8 EventScr_UnitWarpIN[];
extern const u8 frontier_df3_unitdef_b_013_911E38[];
extern const u8 EventScr_UnitWarpOUT[];

SECTION(".rodata.dat_EventScr_Ch16A_11_ref") EventListScr EventScr_Ch16A_11[] = {
    MUSC(0x47)
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x40)
    FADU(0x10)
    LOAD2(1, UnitDef_Ch16AAlly_5)
    ENUN
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x25)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xAF9)
    TEXTEND
    MUSC(0x25)
    TEXTCONT
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    FADU(0x10)
    MOVE_1STEP(0x10, 0x1E, 3)
    ENUN
    SVAL(EVT_SLOT_2, 0x25)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xAFA)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0xC0000)
    LOMA(0x42)
    UNIT_COLORS(2)
    LOAD2(1, frontier_df3_unitdef_b_012_911C34 + 0x100)
    ENUN
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_012_911C34 + 0x13C)
    ENUN
    SOUN(0xB1)
    TILECHANGE(0)
    MOVE(0, 0x6D, 7, 6)
    ENUN
    TILEREVERT(0)
    LOAD2(1, frontier_df3_unitdef_b_012_911C34 + 0x164)
    ENUN
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(1, 0xC, 1)
    SVAL(EVT_SLOT_2, 0x13)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xAFB)
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    LABEL(1)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BEQ(2, 0xC, 1)
    MUSC(0x2E)
    EvtSetLoadUnitNoREDA
    LOAD2(1, UnitDef_Ch16AAlly_8)
    ENUN
    REMU(0x40)
    REMU(0x57)
    FADU(0x10)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 7, 0xB)
    CALL(EventScr_UnitWarpIN)
    SVAL(EVT_SLOT_2, 0x57)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 8, 0xB)
    CALL(EventScr_UnitWarpIN)
    LOAD2(1, UnitDef_Ch16AAlly_8)
    ENUN
    CURSOR_CHAR(0x80)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x15)
    SVAL(EVT_SLOT_3, 0xAFC)
    CALL(Event_TextWithBG)
    MOVE_1STEP(0x10, 0x80, 0)
    MOVE_1STEP(0x10, 0x81, 1)
    ENUN
    LABEL(2)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(3, 0xC, 1)
    LOAD2(1, UnitDef_Ch16AAlly_8)
    ENUN
    MOVE_1STEP(0xFFFF, 0x80, 0)
    MOVE_1STEP(0xFFFF, 0x81, 1)
    FADU(0x10)
    LABEL(3)
    LOAD2(1, frontier_df3_unitdef_b_013_911E38)
    ENUN
    SOUN(0xB1)
    TILECHANGE(0)
    MOVE(0x10, 0x40, 7, 5)
    ENUN
    MOVE(0x10, 0x57, 8, 6)
    ENUN
    TILEREVERT(0)
    LOAD2(1, frontier_df3_unitdef_b_013_911E38 + 0x3C)
    ENUN
    MOVE_1STEP(0x10, 0x80, 1)
    ENUN
    MOVE_1STEP(0x10, 0x81, 0)
    ENUN
    MUSC(0x2E)
    CURSOR_CHAR(0x80)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x15)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(4, 0xC, 1)
    TEXTSHOW(0xAFD)
    TEXTEND
    GOTO(5)
    LABEL(4)
    TEXTSHOW(0xAFE)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    LABEL(5)
    REMA
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_2, 0x13)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(6, 0xC, 1)
    TEXTSHOW(0xAFF)
    TEXTEND
    GOTO(7)
    LABEL(6)
    MUSC(0x2D)
    TEXTSHOW(0xB00)
    TEXTEND
    LABEL(7)
    REMA
    FADI(0x10)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(8, 0xC, 1)
    CLEAN
    CAMERA(0, 0)
    MUSC(0x2D)
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_013_911E38 + 0x78)
    ENUN
    CURSOR_CHAR(0x57)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x13)
    SVAL(EVT_SLOT_3, 0xB01)
    CALL(Event_TextWithBG)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    SVAL(EVT_SLOT_2, 0x57)
    CALL(EventScr_UnitWarpOUT)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    LABEL(8)
    UNIT_COLORS(0)
    ENDA
};

