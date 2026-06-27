#include "global.h"
#include "EAstdlib.h"
#include "constants/songs.h"

/* Migrated from asm/dat_worldmap_gmapunit_p1558.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_gmapunit_p1558") EventListScr EventScr_Ruin_37[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xa)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x14)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA(0, 20)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0x0)
    CAMERA2(12, 12)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0x7)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1558") EventListScr EventScr_Ruin_38[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x6)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xf)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA(0, 20)
    STAL(15)
    SOUN(SONG_BD)
    TILEREVERT(0x0)
    CAMERA2(12, 12)
    STAL(15)
    SOUN(SONG_BD)
    TILEREVERT(0x7)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1558") EventListScr EventScr_Ruin_39[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x2)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x8)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xe)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x14)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA2(7, 10)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0x1)
    CAMERA2(10, 10)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0x5)
    CAMERA(19, 20)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0x8)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1558") EventListScr EventScr_Ruin_40[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xb)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x11)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA2(7, 10)
    STAL(15)
    SOUN(SONG_BD)
    TILEREVERT(0x1)
    CAMERA2(10, 10)
    STAL(15)
    SOUN(SONG_BD)
    TILEREVERT(0x5)
    CAMERA(19, 20)
    STAL(15)
    SOUN(SONG_BD)
    TILEREVERT(0x8)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1558") EventListScr EventScr_Ruin_41[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xd)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x14)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA(0, 0)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0x2)
    CAMERA(19, 20)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0x9)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1558") EventListScr EventScr_Ruin_42[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x9)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x11)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA(0, 0)
    STAL(15)
    SOUN(SONG_BD)
    TILEREVERT(0x2)
    CAMERA(19, 20)
    STAL(15)
    SOUN(SONG_BD)
    TILEREVERT(0x9)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};
