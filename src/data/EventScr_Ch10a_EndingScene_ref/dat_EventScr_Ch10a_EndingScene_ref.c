#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch10a_EndingScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_LoadUniqueAlly[];
extern const u8 EventScr_StrictLoadUniqueAlly[];
extern const u8 UnitDef_Ch10AEnemy_6[];
extern const u8 data_08A60354[];

SECTION(".rodata.dat_EventScr_Ch10a_EndingScene_ref") EventListScr EventScr_Ch10a_EndingScene[] = {
    FADI(0x10)
    SVAL(EVT_SLOT_2, 0xB)
    CALL(EventScr_LoadUniqueAlly)
    SVAL(EVT_SLOT_7, 2)
    CHECK_EXISTS(0x14)
    BEQ(0, 0xC, 0)
    CHECK_ALIVE(0x14)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_1, 1)
    SSUB(EVT_SLOT_7, EVT_SLOT_7, EVT_SLOT_1)
    LABEL(0)
    CHECK_EXISTS(0x15)
    BEQ(1, 0xC, 0)
    CHECK_ALIVE(0x15)
    BEQ(1, 0xC, 0)
    SVAL(EVT_SLOT_1, 1)
    SSUB(EVT_SLOT_7, EVT_SLOT_7, EVT_SLOT_1)
    LABEL(1)
    SVAL(EVT_SLOT_2, 0x14)
    CALL(EventScr_LoadUniqueAlly)
    SVAL(EVT_SLOT_2, 0x15)
    CALL(EventScr_LoadUniqueAlly)
    BEQ(2, 7, 0)
    SVAL(EVT_SLOT_1, 0)
    SET_HP(0x14)
    SVAL(EVT_SLOT_1, 0)
    SET_HP(0x15)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0x14)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0x15)
    REMU(0x14)
    REMU(0x15)
    LABEL(2)
    SVAL(EVT_SLOT_2, 0x16)
    CALL(EventScr_StrictLoadUniqueAlly)
    CLEA
    CLEE
    CLEN
    MUSC(0x2E)
    CAMERA(0, 0x1E)
    FADU(0x10)
    LOAD1(1, UnitDef_Ch10AEnemy_6)
    ENUN
    CURSOR_CHAR(0x43)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x25)
    SVAL(EVT_SLOT_3, 0x9F7)
    CALL(data_08A60354 + 0xF4)
    MOVE(0x10, 0x43, 3, 0x1E)
    SVAL(EVT_SLOT_B, 0x1B0002)
    STAL2(0x20)
    MOVE(0x10, 0xFFFE, 2, 0x1E)
    SVAL(EVT_SLOT_B, 0x1B0004)
    MOVE(0x10, 0xFFFE, 4, 0x1E)
    FADI(0x10)
    EvtBgmFadeIn(0x7FFF, 4)
    ENUN
    CLEA
    CLEE
    CLEN
    CAMERA(0x13, 0)
    FADU(0x10)
    CURSOR_AT(0xF, 1)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x13)
    CALL(data_08A60354 + 0xCC)
    MUSC(0x31)
    TEXTSHOW(0x9F8)
    TEXTEND
    REMA
    BNE(3, 7, 0)
    SVAL(EVT_SLOT_2, 0x15)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x9F9)
    TEXTEND
    REMA
    LABEL(3)
    SVAL(EVT_SLOT_2, 2)
    CALL(data_08A60354 + 0xCC)
    CHECK_ALIVE(0x15)
    BEQ(0xA, 0xC, 0)
    MUSI
    TEXTSHOW(0x9FA)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x25)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0x9FB)
    TEXTEND
    REMA
    MUNO
    GOTO(0xB)
    LABEL(0xA)
    TEXTSHOW(0x9FC)
    TEXTEND
    REMA
    LABEL(0xB)
    FADI(0x10)
    ENUT(0x72)
    MNCH(0x3D)
    ENDA
};

