#include "global.h"
#include "bmunit.h"

/* Migrated from asm/dat_worldmap_gmapunit_p1323.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_gmapunit_p1323") struct UnitDefinition UnitDef_Ch5xEnemy_1[] =
{
    { .charIndex=0x4D, .classIndex=0xB, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0xA, .yPosition=0x2 },
    { .charIndex=0x80, .classIndex=0x4E, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x8, .yPosition=0x8 },
    { .charIndex=0x80, .classIndex=0x4E, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0xC, .yPosition=0x8 },
    {0},
};
SECTION(".rodata.dat_worldmap_gmapunit_p1323") struct UnitDefinition UnitDef_Ch5xAlly_1[] =
{
    { .charIndex=0xF, .classIndex=0x1, .level=0x1, .xPosition=0x15, .yPosition=0xB },
    { .charIndex=0x10, .classIndex=0x5, .level=0x1, .xPosition=0x14, .yPosition=0xC },
    { .charIndex=0x11, .classIndex=0x5, .level=0x1, .xPosition=0x16, .yPosition=0xC },
    {0},
};
