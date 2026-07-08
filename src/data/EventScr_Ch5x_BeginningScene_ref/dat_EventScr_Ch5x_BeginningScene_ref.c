#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch5x_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 HandleCh5xUnits_Start[];
extern const u8 UnitDef_Ch5xEnemy_1[];
extern const u8 UnitDef_Ch5xAlly_1[];
extern const u8 EventScr_SetBackground[];
extern const u8 Event_TextWithBG[];
extern const u8 UnitDef_Ch5xAlly_2[];
extern const u8 frontier_df4_banim_b_075_90A050[];
extern const u8 UnitDef_Event_Ch5xAlly[];

SECTION(".rodata.dat_EventScr_Ch5x_BeginningScene_ref") EventListScr EventScr_Ch5x_BeginningScene[] = {
    ASMC((u8 *)HandleCh5xUnits_Start + 1)
    MUSC(0x2E)
    SVAL(EVT_SLOT_B, 0x4000A)
    LOMA(8)
    FADU(0x10)
    BROWNBOXTEXT(0x5E9, 8, 8)
    CURSOR_AT(9, 4)
    STAL(0x3C)
    CURE
    FADI(0x10)
    SVAL(EVT_SLOT_B, 0x4000B)
    LOMA(9)
    LOAD1(1, UnitDef_Ch5xEnemy_1)
    ENUN
    FADU(0x10)
    SPAWN_ENEMY(0x43, 0xA, 0xA)
    MOVE(0x10, 0x43, 0xA, 4)
    ENUN
    MOVE(0x10, 0x4D, 9, 3)
    ENUN
    MOVE(0x10, 0x43, 0xA, 2)
    ENUN
    MOVE(0x10, 0x4D, 0xA, 3)
    ENUN
    CURSOR_CHAR(0x4D)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x997)
    TEXTEND
    REMA
    FADI(0x10)
    EvtBgmFadeIn(0x7FFF, 4)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0xC0014)
    LOMA(7)
    LOAD2(1, UnitDef_Ch5xAlly_1)
    ENUN
    FADU(0x10)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x2D)
    CALL((u8 *)EventScr_SetBackground)
    MUSC(0x25)
    TEXTSHOW(0x998)
    TEXTEND
    REMA
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x70009)
    LOMA(8)
    FADU(0x10)
    LOAD2(1, UnitDef_Ch5xAlly_2)
    ENUN
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x2C)
    SVAL(EVT_SLOT_3, 0x999)
    CALL((u8 *)Event_TextWithBG)
    MOVE(0, 0xF, 9, 4)
    STAL2(8)
    MOVE(0, 0x10, 9, 5)
    MOVE(0, 0x11, 8, 5)
    MOVE(0, 0x42, 8, 6)
    STAL2(8)
    FADI(0x10)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x7000E)
    LOMA(5)
    LOAD1(1, frontier_df4_banim_b_075_90A050)
    ENUN
    FADU(0x10)
    CURSOR_CHAR(0x6A)
    STAL(0x3C)
    CURE
    TEXTSHOW(0x99A)
    TEXTEND
    REMA
    CAMERA(0, 0x12)
    LOAD1(1, UnitDef_Event_Ch5xAlly)
    ENUN
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x15)
    CALL((u8 *)EventScr_SetBackground)
    TEXTSHOW(0x99B)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 2)
    ENDA
};

