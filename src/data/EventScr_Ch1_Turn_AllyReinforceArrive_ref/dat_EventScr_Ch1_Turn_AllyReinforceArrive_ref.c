#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch1_Turn_AllyReinforceArrive.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Event_Ch1AllyReinforce[];
extern const u8 EventScr_Ch1Tut_GilliamBattle[];
extern const u8 EventScr_CallOnTutorialMode[];

SECTION(".rodata.dat_EventScr_Ch1_Turn_AllyReinforceArrive_ref") EventListScr EventScr_Ch1_Turn_AllyReinforceArrive[] = {
    MUSC(0x54)
    LOAD1(1, UnitDef_Event_Ch1AllyReinforce)
    ENUN
    CURSOR_CHAR(4)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x8F1)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, EventScr_Ch1Tut_GilliamBattle)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

