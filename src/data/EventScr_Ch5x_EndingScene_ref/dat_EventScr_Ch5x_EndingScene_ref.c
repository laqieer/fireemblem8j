#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch5x_EndingScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 HandleCh5xUnits_End[];
extern const u8 data_08A60354[];
extern const u8 UnitDef_Ch5xAlly_0[];
extern const u8 UnitDef_Ch5xEnemy_2[];
extern const u8 UnitDef_Ch5xAlly_3[];
extern const u8 UnitDef_Ch5xEnemy_3[];
extern const u8 UnitDef_Ch5xEnemy_4[];

SECTION(".rodata.dat_EventScr_Ch5x_EndingScene_ref") EventListScr EventScr_Ch5x_EndingScene[] = {
    ASMC(HandleCh5xUnits_End + 0x1)
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x15)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x9A1)
    TEXTEND
    REMA
    FADI(0x10)
    EvtBgmFadeIn(0x7FFF, 4)
    CLEA
    CLEE
    CLEN
    CLEAN
    CAMERA2(0xD, 9)
    EvtSetLoadUnitNoREDA
    LOAD2(1, UnitDef_Ch5xAlly_0)
    ENUN
    FADU(0x10)
    LOAD1(1, UnitDef_Ch5xAlly_0)
    ENUN
    CURSOR_CHAR(0x10)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x9A2)
    TEXTEND
    REMA
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x4000A)
    LOMA(8)
    LOAD1(1, UnitDef_Ch5xEnemy_2)
    ENUN
    FADU(0x10)
    EVBIT_T(9)
    LOAD2(1, UnitDef_Ch5xAlly_3)
    ENUN
    EVBIT_F(9)
    MUSC(0x26)
    LOAD1(1, UnitDef_Ch5xEnemy_3)
    ENUN
    LOAD1(1, UnitDef_Ch5xEnemy_4)
    ENUN
    CURSOR_CHAR(0x43)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x2C)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x9A3)
    TEXTEND
    REMA
    FADI(0x10)
    EvtBgmFadeIn(0x7FFF, 4)
    EVENT_WORD(0x0000A640)
    EVENT_WORD(0x00050000)
    MNCH(7)
    ENDA
};

