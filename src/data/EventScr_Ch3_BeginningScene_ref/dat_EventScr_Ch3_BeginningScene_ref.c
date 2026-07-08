#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch3_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A60354[];
extern const u8 UnitDef_Ch3Enemy_0[];
extern const u8 UnitDef_Event_Ch3Ally[];
extern const u8 EventScr_Ch3_0[];
extern const u8 EventScr_CallOnTutorialMode[];
extern const u8 EventScr_Ch3_5[];
extern const u8 EventScr_MoveUnitS2ToLeader[];
extern const u8 EventScr_Ch3_1[];
extern const u8 EventScr_Ch3_4[];

SECTION(".rodata.dat_EventScr_Ch3_BeginningScene_ref") EventListScr EventScr_Ch3_BeginningScene[] = {
    MUSC(0x25)
    SVAL(EVT_SLOT_2, 0x1E)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x94B)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x25)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x94C)
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    LOAD1(1, UnitDef_Ch3Enemy_0)
    ENUN
    FADU(0x10)
    LOAD2(1, UnitDef_Event_Ch3Ally)
    ENUN
    SVAL(EVT_SLOT_2, EventScr_Ch3_0)
    CALL(EventScr_CallOnTutorialMode)
    CHECK_TUTORIAL
    BNE(0, 0xC, 0)
    CURSOR_CHAR(8)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x94E)
    TEXTEND
    REMA
    LABEL(0)
    SVAL(EVT_SLOT_2, EventScr_Ch3_5)
    CALL(EventScr_CallOnTutorialMode)
    SVAL(EVT_SLOT_2, 2)
    CALL(EventScr_MoveUnitS2ToLeader)
    FADI(0x10)
    LOAD1(0, UnitDef_Event_Ch3Ally)
    ENUN
    CHECK_TUTORIAL
    BNE(1, 0xC, 0)
    GOTO(2)
    LABEL(1)
    MOVE(0xFFFF, 8, 3, 9)
    LABEL(2)
    CAMERA_CAHR(0x48)
    FADU(0x10)
    CHECK_TUTORIAL
    BNE(0xA, 0xC, 0)
    MUSC(0x13)
    CURSOR_CHAR(0x48)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x950)
    TEXTEND
    REMA
    LABEL(0xA)
    SVAL(EVT_SLOT_2, EventScr_Ch3_1)
    CALL(EventScr_CallOnTutorialMode)
    SVAL(EVT_SLOT_2, EventScr_Ch3_4)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

