#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch2_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A60354[];
extern const u8 data_08908958[];
extern const u8 UnitDef_Ch2Enemy_0[];
extern const u8 data_08A62808[];
extern const u8 EventScr_CallOnTutorialMode[];
extern const u8 UnitDef_Event_Ch2Ally[];

SECTION(".rodata.dat_EventScr_Ch2_BeginningScene_ref") EventListScr EventScr_Ch2_BeginningScene[] = {
    MUSC(0x24)
    SVAL(EVT_SLOT_2, 0x1E)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x914)
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    FADU(0x10)
    LOAD1(1, data_08908958 + 0x3C)
    ENUN
    EvtBgmFadeIn(0x7FFF, 4)
    LOAD1(1, UnitDef_Ch2Enemy_0)
    ENUN
    LOAD1(1, data_08908958 + 0xDC)
    ENUN
    STAL2(0x3C)
    MUSC(0x1A)
    CURSOR_CHAR(0x47)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x915)
    TEXTEND
    REMA
    MOVE(0x18, 0x48, 0xE, 9)
    ENUN
    DISA(0x48)
    CURSOR_AT(0xC, 3)
    STAL(0x3C)
    CURE
    MUSC(0x25)
    SVAL(EVT_SLOT_2, 2)
    SVAL(EVT_SLOT_3, 0x916)
    CALL(data_08A60354 + 0xF4)
    CURSOR_CHAR(0x47)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x917)
    TEXTEND
    REMA
    MOVE(0x18, 0x47, 9, 0xE)
    ENUN
    SVAL(EVT_SLOT_B, 0x5000C)
    MOVE(0, 0xFFFE, 0xC, 3)
    ENUN
    SOUN(0xAB)
    SVAL(EVT_SLOT_B, 0x2000C)
    TILECHANGE(0xFFFF)
    SOUN(0x5C)
    NOTIFY(0x6E2, 0)
    LOAD1(1, data_08908958 + 0x64)
    ENUN
    SVAL(EVT_SLOT_1, 5)
    SET_HP(7)
    CURSOR_CHAR(7)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x25)
    SVAL(EVT_SLOT_3, 0x918)
    CALL(data_08A60354 + 0xF4)
    SVAL(EVT_SLOT_2, data_08A62808 + 0xC0)
    CALL(EventScr_CallOnTutorialMode)
    LOAD1(0, UnitDef_Event_Ch2Ally)
    ENUN
    CURSOR_CHAR(6)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x919)
    TEXTEND
    REMA
    MOVE(0x18, 6, 2, 3)
    ENUN
    CURSOR_CHAR(6)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x91A)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, data_08A62808 + 0xE0)
    CALL(EventScr_CallOnTutorialMode)
    CURSOR_CHAR(5)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x91B)
    TEXTEND
    REMA
    MOVE(0x18, 6, 6, 3)
    ENUN
    EVBIT_T(7)
    ENDA
};

