#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch14A_0.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 frontier_df3_unitdef_b_003_91066C[];
extern const u8 frontier_df3_unitdef_b_003_91066C_residue[];
extern const u8 UnitDef_Ch14AEnemy_6[];

SECTION(".rodata.dat_EventScr_Ch14A_0_ref") EventListScr EventScr_Ch14A_0[] = {
    CAMERA2(9, 7)
    LOAD1(1, frontier_df3_unitdef_b_003_91066C_residue)
    ENUN
    CURSOR_CHAR(0x53)
    STAL(0x3C)
    CURE
    MUSC(0x26)
    TEXTSTART
    TEXTSHOW(0xA46)
    TEXTEND
    REMA
    MOVEONTO(0, 0x53, 0xCB)
    ENUN
    MOVE_1STEP(8, 0xCB, 2)
    MOVE_1STEP(0, 0x52, 1)
    ENUN
    CURSOR_CHAR(0x53)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA47)
    TEXTEND
    REMA
    MOVE_1STEP(0, 0x52, 0)
    ENUN
    MOVEONTO(0, 0x53, 0xCB)
    ENUN
    DISA(0xCB)
    STAL(0x10)
    MOVE(0, 0x53, 9, 8)
    ENUN
    CURSOR_CHAR(0x53)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA48)
    TEXTEND
    REMA
    MOVEONTO(0, 0x53, 0x40)
    ENUN
    DISA(0x40)
    MOVE(0, 0x53, 0x11, 0xB)
    ENUN
    DISA(0x53)
    CAMERA2(9, 6)
    MOVE(0, 0x52, 9, 5)
    LOAD1(1, UnitDef_Ch14AEnemy_6)
    ENUN
    EVBIT_T(7)
    ENDA
};

