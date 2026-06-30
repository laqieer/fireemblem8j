#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"

/* MISLABELED as struct UnitDefinition UnitDef_Ch18BAlly_2 (JP 0x08a6adb0, read from a
 * funcmap-aligned code literal) -- the bytes are actually an EVENT SCRIPT, not a unit
 * placement table (the would-be `redas` words are not REDA pointers). Decoded to the
 * editable EAstdlib EventListScr macro form by scripts/eventscr_disasm.py; expands
 * byte-identical to baserom (gated by `make compare`). The public symbol name is kept
 * (eventcall.h still prototypes it as struct UnitDefinition[] -- a separate TU; the
 * linker only sees the byte-identical object). */

#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

SECTION(".rodata.dat_UnitDef_Ch18BAlly_2_ref") EventListScr UnitDef_Ch18BAlly_2[] = {
    EvtBgmFadeIn(0x7FFF, 2)
    SVAL(EVT_SLOT_2, 0x4D)
    CALL(0x8A60420)
    TEXTSHOW(0xB73)
    TEXTEND
    REMA
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    CLEAN
    LOAD2(1, 0x8915BD0)
    ENUN
    CAMERA2_CAHR(0x1E)
    EvtBgmFadeIn(0x29, 8)
    FADU(4)
    CURSOR_CHAR(0x1E)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x4B)
    CALL(0x8A60420)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    EVENT_WORD(0x00000C41)
};

