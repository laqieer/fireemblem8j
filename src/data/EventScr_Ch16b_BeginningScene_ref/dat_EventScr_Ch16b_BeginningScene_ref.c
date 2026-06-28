#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch16b_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 frontier_df3_unitdef_b_042_91C230[];
extern const u8 frontier_df3_eventscr_ch_001_A696D4[];

SECTION(".rodata.dat_EventScr_Ch16b_BeginningScene_ref") EventListScr EventScr_Ch16b_BeginningScene[] = {
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_042_91C230)
    CALL(0x8A69704)
    ENUT(0xE)
    ENDA
    CALL(frontier_df3_eventscr_ch_001_A696D4 + 0x3E4)
    MNCH(0x1F)
    ENDA
    CALL(frontier_df3_eventscr_ch_001_A696D4 + 0x6BC)
    ENDA
    CALL(frontier_df3_eventscr_ch_001_A696D4 + 0x6E4)
    ENDA
    CALL(frontier_df3_eventscr_ch_001_A696D4 + 0x70C)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_042_91C230 + 0x208)
    EVENT_WORD(0x00000A40)
};

