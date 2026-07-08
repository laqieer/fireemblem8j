#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch3_Turn1Npc.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch3NPC[];
extern const u8 EventScr_Ch3_2[];
extern const u8 EventScr_Ch3_3[];
extern const u8 EventScr_CallOnTutorialMode[];

SECTION(".rodata.dat_EventScr_Ch3_Turn1Npc_ref") EventListScr EventScr_Ch3_Turn1Npc[] = {
    CAMERA(0, 0)
    STAL(0xF)
    LOAD1(1, UnitDef_Ch3NPC)
    ENUN
    MUSC(0xF)
    CURSOR_CHAR(9)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x952)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, EventScr_Ch3_2)
    CALL(EventScr_CallOnTutorialMode)
    MOVE_CLOSEST(0, 9, 2, 4)
    ENUN
    SVAL(EVT_SLOT_2, EventScr_Ch3_3)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

