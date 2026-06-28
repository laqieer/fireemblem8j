#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch9a_EndingScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A60354[];
extern const u8 UnitDef_Ch9AMixed_1[];
extern const u8 data_0890C824[];
extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_Ch9a_EndingScene_ref") EventListScr EventScr_Ch9a_EndingScene[] = {
    MUSC(0x32)
    SVAL(EVT_SLOT_2, 0xC)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x9E3)
    TEXTEND
    REMA
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    CLEAN
    CAMERA2(0x14, 7)
    EvtSetLoadUnitNoREDA
    LOAD2(1, UnitDef_Ch9AMixed_1)
    ENUN
    FADU(0x10)
    LOAD2(1, UnitDef_Ch9AMixed_1)
    ENUN
    MOVE_1STEP(0, 0xA7, 2)
    ENUN
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xC)
    SVAL(EVT_SLOT_3, 0x9E4)
    CALL(data_08A60354 + 0xF4)
    EvtBgmFadeIn(0x7FFF, 4)
    MOVE_1STEP(0x10, 2, 3)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x301D4)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x30014)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0xA7)
    ENUN
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    MUSC(0x28)
    SVAL(EVT_SLOT_2, 0xC)
    SVAL(EVT_SLOT_3, 0x9E5)
    CALL(data_08A60354 + 0xF4)
    LOAD2(1, data_0890C824)
    ENUN
    CURSOR_CHAR(0xCC)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xC)
    CALL(data_08A60354 + 0xCC)
    MUSC(0x26)
    TEXTSHOW(0x9E6)
    TEXTEND
    REMA
    CHECK_EVENTID(8)
    BEQ(0, 0xC, 0)
    CHECK_EVENTID(9)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_2, 0xC)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x9E7)
    TEXTEND
    REMA
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x5B)
    GIVEITEMTO(0)
    LABEL(0)
    ENUT(0x71)
    MNCH(0xB)
    ENDA
};

