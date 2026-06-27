#include "global.h"
#include "EAstdlib.h"

/* Migrated from asm/dat_worldmap_gmapunit_p1549.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_gmapunit_p1549") EventListScr EventScr_ConfigHardModeLoadUnitHard[] = {
    CHECK_HARD
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)

    EvtSetLoadUnitCount(-1)
    GOTO(0x1)

LABEL(0x0)
    EvtSetLoadUnitCount(0)

LABEL(0x1)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1549") EventListScr EventScr_9EE84C[] = {
    RANDOMNUMBER(99)
    SVAL(EVT_SLOT_7, -1)
    SVAL(EVT_SLOT_8, 0)

LABEL(0x0)
    SDEQUEUE(EVT_SLOT_9)
    SVAL(EVT_SLOT_1, 0x1)
    SADD(EVT_SLOT_7, EVT_SLOT_7, EVT_SLOT_1)
    SADD(EVT_SLOT_8, EVT_SLOT_8, EVT_SLOT_9)
    BLE(0x0, EVT_SLOT_8, EVT_SLOT_C)

    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x0)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x28)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x3C)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x50)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x64)
    SAVETOQUEUE

LABEL(0x1)
    SVAL(EVT_SLOT_1, 0x1)
    SSUB(EVT_SLOT_7, EVT_SLOT_7, EVT_SLOT_1)
    SDEQUEUE(EVT_SLOT_2)
    BLE(0x1, EVT_SLOT_0, EVT_SLOT_7)

    EvtSetLoadUnitChance(-1)
    SVAL(EVT_SLOT_D, 0x0)
    ENDA
};
