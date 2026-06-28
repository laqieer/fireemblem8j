#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch13A_3.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch13AEnemy_3[];
extern const u8 data_08A60354[];
extern const u8 data_0890F2E0[];

SECTION(".rodata.dat_EventScr_Ch13A_3_ref") EventListScr EventScr_Ch13A_3[] = {
    MUSC(0x14)
    SVAL(EVT_SLOT_2, UnitDef_Ch13AEnemy_3)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, data_0890F2E0)
    CALL(data_08A60354 + 0x80)
    CURSOR_CHAR(0x4F)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA2F)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

