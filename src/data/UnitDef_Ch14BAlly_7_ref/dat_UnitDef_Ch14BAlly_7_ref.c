#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* MISLABELED as struct UnitDefinition UnitDef_Ch14BAlly_7 (JP 0x08a602f0, read from a
 * funcmap-aligned code literal) -- the bytes are actually an EVENT SCRIPT, not a unit
 * placement table (the would-be `redas` words are not REDA pointers). Decoded to the
 * editable EAstdlib EventListScr macro form by scripts/eventscr_disasm.py; expands
 * byte-identical to baserom (gated by `make compare`). The public symbol name is kept
 * (eventcall.h still prototypes it as struct UnitDefinition[] -- a separate TU; the
 * linker only sees the byte-identical object). */

#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

SECTION(".rodata.dat_UnitDef_Ch14BAlly_7_ref") EventListScr UnitDef_Ch14BAlly_7[] = {
    CHECK_ALLEGIANCE(0xFFFF)
    BEQ(0, 0xC, 2)
    CALL((const u8 *)UnitDef_Ch14BAlly_7 + 0x1C)
    LABEL(0)
    ENDA
    CHECK_TRIG_EVENTID
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    ENUF(0xFFFF)
    EVBIT_T(7)
    ENDB
    BEQ(0, 0xC, 0)
    LOAD1(1, 0xFFFFFFFF)
    ENUN
    GOTO(1)
    LABEL(0)
    LOAD1(0, 0xFFFFFFFF)
    ENUN
    LABEL(1)
    ENDA
    CHECK_TUTORIAL
};

