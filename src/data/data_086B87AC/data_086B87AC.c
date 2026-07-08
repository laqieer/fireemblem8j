#include "global.h"
#include "anime.h"

/* Migrated from asm/data_086B87AC.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData data_086B87AC[] __attribute__((section(".data.residue.086B87AC"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0010, -8, -48 } } },
    ANIM_SPRITE_END,
};
