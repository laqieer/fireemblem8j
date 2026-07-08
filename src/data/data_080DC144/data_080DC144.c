#include "global.h"
#include "anime.h"

/* Migrated from asm/data_080DC144.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData data_080DC144[] __attribute__((section(".data.residue.080DC144"))) =
{
    { .header = 0x60000000, .as = { .object = { 0x0000, 0, 26624 } } },
    { .header = 0x70000000, .as = { .object = { 0x0000, -32768, 30720 } } },
};
