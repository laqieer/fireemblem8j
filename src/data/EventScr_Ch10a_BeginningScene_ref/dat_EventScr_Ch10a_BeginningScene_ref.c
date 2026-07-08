#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch10a_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_9EEA58[];
extern const u8 frontier_df4_banim_b_077_90DB94[];
extern const u8 data_08A60354[];
extern const u8 UnitDef_Ch10ANPC[];
extern const u8 UnitDef_Ch10AEnemy_0[];
extern const u8 UnitDef_Ch10AEnemy_1[];
extern const u8 UnitDef_Ch10AAlly_0[];
extern const u8 UnitDef_Ch10AAlly_1[];
extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_Ch10a_BeginningScene_ref") EventListScr EventScr_Ch10a_BeginningScene[] = {
    MUSC(0x2E)
    SVAL(EVT_SLOT_2, 0x2000F)
    CALL(EventScr_9EEA58)
    LOAD1(1, frontier_df4_banim_b_077_90DB94 + 0x34)
    ENUN
    FADU(0x10)
    MOVE_1STEP(0x10, 0x69, 3)
    ENUN
    CURSOR_CHAR(0x6B)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x9EC)
    TEXTEND
    REMA
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    CAMERA2(9, 0xB)
    UNIT_COLORS(2)
    EvtSetLoadUnitNoREDA
    LOAD2(1, frontier_df4_banim_b_077_90DB94 + 0xD4)
    ENUN
    SVAL(EVT_SLOT_B, 0xD0007)
    TILECHANGE(0xFFFF)
    FADU(0x10)
    TILECHANGE(0)
    LOAD2(1, frontier_df4_banim_b_077_90DB94 + 0xD4)
    ENUN
    TILEREVERT(0)
    LOAD2(1, frontier_df4_banim_b_077_90DB94 + 0x110)
    ENUN
    CURSOR_CHAR(0x69)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x11)
    SVAL(EVT_SLOT_3, 0x9ED)
    CALL(data_08A60354 + 0xF4)
    LOAD2(1, frontier_df4_banim_b_077_90DB94 + 0x138)
    ENUN
    MUSI
    CURSOR_CHAR(0x43)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x11)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x9EE)
    TEXTEND
    REMA
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    UNIT_COLORS(0)
    SVAL(EVT_SLOT_B, 0x100007)
    LOMA(0xB)
    LOAD1(1, UnitDef_Ch10ANPC)
    ENUN
    LOAD1(1, UnitDef_Ch10AEnemy_0)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_Ch10AEnemy_1)
    SVAL(EVT_SLOT_3, 1)
    CALL(data_08A60354 + 0x2C)
    FADU(0x10)
    CURSOR_CHAR(0xB)
    STAL(0x3C)
    CURE
    MUSC(0x26)
    SVAL(EVT_SLOT_2, 0x39)
    SVAL(EVT_SLOT_3, 0x9EF)
    CALL(data_08A60354 + 0xF4)
    CAMERA(0, 0)
    LOAD2(1, UnitDef_Ch10AAlly_0)
    STAL2(0x20)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(1)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(2)
    LOAD3(0, UnitDef_Ch10AAlly_1)
    ENUN
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(1)
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(2)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x25)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x9F0)
    TEXTEND
    REMA
    CALL(data_085B9BBC + 0x200)
    ENUT(0xD)
    ENUT(0xE)
    ENDA
};

