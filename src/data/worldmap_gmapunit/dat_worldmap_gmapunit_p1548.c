#include "global.h"
#include "EAstdlib.h"

/* Migrated from asm/dat_worldmap_gmapunit_p1548.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_gmapunit_p1548") EventListScr EventScr_Tutorial_Exec0[] = {
    TUTORIALTEXTBOXSTART
    CHECK_ACTIVE
    SDEQUEUE(EVT_SLOT_2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_2)

    SHOW_ATTACK_RANGE(CHAR_EVT_ACTIVE_UNIT)

    SDEQUEUE(EVT_SLOT_B)
    CURSOR_FLASHING(-1, -1)

    STAL(18)

    SDEQUEUE(EVT_SLOT_2)
    SDEQUEUE(EVT_SLOT_B)
    TEXTSHOW(-1)
    TEXTEND
    CURE

    IGNORE_KEYS(R_BUTTON | START_BUTTON | B_BUTTON)
    SDEQUEUE(EVT_SLOT_C)
    SDEQUEUE(EVT_SLOT_C)

    SDEQUEUE(EVT_SLOT_2)
    EvtEnqueueConditionalTutCall(
        -1,
        TUTORIAL_EVT_TYPE_DESTSELECTED)

    GOTO(0x1)

LABEL(0x0)
    SDEQUEUE(0xC)
    SDEQUEUE(0xC)
    SDEQUEUE(0xC)

    CURSOR_FLASHING_CHAR(CHAR_EVT_SLOT2)
    STAL(8)

    SET_ACTIVE(CHAR_EVT_SLOT2)

    SDEQUEUE(EVT_SLOT_2)
    SDEQUEUE(EVT_SLOT_B)
    TEXTSHOW(-1)
    TEXTEND
    CURE

    SDEQUEUE(0xC)
    SDEQUEUE(0x2)
    EvtEnqueueConditionalTutCall(
        -1,
        TUTORIAL_EVT_TYPE_ONSELECT)

LABEL(0x1)
    REMA
    ENDA
};
