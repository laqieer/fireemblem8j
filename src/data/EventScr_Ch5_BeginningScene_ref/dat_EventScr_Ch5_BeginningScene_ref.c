#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch5_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_Ch8_10[];
extern const u8 frontier_df4_banim_b_074_909DE8[];
extern const u8 data_08A60354[];
extern const u8 UnitDef_Ch5Enemy_0[];
extern const u8 UnitDef_Ch5Enemy_1[];
extern const u8 UnitDef_Event_Ch4Ally[];
extern const u8 data_085B9BBC[];
extern const u8 EventScr_Ch5_11[];
extern const u8 EventScr_CallOnTutorialMode[];
extern const u8 EventScr_Ch5_8[];

SECTION(".rodata.dat_EventScr_Ch5_BeginningScene_ref") EventListScr EventScr_Ch5_BeginningScene[] = {
    CHECK_EVENTID(0x88)
    BEQ(0x8020, 0xC, 0)
    CALL(EventScr_Ch8_10)
    LABEL(0x8020)
    MUSC(0x25)
    EvtSetLoadUnitNoREDA
    LOAD2(1, frontier_df4_banim_b_074_909DE8 + 0xDC)
    ENUN
    SVAL(EVT_SLOT_2, 0xA)
    SVAL(EVT_SLOT_3, 0x97A)
    CALL(data_08A60354 + 0xF4)
    DISA(0x20)
    LOAD2(1, frontier_df4_banim_b_074_909DE8 + 0xDC)
    ENUN
    CURSOR_CHAR(0x20)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xA)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x97B)
    TEXTEND
    REMA
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    CLEAN
    MUSC(0x2E)
    LOAD1(1, frontier_df4_banim_b_074_909DE8 + 0x118)
    ENUN
    FADU(0x10)
    CURSOR_CHAR(0x69)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xA)
    SVAL(EVT_SLOT_3, 0x97C)
    CALL(data_08A60354 + 0xF4)
    MOVE(0, 0x4A, 9, 4)
    ENUN
    MOVE_1STEP(0x10, 0xE, 3)
    ENUN
    CURSOR_CHAR(0x69)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xA)
    SVAL(EVT_SLOT_3, 0x97D)
    CALL(data_08A60354 + 0xF4)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x1C9)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1CB)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10B)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x69)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x1C8)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1CB)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10B)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0xE)
    STAL2(0x1E)
    FADI(0x10)
    EvtBgmFadeIn(0x7FFF, 4)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_2, 0x2F)
    CALL(data_08A60354 + 0xCC)
    MUSC(0x24)
    TEXTSHOW(0x97E)
    TEXTEND
    MUSI
    TEXTCONT
    TEXTEND
    REMA
    MUNO
    TEXTSHOW(0x97F)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    STAL3(0x20)
    TEXTCONT
    TEXTEND
    REMA
    CALL(data_08A60354 + 0xA8)
    LOAD1(1, frontier_df4_banim_b_074_909DE8 + 0x168)
    ENUN
    LOAD1(1, UnitDef_Ch5Enemy_0)
    ENUN
    MUSC(0x26)
    TEXTSTART
    TEXTSHOW(0x980)
    TEXTEND
    REMA
    LOAD1(1, UnitDef_Ch5Enemy_1)
    ENUN
    ENUN
    CAMERA2(7, 0xE)
    LOAD2(1, frontier_df4_banim_b_074_909DE8 + 0x190)
    ENUN
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x981)
    TEXTEND
    REMA
    MOVE(0, 0xD, 6, 0xF)
    ENUN
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x982)
    TEXTEND
    REMA
    FADI(0x10)
    EvtBgmFadeIn(0x7FFF, 4)
    LOAD1(0, UnitDef_Event_Ch4Ally)
    ENUN
    CALL(data_085B9BBC + 0x200)
    FADU(0x10)
    CAMERA(0, 0)
    MUSC(0x13)
    CURSOR_AT(0xC, 6)
    STAL(0x3C)
    CURE
    LOAD1(1, frontier_df4_banim_b_074_909DE8 + 0xB4)
    ENUN
    MOVE(0, 0x20, 9, 7)
    ENUN
    CURSOR_CHAR(0x20)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x983)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, EventScr_Ch5_11)
    CALL(EventScr_CallOnTutorialMode)
    CAMERA(5, 0x12)
    MUSC(9)
    CURSOR_CHAR(0xD)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x984)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, EventScr_Ch5_8)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

