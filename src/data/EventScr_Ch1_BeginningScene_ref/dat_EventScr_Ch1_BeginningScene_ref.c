#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch1_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Event_Ch1Enemy[];
extern const u8 Event_TextWithBG[];
extern const u8 UnitDef_Event_Ch1NPC[];
extern const u8 EventScr_Ch1Tut_GuideWTA[];
extern const u8 EventScr_CallOnTutorialMode[];
extern const u8 UnitDef_Event_Ch1Ally[];
extern const u8 EventScr_MoveUnitS2ToLeader[];
extern const u8 EventScr_Ch1Tut_OnBeginning[];

SECTION(".rodata.dat_EventScr_Ch1_BeginningScene_ref") EventListScr EventScr_Ch1_BeginningScene[] = {
    MUSC(0x25)
    LOAD1(1, UnitDef_Event_Ch1Enemy)
    ENUN
    STAL2(0x3C)
    CURSOR_AT(2, 2)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x39)
    SVAL(EVT_SLOT_3, 0x8E9)
    CALL(Event_TextWithBG)
    LOAD1(1, UnitDef_Event_Ch1NPC)
    ENUN
    SVAL(EVT_SLOT_B, 0)
    DISA(0xFFFE)
    CURSOR_CHAR(0x46)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x8EA)
    CALL(Event_TextWithBG)
    MOVE(0, 0x46, 2, 3)
    ENUN
    ENUT(1)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x11400)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SENQUEUE1
    FIGHT(0x46, 0xC0, 0, 0)
    ENUF(1)
    SVAL(EVT_SLOT_B, 0x20002)
    KILL(0xFFFE)
    DISA_IF(0xFFFE)
    CURSOR_CHAR(0x46)
    STAL(0x3C)
    CURE
    TEXTSHOW(0x8EB)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, EventScr_Ch1Tut_GuideWTA)
    CALL(EventScr_CallOnTutorialMode)
    MOVE(0, 0x46, 2, 2)
    SVAL(EVT_SLOT_B, 0x60001)
    MOVE(0x18, 0xFFFE, 1, 3)
    SVAL(EVT_SLOT_B, 0x60003)
    MOVE(0x18, 0xFFFE, 3, 3)
    SVAL(EVT_SLOT_B, 0x80001)
    MOVE(0x18, 0xFFFE, 9, 5)
    SVAL(EVT_SLOT_B, 0x70002)
    MOVE(0x18, 0xFFFE, 8, 3)
    SVAL(EVT_SLOT_B, 0x80003)
    MOVE(0x18, 0xFFFE, 4, 7)
    SVAL(EVT_SLOT_B, 0x90002)
    MOVE(0x18, 0xFFFE, 2, 8)
    ENUN
    STAL2(0x3C)
    CURSOR_AT(2, 2)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x39)
    SVAL(EVT_SLOT_3, 0x8EC)
    CALL(Event_TextWithBG)
    REMA
    LOAD2(1, UnitDef_Event_Ch1Ally)
    ENUN
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x8ED)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 2)
    CALL(EventScr_MoveUnitS2ToLeader)
    SVAL(EVT_SLOT_2, EventScr_Ch1Tut_OnBeginning)
    CALL(EventScr_CallOnTutorialMode)
    ENUT(0xB)
    EVBIT_T(7)
    ENDA
};

