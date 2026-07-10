#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* Converted from ../../../../../../tmp/orig_EventScr_Ch14b_EndingScene.c by scripts/eventscr_disasm.py (D309).
 * Editable EAstdlib macro form; expands byte-identical to baserom
 * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape
 * for command/operand shapes without a friendly macro yet. */
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

extern const u8 EventScr_Ch15A_26[];
extern const u8 EventScr_LoadReinforce[];
extern const u8 Event_TextWithBG[];
extern const u8 data_085B9BBC[];
extern const u8 UnitDef_Ch15BEnemy_4[];
extern const u8 UnitDef_Ch15BEnemy_5[];
extern const u8 frontier_df3_unitdef_b_038_91B948[];
extern const u8 UnitDef_Ch14BAlly_7[];

extern const u8 frontier_df3_unitdef_b_037_91AC38_tail_p1[];

SECTION(".rodata.dat_EventScr_Ch14b_EndingScene_ref") EventListScr EventScr_Ch14b_EndingScene[] = {
    CALL(EventScr_Ch15A_26)
    ENUT(0x77)
    MNCH(0x1D)
    ENDA
    MUSI
    SVAL(EVT_SLOT_2, 0)
    SVAL(EVT_SLOT_3, 0xAF6)
    CALL(Event_TextWithBG)
    MUNO
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x88)
    GIVEITEMTO(0xFFFF)
    EVBIT_T(7)
    ENDA
    MUSI
    SVAL(EVT_SLOT_2, 0)
    SVAL(EVT_SLOT_3, 0xAF7)
    CALL(Event_TextWithBG)
    MUNO
    EVBIT_T(7)
    ENDA
    MUSI
    SVAL(EVT_SLOT_2, 0)
    SVAL(EVT_SLOT_3, 0xAF8)
    CALL(Event_TextWithBG)
    MUNO
    EVBIT_T(7)
    ENDA
    MUSS(0x27)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xAEC)
    TEXTEND
    REMA
    MURE(2)
    EVBIT_T(7)
    ENDA
    MUSI
    TEXTSTART
    TEXTSHOW(0xAF2)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
    MUSI
    TEXTSTART
    TEXTSHOW(0xAF3)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
    MUSI
    TEXTSTART
    TEXTSHOW(0xAF4)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
    MUSI
    TEXTSTART
    TEXTSHOW(0xAF5)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_037_91AC38_tail_p1 + 0x4EC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_037_91AC38_tail_p1 + 0x528)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch15BEnemy_4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch15BEnemy_5)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_038_91B948)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x81)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(0x82)
    EVBIT_T(7)
    ENDA
};

