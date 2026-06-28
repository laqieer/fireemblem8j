#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch10B_0.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 frontier_df3_unitdef_b_027_917600[];
extern const u8 data_08A60354[];
extern const u8 frontier_df3_unitdef_b_026_916D14[];

SECTION(".rodata.dat_EventScr_Ch10B_0_ref") EventListScr EventScr_Ch10B_0[] = {
    MUSC(0x14)
    CAMERA2(0xF, 0xB)
    STAL(0xF)
    LOAD1(1, frontier_df3_unitdef_b_027_917600 + 0x208)
    ENUN
    DISA(0x43)
    CURSOR_AT(0x13, 0xB)
    STAL(0x3C)
    CURE
    MUSI
    SVAL(EVT_SLOT_2, 0x17)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA7A)
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    DISA(0x44)
    FADU(0x10)
    LOAD1(1, frontier_df3_unitdef_b_027_917600 + 0x230)
    ENUN
    DISA(0x44)
    LOAD1(1, frontier_df3_unitdef_b_027_917600 + 0x258)
    ENUN
    LOAD1(1, frontier_df3_unitdef_b_026_916D14 + 0x5B8)
    ENUN
    CURSOR_CHAR(0x43)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA7B)
    TEXTEND
    REMA
    MUNO
    MOVE(0x10, 0x43, 0x17, 0xE)
    ENUN
    DISA(0x43)
    EVBIT_T(7)
    ENDA
};

