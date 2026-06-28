#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch21b_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 frontier_df3_eventscr_ch_005_A6B460[];
extern const u8 UnitDef_Ch21BEnemy_1[];
extern const u8 InitTowerDungeonState[];
extern const u8 EventScr_ConfigHardModeLoadUnitHard[];

SECTION(".rodata.dat_EventScr_Ch21b_BeginningScene_ref") EventListScr EventScr_Ch21b_BeginningScene[] = {
    CALL(frontier_df3_eventscr_ch_005_A6B460 + 0x12C)
    ENDA
    CALL(UnitDef_Ch21BEnemy_1)
    MNC4
    ENDA
    ASMC(InitTowerDungeonState + 0x1)
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x32)
};

