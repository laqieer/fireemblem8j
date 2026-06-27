#include "global.h"
#include "EAstdlib.h"
#include "constants/songs.h"

/* Migrated from asm/dat_worldmap_gmapunit_p1559.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_gmapunit_p1559") EventListScr EventScr_Ruin_45[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x9)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xd)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x11)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x14)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA2(10, 15)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0x4)
    CAMERA2(12, 6)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0xa)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};
