#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch5_EndingScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_StrictLoadUniqueAlly[];
extern const u8 data_08A60354[];
extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_Ch5_EndingScene_ref") EventListScr EventScr_Ch5_EndingScene[] = {
    FADI(0x10)
    SVAL(EVT_SLOT_2, 0x20)
    CALL(EventScr_StrictLoadUniqueAlly)
    SVAL(EVT_SLOT_2, 0xA)
    CALL(data_08A60354 + 0xCC)
    CHECK_ALIVE(0xD)
    BEQ(0, 0xC, 0)
    MUSC(0x31)
    TEXTSHOW(0x989)
    TEXTEND
    GOTO(1)
    LABEL(0)
    MUSC(0x32)
    TEXTSHOW(0x98A)
    TEXTEND
    LABEL(1)
    REMA
    CHECK_EVENTID(8)
    BEQ(2, 0xC, 0)
    CHECK_EVENTID(9)
    BEQ(2, 0xC, 0)
    CHECK_EVENTID(0xA)
    BEQ(2, 0xC, 0)
    CHECK_EVENTID(0xB)
    BEQ(2, 0xC, 0)
    SVAL(EVT_SLOT_2, 0xA)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x98B)
    TEXTEND
    REMA
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x68)
    GIVEITEMTO(0)
    LABEL(2)
    ENUT(0xDB)
    ENUT(0xBD)
    ENUT(0xBB)
    ENUT(0xCC)
    ENUT(0xEA)
    MNC2(5)
    EVENT_WORD(0x0000A640)
    EVENT_WORD(0x00080000)
    ENDA
};

