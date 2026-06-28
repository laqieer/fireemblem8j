#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch15A_26.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 data_08A60354[];
extern const u8 data_085B9BBC[];

SECTION(".rodata.dat_EventScr_Ch15A_26_ref") EventListScr EventScr_Ch15A_26[] = {
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x49)
    CALL(data_08A60354 + 0xCC)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0, 0xC, 1)
    TEXTSHOW(0xAE8)
    TEXTEND
    REMA
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x4A)
    GIVEITEMTO(1)
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x93)
    GIVEITEMTO(1)
    GOTO(1)
    LABEL(0)
    TEXTSHOW(0xAE9)
    TEXTEND
    REMA
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x91)
    GIVEITEMTO(0xF)
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x3E)
    GIVEITEMTO(0xF)
    LABEL(1)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    CAMERA2(0xC, 5)
    CLEAN
    FADU(0x10)
    CURSOR_AT(8, 8)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x3B)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xAEA)
    TEXTEND
    MUSS(0x2D)
    STAL(0x21)
    TEXTCONT
    TEXTEND
    MURE(4)
    TEXTCONT
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    CHECK_ALIVE(0x17)
    BEQ(0x63, 0xC, 0)
    SVAL(EVT_SLOT_2, 0x3B)
    CALL(data_08A60354 + 0xCC)
    MUSC(0x2B)
    TEXTSHOW(0xAEB)
    TEXTEND
    REMA
    FADI(0x10)
    LABEL(0x63)
    ENDA
    MUSI
    EVENT_WORD(0x00020540)
};

