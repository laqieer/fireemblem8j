#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch9A_4.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_Ch9a_EndingScene[];

SECTION(".rodata.dat_EventScr_Ch9A_4_ref") EventListScr EventScr_Ch9A_4[] = {
    CHECK_ALIVE(0x12)
    BEQ(0, 0xC, 0)
    CHECK_ALLEGIANCE(0x12)
    SVAL(EVT_SLOT_1, 0)
    BEQ(0, 0xC, 1)
    CAMERA_CAHR(0x12)
    CURSOR_CHAR(0x12)
    STAL(0x3C)
    CURE
    MUSS(0x14)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0x9E0)
    TEXTEND
    REMA
    MOVE(0x18, 0x12, 2, 0x17)
    MOVE(0x18, 0x83, 2, 0x17)
    MOVE(0x18, 0x84, 2, 0x17)
    MOVE(0x18, 0x85, 2, 0x17)
    ENUN
    DISA(0x12)
    DISA(0x83)
    DISA(0x84)
    DISA(0x85)
    CHECK_ENEMIES
    BNE(0, 0xC, 0)
    CALL(EventScr_Ch9a_EndingScene)
    ENDB
};

