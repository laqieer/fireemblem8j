#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch14b_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_SetBackground[];
extern const u8 Event_TextWithBG[];
extern const u8 EventScr_UnitWarpIN[];
extern const u8 EventScr_UnitWarpOUT[];
extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_Ch14b_BeginningScene_ref") EventListScr EventScr_Ch14b_BeginningScene[] = {
    LOAD1(1, 0x891B3BC)
    ENUN
    REMU(0x53)
    LOAD1(1, 0x891BA74)
    ENUN
    CAMERA(0, 0x15)
    CLEAN
    MUSC(0x25)
    FADU(0x10)
    LOAD2(1, 0x891B984)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0xF)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(2)
    LOAD3(0, 0x891B9C0)
    ENUN
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(0xF)
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(2)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x49)
    CALL((u8 *)EventScr_SetBackground)
    TEXTSHOW(0xADA)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    CLEAN
    CAMERA(0, 0)
    FADU(0x10)
    SPAWN_ENEMY(0x40, 0x17, 0)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 5, 2)
    CALL(EventScr_UnitWarpIN)
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    MUSC(0x2E)
    SVAL(EVT_SLOT_2, 0x49)
    SVAL(EVT_SLOT_3, 0xADB)
    CALL((u8 *)Event_TextWithBG)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(0x40)
    MOVE_1STEP(0, 0x66, 3)
    ENUN
    MOVEONTO(0, 0x66, 0x53)
    ENUN
    LOAD1(1, 0x891B718)
    ENUN
    ENUN
    REVEAL(0x53)
    DISA(0x66)
    FADI(0x10)
    CALL((u8 *)data_085B9BBC + 0x200)
    CAMERA2(0xC, 7)
    FADU(0x10)
    MUSC(0x26)
    LOAD1(1, 0x891B768)
    ENUN
    REVEAL(1)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x49)
    SVAL(EVT_SLOT_3, 0xADD)
    CALL((u8 *)Event_TextWithBG)
    EVBIT_T(7)
    ENDA
};

