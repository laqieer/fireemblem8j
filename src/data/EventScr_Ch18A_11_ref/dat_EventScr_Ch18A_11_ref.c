#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch18A_11.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A60354[];
extern const u8 UnitDef_Ch18AMixed[];
extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_Ch18A_11_ref") EventListScr EventScr_Ch18A_11[] = {
    MUSC(0x49)
    SVAL(EVT_SLOT_2, 0x4C)
    CALL(data_08A60354 + 0xCC)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0, 0xC, 1)
    TEXTSHOW(0xB3A)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    TEXTCONT
    TEXTEND
    MUSC(0x2C)
    TEXTCONT
    TEXTEND
    GOTO(1)
    LABEL(0)
    TEXTSHOW(0xB3B)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    TEXTCONT
    TEXTEND
    MUSC(0x2C)
    TEXTCONT
    TEXTEND
    LABEL(1)
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    CLEAN
    FADU(0x10)
    LOAD2(1, UnitDef_Ch18AMixed)
    ENUN
    MUSC(0x49)
    CURSOR_CHAR(0xC0)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x4C)
    SVAL(EVT_SLOT_3, 0xB3C)
    CALL(data_08A60354 + 0xF4)
    CAMERA2(0xC, 0xF)
    STAL(0x3C)
    CAMERA(0, 0x1B)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    MUSC(0x25)
    SVAL(EVT_SLOT_2, 0x4C)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xB3D)
    TEXTEND
    REMA
    FADI(0x10)
    CLEN
    CALL(data_085B9BBC + 0x200)
    ENUT(8)
    ENUT(0xA)
    ENUT(0xC)
    ENUT(0xE)
    EVBIT_T(7)
    ENDA
};

