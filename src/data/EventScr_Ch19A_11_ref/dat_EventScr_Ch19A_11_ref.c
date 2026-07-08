#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch19A_11.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_SetBackground[];
extern const u8 frontier_df3_unitdef_b_022_915038[];
extern const u8 frontier_df3_unitdef_b_022_915038_tail_p1[];
extern const u8 UnitDef_Ch19AAlly_5[];
extern const u8 frontier_df3_unitdef_b_023_91512C[];
extern const u8 frontier_df3_unitdef_b_021_914BD8[];
extern const u8 UnitDef_Ch19ANPC_3[];
extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_Ch19A_11_ref") EventListScr EventScr_Ch19A_11[] = {
    CHECK_OTHERS
    SADD(EVT_SLOT_7, EVT_SLOT_C, EVT_SLOT_0)
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0xF)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0, 0xC, 1)
    TEXTSHOW(0xB5C)
    TEXTEND
    GOTO(3)
    LABEL(0)
    CHECK_EVENTID(7)
    BNE(2, 0xC, 0)
    CHECK_ALIVE(0x22)
    BEQ(1, 0xC, 0)
    TEXTSHOW(0xB5D)
    TEXTEND
    GOTO(3)
    LABEL(1)
    TEXTSHOW(0xB5E)
    TEXTEND
    GOTO(3)
    LABEL(2)
    TEXTSHOW(0xB5F)
    TEXTEND
    LABEL(3)
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    EvtChangeFogVision(0, 0)
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x48)
    FADU(4)
    LOAD2(1, frontier_df3_unitdef_b_022_915038_tail_p1)
    ENUN
    SOUN(0xB1)
    TILECHANGE(0)
    LOAD2(1, UnitDef_Ch19AAlly_5)
    ENUN
    LOAD2(1, frontier_df3_unitdef_b_023_91512C)
    ENUN
    CURSOR_CHAR(0x19)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x46)
    CALL(EventScr_SetBackground)
    MUSC(0x2B)
    TEXTSHOW(0xB60)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0xA, 0xC, 1)
    SVAL(EVT_SLOT_B, 0x180000)
    LOMA(0x13)
    GOTO(0xB)
    LABEL(0xA)
    SVAL(EVT_SLOT_B, 0x180000)
    LOMA(0x20)
    LABEL(0xB)
    LOAD2(1, frontier_df3_unitdef_b_021_914BD8 + 0x35C)
    ENUN
    FADU(0x10)
    LOAD2(1, UnitDef_Ch19ANPC_3)
    ENUN
    CURSOR_CHAR(0xC8)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x17)
    CALL(EventScr_SetBackground)
    MUSC(0x31)
    TEXTSHOW(0xB61)
    TEXTEND
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0x14, 0xC, 1)
    EvtTextShow2(0xB62)
    TEXTEND
    GOTO(0x15)
    LABEL(0x14)
    EvtTextShow2(0xB63)
    TEXTEND
    LABEL(0x15)
    EvtTextShow2(0xB64)
    TEXTEND
    REMA
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x87)
    GIVEITEMTO(0)
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x8C)
    GIVEITEMTO(0)
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x2710)
    GIVEITEMTOMAIN(0)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0x1E, 0xC, 1)
    TEXTSHOW(0xB65)
    TEXTEND
    GOTO(0x1F)
    LABEL(0x1E)
    TEXTSHOW(0xB66)
    TEXTEND
    LABEL(0x1F)
    REMA
    SVAL(EVT_SLOT_8, 6)
    BLT(0x2A, 7, 8)
    SVAL(EVT_SLOT_2, 0x17)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0x28, 0xC, 1)
    TEXTSHOW(0xB67)
    TEXTEND
    GOTO(0x29)
    LABEL(0x28)
    TEXTSHOW(0xB68)
    TEXTEND
    LABEL(0x29)
    REMA
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x10)
    GIVEITEMTO(0)
    LABEL(0x2A)
    ENDA
};

