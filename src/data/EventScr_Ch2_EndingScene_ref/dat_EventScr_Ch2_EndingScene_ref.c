#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch2_EndingScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_SetBackground[];
extern const u8 EventScr_LoadUniqueAlly[];
extern const u8 EventScr_StrictLoadUniqueAlly[];

SECTION(".rodata.dat_EventScr_Ch2_EndingScene_ref") EventListScr EventScr_Ch2_EndingScene[] = {
    MUSC(0x31)
    CHECK_ALIVE(0xA)
    BEQ(0, 0xC, 0)
    CHECK_ALIVE(7)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_2, 0x25)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x922)
    TEXTEND
    REMA
    FADI(0x10)
    SVAL(EVT_SLOT_2, 0xA)
    CALL(EventScr_LoadUniqueAlly)
    SVAL(EVT_SLOT_2, 7)
    CALL(EventScr_LoadUniqueAlly)
    LABEL(0)
    SVAL(EVT_SLOT_2, 6)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x923)
    TEXTEND
    FADI(4)
    EvtBgmFadeIn(0x7FFF, 6)
    REMA
    REMOVEPORTRAITS
    BACG(0x29)
    FADU(2)
    TEXTSHOW(0x924)
    TEXTEND
    FAWI(2)
    REMA
    BACG(0x1C)
    FAWU(2)
    MUSC(0x52)
    BROWNBOXTEXT(0x198, 8, 8)
    TEXTSHOW(0x925)
    TEXTEND
    FAWI(2)
    EvtBgmFadeIn(0x7FFF, 8)
    REMA
    BACG(0x29)
    FAWU(2)
    EvtBgmFadeIn(0x4A, 8)
    TEXTSHOW(0x926)
    TEXTEND
    REMA
    FADI(0x10)
    ENUT(0xD0)
    ENUT(0xE8)
    ENUT(0xBC)
    ENUT(0xB8)
    ENUT(0xC5)
    ENUT(0xB8)
    ENUT(0xC0)
    ENUT(0xC4)
    ENUT(0xCA)
    ENUT(0xDE)
    ENUT(0xDA)
    ENUT(0xCB)
    MNCH(3)
    SVAL(EVT_SLOT_2, 7)
    CALL(EventScr_StrictLoadUniqueAlly)
    SVAL(EVT_SLOT_2, 0xA)
    CALL(EventScr_StrictLoadUniqueAlly)
    ENDA
};

