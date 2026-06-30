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

/* Editable typed u16[] OAM array ported from fe8u src/eventscr.c. Region-DIFFERENT
 * from fe8u only in a trailing 0x0000 alignment pad (JP 28 B / 14 u16 vs fe8u
 * 26 B / 13 u16); byte-identical to the JP ROM blob formerly at
 * data/residual/Obj_EventShinningCursor.bin, verified by `make compare`. Layout
 * #0 is the OAM entry count; each following triple is an OAM attr0/attr1/attr2. */
SECTION(".rodata.dat_worldmap_gmapunit_p684") u16 Obj_EventShinningCursor[] = {
    4,
    0x0, 0x01FF, 0x0,
    0x0, 0x1008, 0x0,
    0x9, 0x21FF, 0x0,
    0x9, 0x3008, 0x0,
    0x0 /* JP-only trailing alignment pad */
};
