#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch10A_8.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch10AEnemy_5[];
extern const u8 data_08A60354[];
extern const u8 UnitDef_Ch10AEnemy_3[];
extern const u8 UnitDef_Ch10AEnemy_4[];

SECTION(".rodata.dat_EventScr_Ch10A_8_ref") EventListScr EventScr_Ch10A_8[] = {
    CHECK_TUTORIAL
    BNE(0, 0xC, 0)
    CHECK_HARD
    BEQ(0, 0xC, 0)
    CAMERA(0, 0xA)
    SVAL(EVT_SLOT_2, UnitDef_Ch10AEnemy_5)
    CALL(data_08A60354 + 0x80)
    LABEL(0)
    SVAL(EVT_SLOT_2, UnitDef_Ch10AEnemy_3)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, UnitDef_Ch10AEnemy_4)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
};

