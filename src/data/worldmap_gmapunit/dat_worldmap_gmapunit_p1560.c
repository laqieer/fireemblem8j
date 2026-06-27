#include "global.h"
#include "EAstdlib.h"
#include "constants/songs.h"

/* Migrated from asm/dat_worldmap_gmapunit_p1560.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_gmapunit_p1560") EventListScr EventScr_Ruin_47[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x6)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xc)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x12)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x14)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA(0, 20)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0xb)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1560") EventListScr EventScr_Ruin_48[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x7)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xd)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x13)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA(0, 20)
    STAL(15)
    SOUN(SONG_BD)
    TILEREVERT(0xb)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};
