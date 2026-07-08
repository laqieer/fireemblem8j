#include "global.h"
#include "anime.h"

/* Migrated from asm/data_086BCCD8.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData data_086BCCD8[] __attribute__((section(".data.residue.086BCCD8"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x001F, 0, -8 } } },
    ANIM_SPRITE_END,
};
