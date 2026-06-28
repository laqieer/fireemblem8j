#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch12B_1.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_UnitWarpIN[];
extern const u8 EventScr_UnitWarpOUT[];
extern const u8 UnitDef_Ch12BEnemy_1[];
extern const u8 data_08A60354[];
extern const u8 UnitDef_Ch12BEnemy_2[];
extern const u8 frontier_df3_unitdef_b_032_91908C[];
extern const u8 UnitDef_Ch12BEnemy_4[];

SECTION(".rodata.dat_EventScr_Ch12B_1_ref") EventListScr EventScr_Ch12B_1[] = {
    CAMERA_CAHR(0x53)
    SPAWN_ENEMY(0x57, 0, 0)
    SVAL(EVT_SLOT_2, 0x57)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 0x11, 1)
    CALL(EventScr_UnitWarpIN)
    CURSOR_CHAR(0x53)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xAA2)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x57)
    CALL(EventScr_UnitWarpOUT)
    DISA(0x57)
    MOVE(0x18, 0x53, 0x11, 0)
    ENUN
    DISA(0x53)
    MOVE(0x18, 0x81, 0x10, 0)
    MOVE(0x18, 0x82, 0x12, 0)
    ENUN
    DISA(0x81)
    DISA(0x82)
    SVAL(EVT_SLOT_2, UnitDef_Ch12BEnemy_1)
    CALL((u8 *)data_08A60354 + 0x58)
    STAL2(0x1E)
    SVAL(EVT_SLOT_2, UnitDef_Ch12BEnemy_2)
    CALL((u8 *)data_08A60354 + 0x58)
    STAL2(0x1E)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_032_91908C)
    CALL((u8 *)data_08A60354 + 0x58)
    STAL2(0x1E)
    SVAL(EVT_SLOT_2, UnitDef_Ch12BEnemy_4)
    CALL((u8 *)data_08A60354 + 0x58)
    STAL2(0x1E)
    CAMERA_CAHR(0xF)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xAA3)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

