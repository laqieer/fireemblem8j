#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch11a_EndingScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_TextShowWithFadeIn[];
extern const u8 EventScr_SetBackground[];
extern const u8 EventScr_LoadUniqueAlly[];
extern const u8 frontier_df4_banim_b_078_90E58C[];
extern const u8 UnitDef_Ch11AMixed[];
extern const u8 UnitDef_Ch11AEnemy_5[];

SECTION(".rodata.dat_EventScr_Ch11a_EndingScene_ref") EventListScr EventScr_Ch11a_EndingScene[] = {
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x3B)
    CALL(EventScr_SetBackground)
    CHECK_ALIVE(0x19)
    BEQ(0, 0xC, 0)
    TEXTSHOW(0xA0B)
    TEXTEND
    GOTO(1)
    LABEL(0)
    TEXTSHOW(0xA0C)
    TEXTEND
    LABEL(1)
    FADI(4)
    REMA
    FADU(4)
    TEXTSHOW(0xA0D)
    TEXTEND
    CHECK_ALIVE(0x1A)
    BEQ(2, 0xC, 0)
    EvtTextShow2(0xA0E)
    TEXTEND
    LABEL(2)
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_LoadUniqueAlly)
    SVAL(EVT_SLOT_2, 0x1A)
    CALL(EventScr_LoadUniqueAlly)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0xA0000)
    LOMA(0x41)
    EvtChangeFogVision(0, 0)
    MUSC(0x4A)
    FADU(0x10)
    LOAD2(1, frontier_df4_banim_b_078_90E58C)
    ENUN
    DISA(0x18)
    STAL(0x1E)
    CURSOR_AT(2, 6)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 1)
    CALL(EventScr_SetBackground)
    MUSI
    TEXTSHOW(0xA0F)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 8)
    FADI(2)
    CLEAN
    EvtSetLoadUnitNoREDA
    LOAD2(1, UnitDef_Ch11AMixed)
    ENUN
    DISA(0x69)
    DISA(0x80)
    DISA(0x81)
    FADU(2)
    LOAD2(1, UnitDef_Ch11AMixed)
    ENUN
    CURSOR_CHAR(0x69)
    STAL(0x3C)
    CURE
    MUSC(0x2E)
    SVAL(EVT_SLOT_2, 0x25)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xA10)
    TEXTEND
    MUSC(0x28)
    TEXTCONT
    TEXTEND
    REMA
    CALL(EventScr_TextShowWithFadeIn)
    MOVE(0, 0x17, 0xD, 0)
    ENUN
    MOVE(0x10, 0xB, 0xD, 0)
    MOVE(0x10, 0x19, 0xD, 0)
    MOVE(0x10, 2, 0xD, 0)
    MOVE(0x10, 1, 0xD, 0)
    ENUN
    MOVE(0x10, 0x69, 8, 5)
    MOVE(0x10, 0x80, 7, 4)
    MOVE(0x10, 0x81, 9, 4)
    LOAD1(1, UnitDef_Ch11AEnemy_5)
    ENUN
    ENUN
    CURSOR_CHAR(0x43)
    STAL(0x3C)
    CURE
    MUSC(0x2E)
    SVAL(EVT_SLOT_2, 0x25)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xA11)
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    REMA
    CALL(EventScr_TextShowWithFadeIn)
    MOVE_1STEP(0, 0x43, 3)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x20000)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x16401)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SENQUEUE1
    FIGHT(0x69, 0x43, 0, 0)
    KILL(0x69)
    DISA_IF(0x69)
    CURSOR_CHAR(0x43)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA13)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x20087)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x20083)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x20003)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x80)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x20101)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x20001)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x81)
    STAL2(0xF)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x20086)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x20083)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x20003)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x66)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x20101)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x20001)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x67)
    ENUN
    CURSOR_CHAR(0x43)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA14)
    TEXTEND
    REMA
    ENUT(0x73)
    MNC2(0xC)
    ENDA
};

