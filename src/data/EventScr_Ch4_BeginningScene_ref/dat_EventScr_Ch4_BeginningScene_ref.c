#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch4_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 UnitDef_Ch4Ally_0[];
extern const u8 data_08A60354[];
extern const u8 UnitDef_Ch4Enemy_0[];
extern const u8 EventScr_Ch4_7[];
extern const u8 EventScr_CallOnTutorialMode[];
extern const u8 UnitDef_Ch4Ally_1[];
extern const u8 EventScr_Ch4_8[];
extern const u8 EventScr_Ch4_9[];
extern const u8 data_085B9BBC[];
extern const u8 EventScr_Ch4_10[];

SECTION(".rodata.dat_EventScr_Ch4_BeginningScene_ref") EventListScr EventScr_Ch4_BeginningScene[] = {
    LOAD2(1, UnitDef_Ch4Ally_0)
    ENUN
    MUSC(0x52)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x2E)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x963)
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    LOAD1(1, UnitDef_Ch4Enemy_0)
    ENUN
    FADU(0x10)
    MUSC(0x25)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x964)
    TEXTEND
    REMA
    FADI(0x10)
    CAMERA(0, 0xE)
    FADU(0x10)
    MUSI
    CURSOR_AT(1, 0xB)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 2)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x965)
    TEXTEND
    REMA
    MUNO
    SVAL(EVT_SLOT_2, EventScr_Ch4_7)
    CALL(EventScr_CallOnTutorialMode)
    FADI(0x10)
    CLEAN
    CAMERA(0, 0)
    FADU(0x10)
    LOAD1(1, UnitDef_Ch4Ally_1)
    ENUN
    CURSOR_CHAR(0x13)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x966)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_B, 0x6000B)
    MOVE(0, 0xFFFE, 9, 3)
    ENUN
    CURSOR_CHAR(0x13)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x967)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10000)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x30009)
    FIGHT(0x13, 0xFFFF, 0x3F, 0)
    SVAL(EVT_SLOT_B, 0x30009)
    KILL(0xFFFE)
    DISA_IF(0xFFFE)
    SVAL(EVT_SLOT_2, EventScr_Ch4_8)
    CALL(EventScr_CallOnTutorialMode)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x968)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, EventScr_Ch4_9)
    CALL(EventScr_CallOnTutorialMode)
    CALL(data_085B9BBC + 0x200)
    CAMERA(0, 0)
    FADU(0x10)
    MUSC(9)
    CURSOR_CHAR(0x13)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x969)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, EventScr_Ch4_10)
    CALL(EventScr_CallOnTutorialMode)
    ENUT(8)
    EVBIT_T(7)
    ENDA
};

