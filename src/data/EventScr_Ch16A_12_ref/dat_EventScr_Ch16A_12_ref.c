#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch16A_12.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_SetBackground[];
extern const u8 frontier_df3_unitdef_b_013_911E38[];
extern const u8 frontier_df3_unitdef_b_013_911E38_tail[];
extern const u8 UnitDef_Ch16AMixed_1[];
extern const u8 UnitDef_Ch16AAlly_0[];
extern const u8 frontier_df3_unitdef_b_015_91206C[];
extern const u8 UnitDef_Ch16AAlly_13[];
extern const u8 UnitDef_Ch16AAlly_1[];
extern const u8 StartMapEventcallFx2[];
extern const u8 UnitDef_Ch16AAlly_15[];
extern const u8 EventScr_Ch16A_1[];
extern const u8 frontier_df3_unitdef_b_016_912198[];
extern const u8 frontier_df3_unitdef_b_016_912198_residue[];
extern const u8 data_085B9BBC[];
extern const u8 frontier_df3_unitdef_b_010_9119D0[];
extern const u8 UnitDef_Ch16AAlly_3[];
extern const u8 UnitDef_Ch16AAlly_4[];

SECTION(".rodata.dat_EventScr_Ch16A_12_ref") EventListScr EventScr_Ch16A_12[] = {
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    MUSC(0x32)
    SVAL(EVT_SLOT_2, 0xF)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xB09)
    TEXTEND
    REMA
    FADI(0x10)
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x42)
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_013_911E38_tail)
    ENUN
    SOUN(0xB1)
    TILECHANGE(0)
    LOAD2(1, UnitDef_Ch16AMixed_1)
    ENUN
    CURSOR_CHAR(0xFB)
    STAL(0x3C)
    CURE
    EvtBgmFadeIn(0x7FFF, 4)
    SVAL(EVT_SLOT_2, 0x13)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xB0A)
    TEXTEND
    FADI(4)
    REMA
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x4000E)
    LOMA(0x10)
    EvtSetLoadUnitNoREDA
    LOAD2(1, UnitDef_Ch16AAlly_0)
    ENUN
    FADU(4)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    MUSC(0x31)
    TEXTSTART
    TEXTSHOW(0xB0B)
    TEXTEND
    REMA
    LOAD2(1, UnitDef_Ch16AAlly_0)
    ENUN
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB0C)
    TEXTEND
    REMA
    MOVE(0, 1, 0xC, 0xB)
    MOVE(0, 0xF, 0xE, 0xB)
    MOVE(0, 2, 0xD, 0xB)
    STAL2(0x14)
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    ENUN
    CLEA
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x43)
    LOAD2(1, frontier_df3_unitdef_b_015_91206C + 0x14)
    ENUN
    MUSC(0x95)
    FADU(0x10)
    LOAD2(1, UnitDef_Ch16AAlly_13)
    SOLOTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x400008)
    TEXTSHOW(0xB0D)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_B, 0x580030)
    TEXTSHOW(0xB0E)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_B, 0x480080)
    TEXTSHOW(0xB0F)
    TEXTEND
    REMA
    ENUN
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xF)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xB10)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    STAL(0x3C)
    SVAL(EVT_SLOT_B, 0x4000E)
    LOMA(0x10)
    EvtSetLoadUnitNoREDA
    LOAD2(1, UnitDef_Ch16AAlly_1)
    ENUN
    FADU(0x10)
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB11)
    TEXTEND
    REMA
    STARTFADE
    EvtColorFadeSetup(6, 0xA, 4, 0x80, 0x80, 0x80)
    ASMC2(StartMapEventcallFx2 + 0x1)
    SVAL(EVT_SLOT_B, 0x3000D)
    TILECHANGE(0xFFFF)
    SVAL(EVT_SLOT_B, 0x3000E)
    TILECHANGE(0xFFFF)
    EvtColorFadeSetup(6, 0xA, 4, 0x100, 0x100, 0x100)
    EVBIT_T(6)
    LOAD2(1, UnitDef_Ch16AAlly_1)
    STAL(0x14)
    FADI(4)
    ENUN
    EVBIT_F(6)
    CLEA
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x47)
    FADU(0x10)
    LOAD2(1, UnitDef_Ch16AAlly_15)
    ENUN
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x45)
    CALL(EventScr_SetBackground)
    EvtBgmFadeIn(0x2B, 6)
    TEXTSHOW(0xB12)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 6)
    FADI(4)
    REMA
    CLEAN
    FADU(4)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x45)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xB13)
    TEXTEND
    SOUN(0x2EB)
    FAWI(4)
    REMA
    SVAL(EVT_SLOT_2, 0x45)
    CALL(EventScr_Ch16A_1)
    EvtBgmFadeIn(0x2B, 6)
    REMOVEPORTRAITS
    TEXTSHOW(0xB14)
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    FADU(4)
    LOAD2(1, frontier_df3_unitdef_b_016_912198_residue)
    ENUN
    SOUN(0xB1)
    TILECHANGE(0)
    LOAD2(1, frontier_df3_unitdef_b_016_912198 + 0x3C)
    ENUN
    SOUN(0xB1)
    TILECHANGE(1)
    LOAD2(1, frontier_df3_unitdef_b_016_912198 + 0x64)
    ENUN
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x45)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xB15)
    TEXTEND
    REMA
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x92)
    GIVEITEMTO(0xF)
    TEXTSHOW(0xB16)
    TEXTEND
    REMA
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x85)
    GIVEITEMTO(1)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0, 0xC, 1)
    TEXTSHOW(0xB17)
    TEXTEND
    GOTO(1)
    LABEL(0)
    TEXTSHOW(0xB18)
    TEXTEND
    LABEL(1)
    FADI(0x10)
    REMA
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x4000E)
    LOMA(0x10)
    SVAL(EVT_SLOT_B, 0x3000D)
    TILECHANGE(0xFFFF)
    SVAL(EVT_SLOT_B, 0x3000E)
    TILECHANGE(0xFFFF)
    LOAD2(1, frontier_df3_unitdef_b_010_9119D0)
    ENUN
    FADU(0x10)
    LOAD2(1, UnitDef_Ch16AAlly_3)
    ENUN
    SVAL(EVT_SLOT_B, 0x3000D)
    TILEREVERT(0xFFFF)
    SVAL(EVT_SLOT_B, 0x3000E)
    TILEREVERT(0xFFFF)
    CURSOR_CHAR(0x19)
    STAL(0x3C)
    CURE
    MUSC(0x31)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0xA, 0xC, 1)
    TEXTSTART
    TEXTSHOW(0xB19)
    TEXTEND
    REMA
    GOTO(0xB)
    LABEL(0xA)
    TEXTSTART
    TEXTSHOW(0xB1A)
    TEXTEND
    REMA
    LABEL(0xB)
    LOAD2(1, UnitDef_Ch16AAlly_4)
    ENUN
    FADI(0x10)
    ENUN
    ENDA
};

