#include "global.h"
#include "EAstdlib.h"

/* Migrated from asm/dat_worldmap_gmapunit_p684.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_gmapunit_p684") EventListScr EventScr_CutsceneExecEnd_Sub0[] = {
    CHECK_EVBIT(8)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_EVBIT(7)
    BNE(0x63, EVT_SLOT_C, EVT_SLOT_0)
    FADI(16)
LABEL(0x0)
    CLEAN
    FADU(16)
LABEL(0x63)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p684") EventListScr EventScr_CutsceneExecEnd_Sub1[] = {
    CHECK_EVBIT(8)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    FADI(16)
LABEL(0x0)
    CHECK_EVBIT(11)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_CHAPTER_NUMBER
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0xffff)
LABEL(0x1)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p684") u16 Obj_EventShinningCursor[] = INCBIN_U16("data/residual/Obj_EventShinningCursor.bin");
