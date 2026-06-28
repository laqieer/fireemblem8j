#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch8_11.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_9EEA58[];
extern const u8 UnitDef_Ch9AEnemy_11[];

SECTION(".rodata.dat_EventScr_Ch8_11_ref") EventListScr EventScr_Ch8_11[] = {
    SADD(EVT_SLOT_7, EVT_SLOT_2, EVT_SLOT_0)
    SADD(EVT_SLOT_8, EVT_SLOT_3, EVT_SLOT_0)
    SADD(EVT_SLOT_9, EVT_SLOT_4, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x2000F)
    CALL(EventScr_9EEA58)
    TILECHANGE(0)
    LOAD1(1, UnitDef_Ch9AEnemy_11)
    ENUN
    FADU(0x10)
    CURSOR_CHAR(0x6B)
    STAL(0x3C)
    CURE
    SADD(EVT_SLOT_2, EVT_SLOT_7, EVT_SLOT_0)
    TEXTSTART
    TEXTSHOW(0xFFFF)
    TEXTEND
    REMA
    MOVE(0x10, 0x69, 0xD, 0xA)
    MOVE(0x10, 0x43, 0xF, 0xA)
    MOVE(0x10, 0x53, 0xD, 5)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x10151)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1014F)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x57)
    ENUN
    DISA(0x69)
    DISA(0x43)
    CURSOR_CHAR(0x6B)
    STAL(0x3C)
    CURE
    SADD(EVT_SLOT_2, EVT_SLOT_8, EVT_SLOT_0)
    TEXTSTART
    TEXTSHOW(0xFFFF)
    TEXTEND
    REMA
    MOVE(0x10, 0x53, 0xD, 0xA)
    MOVE(0x10, 0x57, 0xF, 0xA)
    MOVE(0x10, 0x44, 0xF, 5)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x1014B)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1014D)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x1D)
    ENUN
    DISA(0x53)
    DISA(0x57)
    CURSOR_CHAR(0x6B)
    STAL(0x3C)
    CURE
    SADD(EVT_SLOT_2, EVT_SLOT_9, EVT_SLOT_0)
    TEXTSTART
    TEXTSHOW(0xFFFF)
    TEXTEND
    REMA
    MOVE(0x10, 0x1D, 0xD, 0xA)
    MOVE(0x10, 0x44, 0xF, 0xA)
    STAL2(0xF)
    FADI(0x10)
    ENUN
    CLEA
    CLEE
    CLEN
    ENDA
};

