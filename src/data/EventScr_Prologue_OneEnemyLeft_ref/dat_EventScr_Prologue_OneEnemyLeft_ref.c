#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Prologue_OneEnemyLeft.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 banim_pekf_sp1_sheet_0[];

SECTION(".rodata.dat_EventScr_Prologue_OneEnemyLeft_ref") EventListScr EventScr_Prologue_OneEnemyLeft[] = {
    CHECK_ENEMIES
    SVAL(EVT_SLOT_7, 1)
    BNE(0, 0xC, 7)
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    TEXTSTART
    EVENT_WORD_SYM(banim_pekf_sp1_sheet_0 + 0x98)
    TEXTEND
    REMA
    ENUF(8)
    GOTO(1)
    LABEL(0)
    CHECK_TRIG_EVENTID
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    ENUF(0xFFFF)
    LABEL(1)
    EVBIT_T(7)
    ENDA
};

