#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* MISLABELED as struct UnitDefinition UnitDef_Ch21BEnemy_1 (JP 0x08a6c000, read from a
 * funcmap-aligned code literal) -- the bytes are actually an EVENT SCRIPT, not a unit
 * placement table (the would-be `redas` words are not REDA pointers). Decoded to the
 * editable EAstdlib EventListScr macro form by scripts/eventscr_disasm.py; expands
 * byte-identical to baserom (gated by `make compare`). The public symbol name is kept
 * (eventcall.h still prototypes it as struct UnitDefinition[] -- a separate TU; the
 * linker only sees the byte-identical object). */

#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

SECTION(".rodata.dat_UnitDef_Ch21BEnemy_1_ref") EventListScr UnitDef_Ch21BEnemy_1[] = {
    MUSC(0x41)
    SVAL(EVT_SLOT_2, 0x4E)
    CALL(0x8A60420)
    TEXTSHOW(0xBB5)
    TEXTEND
    REMA
    CHECK_ALIVE(0x22)
    BEQ(0, 0xC, 0)
    CHECK_ALIVE(0x21)
    BEQ(0, 0xC, 0)
    CHECK_ALIVE(6)
    BEQ(0, 0xC, 0)
    CHECK_ALIVE(5)
    BEQ(0, 0xC, 0)
    CHECK_ALIVE(3)
    BEQ(0, 0xC, 0)
    TEXTSHOW(0xBB6)
    TEXTEND
    REMA
    LABEL(0)
    CHECK_ALIVE(0x20)
    BEQ(1, 0xC, 0)
};

