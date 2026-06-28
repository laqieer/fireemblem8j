#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch5_5.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_Ch5_10[];
extern const u8 EventScr_CallOnTutorialMode[];
extern const u8 frontier_df4_banim_b_074_909DE8[];
extern const u8 data_08A60354[];

SECTION(".rodata.dat_EventScr_Ch5_5_ref") EventListScr EventScr_Ch5_5[] = {
    SVAL(EVT_SLOT_2, EventScr_Ch5_10)
    CALL(EventScr_CallOnTutorialMode)
    MUSC(0x13)
    SVAL(EVT_SLOT_2, frontier_df4_banim_b_074_909DE8)
    CALL(data_08A60354 + 0x58)
    CURSOR_AT(0xE, 0x10)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x985)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

