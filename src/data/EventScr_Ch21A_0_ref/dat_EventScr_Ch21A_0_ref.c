#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch21A_0.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch21AMixed[];
extern const u8 EventScr_Ch21A_9[];

SECTION(".rodata.dat_EventScr_Ch21A_0_ref") EventListScr EventScr_Ch21A_0[] = {
    EvtBgmFadeIn(0x7FFF, 6)
    FADI(4)
    CLEA
    CLEE
    CLEN
    CAMERA2(0xB, 4)
    EvtSetLoadUnitNoREDA
    LOAD2(1, UnitDef_Ch21AMixed)
    ENUN
    FADU(4)
    LOAD2(1, UnitDef_Ch21AMixed)
    ENUN
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB85)
    TEXTEND
    EvtBgmFadeIn(0x44, 6)
    TEXTCONT
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    CALL(EventScr_Ch21A_9)
    MNC3(0x16)
    ENDA
};

