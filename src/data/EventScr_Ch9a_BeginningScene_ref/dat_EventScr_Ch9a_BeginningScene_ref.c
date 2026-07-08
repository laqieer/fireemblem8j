#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch9a_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_Ch8_11[];
extern const u8 UnitDef_Ch9AAlly_2[];
extern const u8 data_0890C9BC[];
extern const u8 EventScr_LoadUnitForTutorial[];
extern const u8 EventScr_SetBackground[];
extern const u8 Event_TextWithBG[];
extern const u8 UnitDef_Ch9AAlly_0[];
extern const u8 UnitDef_Ch9AMixed_0[];
extern const u8 UnitDef_Ch9AEnemy_10[];
extern const u8 UnitDef_Ch9AEnemy_0[];
extern const u8 UnitDef_Ch9AEnemy_1[];
extern const u8 UnitDef_Event_Ch9aAlly[];
extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_Ch9a_BeginningScene_ref") EventListScr EventScr_Ch9a_BeginningScene[] = {
    MUSC(0x2E)
    SVAL(EVT_SLOT_2, 0x9D7)
    SVAL(EVT_SLOT_3, 0x9D8)
    SVAL(EVT_SLOT_4, 0x9D9)
    CALL(EventScr_Ch8_11)
    EvtBgmFadeIn(0x7FFF, 4)
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x45)
    CHECK_EXISTS(0x22)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0x22)
    LABEL(0)
    SVAL(EVT_SLOT_1, 1)
    SET_STATE(1)
    LOAD3(0, UnitDef_Ch9AAlly_2)
    ENUN
    FADU(0x10)
    LOAD2(1, data_0890C9BC + 0x14)
    ENUN
    MOVE_1STEP(0, 1, 0)
    ENUN
    CURSOR_CHAR(0x22)
    STAL(0x3C)
    CURE
    MUSC(0x24)
    SVAL(EVT_SLOT_2, 0x24)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9DA)
    TEXTEND
    REMA
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x40012)
    LOMA(0xA)
    FADU(0x10)
    LOAD2(1, UnitDef_Ch9AAlly_0)
    ENUN
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xC)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9DB)
    TEXTEND
    MUSI
    TEXTCONT
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    FADU(0x10)
    LOAD2(1, UnitDef_Ch9AMixed_0)
    ENUN
    CURSOR_CHAR(0x19)
    STAL(0x3C)
    CURE
    MUSS(0x2A)
    STAL(0x21)
    SVAL(EVT_SLOT_2, 0xC)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9DC)
    TEXTEND
    MURE(4)
    TEXTCONT
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    FADU(0x10)
    MOVE(0, 0x19, 9, 2)
    STAL2(0x10)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x91)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x89)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x1A)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x93)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x89)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x1C)
    ENUN
    CLEN
    MOVE_1STEP(0x10, 1, 0)
    ENUN
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x9DD)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    CAMERA2(0xE, 4)
    LOAD1(1, UnitDef_Ch9AEnemy_10)
    ENUN
    MOVE_1STEP(0, 2, 0)
    ENUN
    CURSOR_CHAR(0xC5)
    STAL(0x3C)
    CURE
    MUSC(0x26)
    SVAL(EVT_SLOT_2, 0xC)
    SVAL(EVT_SLOT_3, 0x9DE)
    CALL(Event_TextWithBG)
    LOAD1(1, UnitDef_Ch9AEnemy_0)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_Ch9AEnemy_1)
    SVAL(EVT_SLOT_3, 1)
    CALL(EventScr_LoadUnitForTutorial)
    FADI(0x10)
    DISA(0xC5)
    CLEA
    LOAD1(0, UnitDef_Event_Ch9aAlly)
    ENUN
    SVAL(EVT_SLOT_1, 1)
    SET_STATE(0x22)
    CALL(data_085B9BBC + 0x200)
    ENDA
};

