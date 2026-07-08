#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch6_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_TextShowWithFadeIn[];
extern const u8 EventScr_SetBackground[];
extern const u8 Event_TextWithBG[];
extern const u8 UnitDef_Ch6Ally_0[];
extern const u8 UnitDef_Ch6Mixed[];
extern const u8 EventScr_UnitWarpIN[];
extern const u8 EventScr_UnitWarpOUT[];
extern const u8 EventScr_Ch6_2[];
extern const u8 EventScr_CallOnTutorialMode[];
extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_Ch6_BeginningScene_ref") EventListScr EventScr_Ch6_BeginningScene[] = {
    MUSC(0x2E)
    SVAL(EVT_SLOT_2, 0x22)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9A4)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 6)
    CALL(EventScr_TextShowWithFadeIn)
    EVBIT_T(9)
    LOAD2(1, UnitDef_Ch6Ally_0)
    ENUN
    EVBIT_F(9)
    CAMERA2(7, 7)
    LOAD1(1, UnitDef_Ch6Mixed)
    ENUN
    SVAL(EVT_SLOT_2, 0x4B)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 5, 8)
    CALL(EventScr_UnitWarpIN)
    SVAL(EVT_SLOT_2, 0xF9)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 6, 8)
    CALL(EventScr_UnitWarpIN)
    MOVE_1STEP(0, 1, 0)
    MOVE_1STEP(0, 2, 0)
    ENUN
    CURSOR_CHAR(0x4B)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x22)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9A5)
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x22)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9A6)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x22)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9A7)
    TEXTEND
    REMA
    CALL(EventScr_TextShowWithFadeIn)
    MOVE(0xFFFF, 0xFB, 0x14, 5)
    SVAL(EVT_SLOT_2, 0x4B)
    CALL(EventScr_UnitWarpOUT)
    SVAL(EVT_SLOT_2, 0xF9)
    CALL(EventScr_UnitWarpOUT)
    CAMERA2(0x13, 5)
    SVAL(EVT_SLOT_2, 0x4B)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 0x13, 6)
    CALL(EventScr_UnitWarpIN)
    SVAL(EVT_SLOT_2, 0xF9)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 0x14, 6)
    CALL(EventScr_UnitWarpIN)
    CURSOR_CHAR(0x4B)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x27)
    SVAL(EVT_SLOT_3, 0x9A8)
    CALL(Event_TextWithBG)
    STAL(0x3C)
    SVAL(EVT_SLOT_2, 0xF9)
    CALL(EventScr_UnitWarpOUT)
    SVAL(EVT_SLOT_2, 0xFB)
    CALL(EventScr_UnitWarpOUT)
    CAMERA2(0x15, 0xB)
    SVAL(EVT_SLOT_2, 0xF9)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 0x1A, 0xC)
    CALL(EventScr_UnitWarpIN)
    SVAL(EVT_SLOT_2, 0xFB)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 0x19, 0xC)
    CALL(EventScr_UnitWarpIN)
    CURSOR_CHAR(0xF9)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x27)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9A9)
    TEXTEND
    REMA
    FADI(0x10)
    SVAL(EVT_SLOT_2, EventScr_Ch6_2)
    CALL(EventScr_CallOnTutorialMode)
    CALL(data_085B9BBC + 0x200)
    ENDA
};

