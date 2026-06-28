#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_FloorClearInTower.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 DisplayMapClearMapAnim[];
extern const u8 StartRetreatProcessing[];
extern const u8 UnlockPostgameAllyByEnemyCount[];

SECTION(".rodata.dat_EventScr_FloorClearInTower_ref") EventListScr EventScr_FloorClearInTower[] = {
    EVBIT_MODIFY(4)
    ASMC(DisplayMapClearMapAnim + 0x1)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0x8BF)
    TEXTEND
    SVAL(EVT_SLOT_7, 1)
    BEQ(0, 0xC, 7)
    MNCH(0xFFFF)
    ASMC(StartRetreatProcessing + 0x1)
    GOTO(1)
    LABEL(0)
    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    MNC3(0xFFFF)
    ASMC(UnlockPostgameAllyByEnemyCount + 0x1)
    LABEL(1)
    ENDA
};

