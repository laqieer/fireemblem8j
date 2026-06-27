#include "global.h"
#include "EAstdlib.h"

/* Migrated from asm/dat_worldmap_gmapunit_p1542.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_gmapunit_p1542") EventListScr EventScr_CallOnTutorialMode[] = {
    CHECK_TUTORIAL
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CALL(-1)

LABEL(0x0)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1542") EventListScr EventScr_CallOnHardMode[] = {
    CHECK_TUTORIAL
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CHECK_HARD
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CALL(-1)

LABEL(0x0)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1542") EventListScr EventScr_CallOnChapterNumber[] = {
    CHECK_CHAPTER_NUMBER
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_3)

    CALL(-1)

LABEL(0x0)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1542") EventListScr EventScr_CallIfCommonMode[] = {
    CHECK_MODE
    BNE(CHAPTER_MODE_COMMON, EVT_SLOT_C, EVT_SLOT_2)

    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    CALL(-1)

LABEL(0x1)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1542") EventListScr EventScr_CallWithModeCheck[] = {
    CHECK_MODE
    SVAL(EVT_SLOT_7, CHAPTER_MODE_COMMON)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_7)

    SVAL(EVT_SLOT_7, CHAPTER_MODE_EIRIKA)
    BNE(0x1, EVT_SLOT_C, EVT_SLOT_7)

    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    GOTO(0x2)

LABEL(0x1)
    SADD(EVT_SLOT_2, EVT_SLOT_4, EVT_SLOT_0)

LABEL(0x2)
    CALL(-1)
    ENDA
};

SECTION(".rodata.dat_worldmap_gmapunit_p1542") EventListScr EventScr_SetFlagIfPlayedThrough[] = {
    CHECK_POSTGAME
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    ENUT(-1)

LABEL(0x0)
    ENDA
};
