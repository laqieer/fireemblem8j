#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch7_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 frontier_df4_banim_b_076_90B4DC[];
extern const u8 UnitDef_Event_Ch7Ally[];
extern const u8 data_08A60354[];
extern const u8 data_085B9BBC[];
extern const u8 EventScr_Ch7_3[];
extern const u8 EventScr_CallOnTutorialMode[];

SECTION(".rodata.dat_EventScr_Ch7_BeginningScene_ref") EventListScr EventScr_Ch7_BeginningScene[] = {
    MUSC(0x25)
    LOAD1(1, frontier_df4_banim_b_076_90B4DC)
    ENUN
    FADU(0x10)
    LOAD3(0, UnitDef_Event_Ch7Ally)
    ENUN
    STAL(0xF)
    CAMERA2(9, 4)
    CURSOR_AT(9, 4)
    STAL(0x3C)
    CURE
    CAMERA(0, 0x15)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x2C)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x9B7)
    TEXTEND
    CHECK_ALIVE(4)
    BEQ(0, 0xC, 0)
    EvtTextShow2(0x9B8)
    TEXTEND
    LABEL(0)
    CHECK_ALIVE(3)
    BEQ(1, 0xC, 0)
    CHECK_ALIVE(5)
    BEQ(1, 0xC, 0)
    CHECK_ALIVE(6)
    BEQ(1, 0xC, 0)
    EvtTextShow2(0x9B9)
    TEXTEND
    LABEL(1)
    CHECK_ALIVE(7)
    BEQ(2, 0xC, 0)
    CHECK_ALIVE(0xA)
    BEQ(2, 0xC, 0)
    EvtTextShow2(0x9BA)
    TEXTEND
    LABEL(2)
    CHECK_ALIVE(9)
    BEQ(3, 0xC, 0)
    CHECK_ALIVE(8)
    BEQ(3, 0xC, 0)
    EvtTextShow2(0x9BB)
    TEXTEND
    LABEL(3)
    CHECK_ALIVE(0xC)
    BEQ(4, 0xC, 0)
    CHECK_ALIVE(0x13)
    BEQ(4, 0xC, 0)
    EvtTextShow2(0x9BC)
    TEXTEND
    LABEL(4)
    CHECK_ALIVE(0x20)
    BEQ(5, 0xC, 0)
    EvtTextShow2(0x9BD)
    TEXTEND
    LABEL(5)
    CHECK_ALIVE(0xD)
    BEQ(6, 0xC, 0)
    EvtTextShow2(0x9BE)
    TEXTEND
    LABEL(6)
    EvtTextShow2(0x9BF)
    TEXTEND
    CALL(data_085B9BBC + 0x200)
    MUSC(9)
    FADU(0x10)
    SVAL(EVT_SLOT_2, EventScr_Ch7_3)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

