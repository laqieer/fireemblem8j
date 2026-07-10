#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch18b_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 frontier_df3_unitdef_b_047_91E280[];
extern const u8 UnitDef_Ch19BNPC_1[];

extern const u8 frontier_df3_eventscr_ch_002_A6A06C[];

SECTION(".rodata.dat_EventScr_Ch18b_BeginningScene_ref") EventListScr EventScr_Ch18b_BeginningScene[] = {
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_047_91E280 + 0x3E8)
    SVAL(EVT_SLOT_3, UnitDef_Ch19BNPC_1)
    SVAL(EVT_SLOT_4, frontier_df3_unitdef_b_047_91E280)
    CALL(frontier_df3_eventscr_ch_002_A6A06C + 0x374)
    EVBIT_T(7)
    ENDA
    CAMERA_CAHR(0xF)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    MUSC(0x11)
    EVENT_WORD(0x00020540)
};

