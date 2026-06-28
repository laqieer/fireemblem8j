#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch1Tut_OnBeginning.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 battle_terrain_maruta1_tileset[];

SECTION(".rodata.dat_EventScr_Ch1Tut_OnBeginning_ref") EventListScr EventScr_Ch1Tut_OnBeginning[] = {
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0x903)
    TEXTEND
    REMA
    ENUT(0xB6)
    ENUT(0xD7)
    TEXTSTART
    EVENT_WORD_SYM(battle_terrain_maruta1_tileset + 0x8)
    TEXTEND
    REMA
    ENDA
};

