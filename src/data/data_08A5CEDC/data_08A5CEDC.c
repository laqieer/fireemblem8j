#include "global.h"
#include "anime.h"

/* Migrated from asm/data_08A5CEDC.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData data_08A5CEDC[] __attribute__((section(".data.residue.08A5CEDC"))) =
{
    { .header = 0x00000001, .as = { .object = { 0x0A03, 18, 8 } } },
    { .header = 0x00000001, .as = { .object = { 0x0304, 18, 7 } } },
    { .header = 0x13880077, .as = { .object = { 0x0514, 20, 0 } } },
};
