#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch20b_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_Ch21A_8[];
extern const u8 EventScr_UnitWarpOUT[];
extern const u8 UnitDef_Ch21BEnemy_0[];
extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_Ch20b_BeginningScene_ref") EventListScr EventScr_Ch20b_BeginningScene[] = {
    CALL(EventScr_Ch21A_8)
    SVAL(EVT_SLOT_2, 0x6C)
    CALL(EventScr_UnitWarpOUT)
    DISA(0x6C)
    FADI(0x10)
    LOAD1(1, UnitDef_Ch21BEnemy_0)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENUT(0xB)
    ENUT(0xC)
    ENUT(0xD)
    ENDA
};

