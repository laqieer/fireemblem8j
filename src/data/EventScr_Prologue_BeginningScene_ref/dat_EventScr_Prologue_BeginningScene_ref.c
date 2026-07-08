#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Prologue_BeginningScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_Prologue_RenaisThroneCutscene[];
extern const u8 EventScr_Prologue_EirikaAttacked[];
extern const u8 EventScr_Prologue_ExecTut[];
extern const u8 EventScr_CallOnTutorialMode[];
extern const u8 BmGuideTextSetAllGreen[];
extern const u8 frontier_df4_banim_b_073_907F78[];
extern const u8 data_08A60354[];
extern const u8 EventScr_Prologue_GiveRapier[];
extern const u8 EventScr_Prologue_ONeillSpawn[];

SECTION(".rodata.dat_EventScr_Prologue_BeginningScene_ref") EventListScr EventScr_Prologue_BeginningScene[] = {
    CALL(EventScr_Prologue_RenaisThroneCutscene)
    SVAL(EVT_SLOT_2, EventScr_Prologue_EirikaAttacked)
    CALL(EventScr_CallOnTutorialMode)
    CHECK_TUTORIAL
    BNE(0, 0xC, 0)
    ASMC(BmGuideTextSetAllGreen + 0x1)
    LABEL(0)
    ENUT(8)
    LOAD1(1, frontier_df4_banim_b_073_907F78 + 0x224)
    ENUN
    SVAL(EVT_SLOT_1, 0xD)
    SET_HP(2)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    MUSI
    SVAL(EVT_SLOT_2, 0x25)
    SVAL(EVT_SLOT_3, 0x8CD)
    CALL(data_08A60354 + 0xF4)
    MUNO
    MOVE(0x18, 2, 4, 4)
    ENUN
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0x8CE)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, EventScr_Prologue_ExecTut)
    CALL(EventScr_CallOnTutorialMode)
    MOVE_CLOSEST(0, 1, 4, 5)
    ENUN
    CALL(EventScr_Prologue_GiveRapier)
    CALL(EventScr_Prologue_ONeillSpawn)
    EVBIT_T(7)
    ENDA
};

