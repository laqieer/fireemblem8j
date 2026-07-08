#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch8_10.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch8Ally_2[];
extern const u8 UnitDef_Ch8Ally_3[];
extern const u8 EventScr_SetBackground[];

SECTION(".rodata.dat_EventScr_Ch8_10_ref") EventListScr EventScr_Ch8_10[] = {
    CAMERA(0xE, 0x14)
    LOAD2(1, UnitDef_Ch8Ally_2)
    ENUN
    MUSC(0x4C)
    FADU(0x10)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xA)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xBC2)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 8)
    FAWI(2)
    REMA
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x14000E)
    LOMA(0x4E)
    UNIT_COLORS(4)
    LOAD2(1, UnitDef_Ch8Ally_3)
    ENUN
    EvtBgmFadeIn(0x2C, 8)
    FAWU(2)
    BROWNBOXTEXT(0x196, 8, 8)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    REMOVEPORTRAITS
    FAWI(0x10)
    BACG(0xB)
    FAWU(0x10)
    TEXTSHOW(0xBC3)
    TEXTEND
    REMA
    FAWI(0x10)
    CLEAN
    FAWU(0x10)
    MOVE(0, 1, 0, 0x10)
    STAL2(0x20)
    FAWI(0x10)
    ENUN
    CLEA
    CLEE
    CLEN
    REMOVEPORTRAITS
    BACG(0xB)
    FAWU(0x10)
    TEXTSHOW(0xBC4)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 8)
    FAWI(2)
    REMA
    SVAL(EVT_SLOT_B, 0x14000E)
    LOMA(6)
    UNIT_COLORS(0)
    LOAD2(1, UnitDef_Ch8Ally_2)
    ENUN
    MUSC(0x4C)
    FAWU(2)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xA)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xBC5)
    TEXTEND
    REMA
    MNCH(0x38)
    ENDB
};

