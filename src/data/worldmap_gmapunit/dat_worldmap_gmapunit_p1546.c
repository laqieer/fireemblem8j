#include "global.h"
#include "EAstdlib.h"

/* Migrated from asm/dat_worldmap_gmapunit_p1546.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_gmapunit_p1546") EventListScr EventScr_ApplyTileChangeForFaction[] = {
    EVBIT_MODIFY(1)
    CHECK_ALLEGIANCE(-1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_2)

    TILECHANGE(-2)

LABEL(0x0)
    NoFade
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1546") EventListScr EventScr_FormatFlashingCursor[] = {
LABEL(0x0)
    BLE(0x1, EVT_SLOT_D, EVT_SLOT_0)
    SDEQUEUE(EVT_SLOT_B)
    CURSOR_FLASHING(-1, -1)
    GOTO(0x0)

LABEL(0x1)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1546") EventListScr EventScr_MoveUnitS2ToLeader[] = {
    CHECK_ALIVE(-3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CHECK_DEPLOYED(-3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    GOTO(0x63)

LABEL(0x0)
    MOVEONTO(0, -3, 0)
    ENUN
    REMU(-3)

LABEL(0x63)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1546") EventListScr EventScr_FormatMoveUnit[] = {
    CHECK_ALIVE(-3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CHECK_DEPLOYED(-3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    MOVE_NEXTTO(0, -3, 0)
    GOTO(0x63)

LABEL(0x0)
    CHECK_COORDS(0)
    SADD(EVT_SLOT_B, EVT_SLOT_C, EVT_SLOT_0)
    SPAWN_CUTSCENE_ALLY(-3, -1, -1)

    SVAL(EVT_SLOT_7, FACING_UP)
    BNE(0x1, EVT_SLOT_7, EVT_SLOT_3)

    MOVE_1STEP(0, -3, FACING_UP)
    GOTO(0x63)

LABEL(0x1)
    SVAL(EVT_SLOT_7, FACING_DOWN)
    BNE(0x2, EVT_SLOT_7, EVT_SLOT_3)

    MOVE_1STEP(0, -3, FACING_DOWN)
    GOTO(0x63)

LABEL(0x2)
    SVAL(EVT_SLOT_7, FACING_LEFT)
    BNE(0x3, EVT_SLOT_7, EVT_SLOT_3)

    MOVE_1STEP(0, -3, FACING_LEFT)
    GOTO(0x63)

LABEL(0x3)
    MOVE_1STEP(0, -3, FACING_RIGHT)

LABEL(0x63)
    ENUN
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1546") EventListScr EventScr_LoadUniqueAlly[] = {
    CHECK_EXISTS(CHAR_EVT_SLOT2)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CHECK_ALLEGIANCE(CHAR_EVT_SLOT2)
    SVAL(EVT_SLOT_1, FACTION_ID_BLUE)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_1)
    CUSA(CHAR_EVT_SLOT2)
    GOTO(0x1)

LABEL(0x0)
    SPAWN_ALLY(CHAR_EVT_SLOT2, 0, 0)

    SVAL(EVT_SLOT_1, 0)
    SET_HP(CHAR_EVT_SLOT2)

    REMU(CHAR_EVT_SLOT2)

    SVAL(EVT_SLOT_1, 0)
    SET_STATE(CHAR_EVT_SLOT2)

LABEL(0x1)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1546") EventListScr EventScr_UnitWarpIN[] = {
    REMU(CHAR_EVT_SLOT2)
    CAMERA_CAHR(CHAR_EVT_SLOT2)

    CHECK_COORDS(CHAR_EVT_SLOT2)
    SADD(EVT_SLOT_B, EVT_SLOT_C, EVT_SLOT_0)
    WARP_IN(-1, -1)

    STAL2(10)
    REVEAL(CHAR_EVT_SLOT2)
    ENDWARP
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1546") EventListScr EventScr_UnitWarpOUT[] = {
    CAMERA_CAHR(CHAR_EVT_SLOT2)

    CHECK_COORDS(CHAR_EVT_SLOT2)
    SADD(EVT_SLOT_B, EVT_SLOT_C, EVT_SLOT_0)
    WARP_OUT(-1, -1)

    STAL2(20)
    REMU(CHAR_EVT_SLOT2)
    ENDWARP
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1546") EventListScr EventScr_UnitFlushingIN[] = {
    CAMERA_CAHR(CHAR_EVT_SLOT2)

    REVEAL(CHAR_EVT_SLOT2)
    STAL2(2)
    REMU(CHAR_EVT_SLOT2)

    STAL2(4)

    REVEAL(CHAR_EVT_SLOT2)
    STAL2(2)
    REMU(CHAR_EVT_SLOT2)

    STAL2(4)

    REVEAL(CHAR_EVT_SLOT2)
    STAL2(2)
    REMU(CHAR_EVT_SLOT2)
    STAL2(2)

    REVEAL(CHAR_EVT_SLOT2)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1546") EventListScr EventScr_UnitFlushingOUT[] = {
    CAMERA_CAHR(CHAR_EVT_SLOT2)

    REVEAL(CHAR_EVT_SLOT2)
    STAL2(2)
    REMU(CHAR_EVT_SLOT2)
    STAL2(2)

    REVEAL(CHAR_EVT_SLOT2)
    STAL2(2)
    REMU(CHAR_EVT_SLOT2)
    STAL2(4)

    REVEAL(CHAR_EVT_SLOT2)
    STAL2(2)
    REMU(CHAR_EVT_SLOT2)
    STAL2(6)

    REVEAL(CHAR_EVT_SLOT2)
    STAL2(2)
    REMU(CHAR_EVT_SLOT2)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1546") EventListScr EventScr_StrictLoadUniqueAlly[] = {
    CHECK_EXISTS(CHAR_EVT_SLOT2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)

    SPAWN_ALLY(CHAR_EVT_SLOT2, 0, 0)
    REMU(CHAR_EVT_SLOT2)
    GOTO(0x1)

LABEL(0x0)
    CHECK_ALLEGIANCE(CHAR_EVT_SLOT2)
    SVAL(EVT_SLOT_1, FACTION_ID_BLUE)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_1)

    CUSA(CHAR_EVT_SLOT2)

LABEL(0x1)
    SVAL(EVT_SLOT_1, 0)
    SET_HP(CHAR_EVT_SLOT2)

    REMU(CHAR_EVT_SLOT2)

    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHAR_EVT_SLOT2)

LABEL(0x2)
    ENDA
};
