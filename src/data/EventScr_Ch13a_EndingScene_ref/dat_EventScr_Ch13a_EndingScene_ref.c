#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch13a_EndingScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_TextShowWithFadeIn[];
extern const u8 EventScr_SetBackground[];
extern const u8 UnitDef_Ch13ANPC[];
extern const u8 data_085B9BBC[];
extern const u8 frontier_df3_unitdef_b_000_90F678[];

SECTION(".rodata.dat_EventScr_Ch13a_EndingScene_ref") EventListScr EventScr_Ch13a_EndingScene[] = {
    CHECK_EVENTID(2)
    BNE(0, 0xC, 0)
    CAMERA_CAHR(0x51)
    CURSOR_CHAR(0x51)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x23)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xA36)
    TEXTEND
    GOTO(1)
    LABEL(0)
    SVAL(EVT_SLOT_2, 0x23)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xA37)
    TEXTEND
    LABEL(1)
    REMA
    FADI(0x10)
    CLEE
    CLEAN
    CAMERA(0x17, 0)
    FADU(0x10)
    LOAD1(1, UnitDef_Ch13ANPC)
    ENUN
    CURSOR_CHAR(0xC8)
    STAL(0x3C)
    CURE
    MUSC(0xF)
    TEXTSTART
    TEXTSHOW(0xA38)
    TEXTEND
    REMA
    CAMERA_CAHR(1)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x23)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xA39)
    TEXTEND
    REMA
    FADI(0x10)
    SVAL(EVT_SLOT_2, 0x23)
    CALL(EventScr_SetBackground)
    MUSS(0x31)
    STAL(0x21)
    CHECK_ALIVE(0x1A)
    BEQ(0xA, 0xC, 0)
    TEXTSHOW(0xA3A)
    TEXTEND
    REMA
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x1388)
    GIVEITEMTOMAIN(0)
    TEXTSHOW(0xA3B)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    TEXTCONT
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    GOTO(0xB)
    LABEL(0xA)
    TEXTSHOW(0xA3C)
    TEXTEND
    REMA
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x1388)
    GIVEITEMTOMAIN(0)
    TEXTSHOW(0xA3D)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    TEXTCONT
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    LABEL(0xB)
    REMA
    FADI(4)
    CLEA
    CLEE
    CLEN
    CHECK_EVENTID(2)
    BNE(0x63, 0xC, 0)
    SVAL(EVT_SLOT_B, 0)
    LOMA(0xF)
    LOAD1(1, frontier_df3_unitdef_b_000_90F678 + 0x940)
    ENUN
    FADU(4)
    LOAD1(1, frontier_df3_unitdef_b_000_90F678 + 0x968)
    ENUN
    SVAL(EVT_SLOT_1, 5)
    SET_HP(0x51)
    CURSOR_CHAR(0x53)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x49)
    CALL(EventScr_SetBackground)
    MUSC(0x2E)
    TEXTSHOW(0xA3E)
    TEXTEND
    REMA
    CALL(EventScr_TextShowWithFadeIn)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x10000)
    SENQUEUE1
    FIGHT_MAP(0x53, 0x51, 0, 0)
    FADI(4)
    LABEL(0x63)
    ENUT(0x75)
    MNCH(0xE)
    ENDA
};

