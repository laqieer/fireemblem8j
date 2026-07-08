#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch8_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch8Ally_1[];
extern const u8 EventScr_LoadUnitForTutorial[];
extern const u8 EventScr_TextShowWithFadeIn[];
extern const u8 EventScr_SetBackground[];
extern const u8 Event_TextWithBG[];
extern const u8 UnitDef_Ch8Enemy_3[];
extern const u8 UnitDef_Ch8Enemy_0[];
extern const u8 UnitDef_Ch8Enemy_4[];
extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_Ch8_BeginningScene_ref") EventListScr EventScr_Ch8_BeginningScene[] = {
    MUSC(0x25)
    LOAD2(1, UnitDef_Ch8Ally_1)
    ENUN
    CURSOR_CHAR(0x42)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x15)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9C9)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    TEXTCONT
    TEXTEND
    CALL(EventScr_TextShowWithFadeIn)
    LOAD1(1, UnitDef_Ch8Enemy_3)
    ENUN
    CURSOR_CHAR(0x4D)
    STAL(0x3C)
    CURE
    MUSC(0x26)
    TEXTSTART
    TEXTSHOW(0x9CA)
    TEXTEND
    REMA
    STAL(0x1E)
    CUSE(0x42)
    CURSOR_CHAR(0x42)
    STAL(0x3C)
    CURE
    MOVE(0, 0x42, 0x14, 0x13)
    SVAL(EVT_SLOT_B, 0x100014)
    MOVE_1STEP(0, 0xFFFE, 1)
    ENUN
    MOVE(0, 0x42, 0x14, 0xF)
    ENUN
    SVAL(EVT_SLOT_B, 0x100015)
    MOVE_1STEP(0, 0xFFFE, 0)
    MOVE(0, 0x42, 0x13, 0xA)
    ENUN
    DISA(0x42)
    CURSOR_CHAR(0x4D)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x15)
    SVAL(EVT_SLOT_3, 0x9CB)
    CALL(Event_TextWithBG)
    SVAL(EVT_SLOT_B, 0x100013)
    MOVE_1STEP(0, 0xFFFE, 0)
    ENUN
    MOVE(0, 0x4D, 0x13, 0xE)
    ENUN
    SVAL(EVT_SLOT_B, 0x100012)
    MOVE_1STEP(0, 0xFFFE, 1)
    ENUN
    MOVE(0, 0x4D, 0x13, 0xE)
    ENUN
    CURSOR_CHAR(0x4D)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x9CC)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_B, 0x150014)
    SOUN(0xAB)
    TILECHANGE(0xFFFF)
    MOVE(0, 0x4D, 0x13, 0xA)
    SVAL(EVT_SLOT_B, 0x100013)
    MOVE(0x10, 0xFFFE, 0x13, 0xB)
    SVAL(EVT_SLOT_B, 0x100014)
    MOVE(0x10, 0xFFFE, 0x14, 0xB)
    ENUN
    CLEE
    LOAD1(1, UnitDef_Ch8Enemy_0)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_Ch8Enemy_4)
    SVAL(EVT_SLOT_3, 1)
    CALL(EventScr_LoadUnitForTutorial)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x15)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9CD)
    TEXTEND
    REMA
    CALL(data_085B9BBC + 0x200)
    ENUT(0xC)
    ENDA
};

