#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Prologue_RenaisThroneCutscene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Event_PrologueThroneRoomUnits[];
extern const u8 data_08908354[];
extern const u8 UnitDef_Event_PrologueGradoShamans[];
extern const u8 UnitDef_Event_PrologueGradoCavalry[];
extern const u8 UnitDef_Event_PrologueEscapees[];
extern const u8 data_08A60354[];
extern const u8 UnitDef_Event_PrologueValterGroup[];

SECTION(".rodata.dat_EventScr_Prologue_RenaisThroneCutscene_ref") EventListScr EventScr_Prologue_RenaisThroneCutscene[] = {
    SVAL(EVT_SLOT_B, 0xA000E)
    LOMA(0x10)
    LOAD2(1, UnitDef_Event_PrologueThroneRoomUnits)
    ENUN
    FADU(0x10)
    MUSC(0x26)
    BROWNBOXTEXT(0x5F6, 8, 8)
    LOAD1(1, data_08908354)
    ENUN
    CAMERA(0xE, 0)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x8C3)
    TEXTEND
    REMA
    MOVE(0, 0xF, 0xD, 0xB)
    ENUN
    DISA(0xF)
    MOVE_1STEP(0, 1, 0)
    ENUN
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x8C4)
    TEXTEND
    REMA
    MOVEONTO(0, 2, 1)
    ENUN
    DISA(1)
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x8C5)
    TEXTEND
    REMA
    MOVE(0, 2, 0xD, 0xB)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x10C)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x2CC)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(4)
    ENUN
    DISA(2)
    DISA(4)
    MOVE(0, 5, 0xB, 4)
    MOVE(0, 6, 0xF, 4)
    ENUN
    MOVE_1STEP(0, 5, 1)
    MOVE_1STEP(0, 6, 0)
    ENUN
    LOAD1(1, UnitDef_Event_PrologueGradoShamans)
    ENUN
    LOAD1(1, UnitDef_Event_PrologueGradoCavalry)
    ENUN
    LOAD1(1, data_08908354 + 0x28)
    ENUN
    CURSOR_CHAR(0xC5)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x8C6)
    TEXTEND
    FADI(2)
    REMA
    EVBIT_F(2)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x40)
    FADU(0x10)
    LOAD2(1, UnitDef_Event_PrologueEscapees)
    ENUN
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x25)
    SVAL(EVT_SLOT_3, 0x8C7)
    CALL(data_08A60354 + 0xF4)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x104)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x84)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x80)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(4)
    ENUN
    DISA(4)
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x25)
    SVAL(EVT_SLOT_3, 0x8C8)
    CALL(data_08A60354 + 0xF4)
    LOAD1(1, UnitDef_Event_PrologueValterGroup)
    ENUN
    MOVE_1STEP(0, 2, 1)
    ENUN
    MOVE_1STEP(0, 1, 0)
    ENUN
    CURSOR_CHAR(0x45)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x25)
    SVAL(EVT_SLOT_3, 0x8C9)
    CALL(data_08A60354 + 0xF4)
    MOVE_1STEP(0, 0x45, 0)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x20000)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SENQUEUE1
    FIGHT(2, 0x45, 0, 0)
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x8CB)
    TEXTEND
    REMA
    MOVE_1STEP(8, 2, 0)
    ENUN
    DISA(1)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x18104)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x18084)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x18080)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(2)
    ENUN
    DISA(2)
    CURSOR_CHAR(0x45)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x8CC)
    TEXTEND
    REMA
    FADI(0x10)
    EVBIT_F(2)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0)
    LOMA(0)
    FADU(0x10)
    ENDA
};

