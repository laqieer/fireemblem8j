#include "global.h"
#include "anime.h"

/* Migrated from asm/data_0860E028.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData data_0860E028[] __attribute__((section(".data.residue.0860E028"))) =
{
    { .header = 0x80008000, .as = { .object = { 0x0010, -3, -54 } } },
    ANIM_SPRITE_END,
    { .header = 0x80008000, .as = { .object = { 0x0012, -3, -54 } } },
    ANIM_SPRITE_END,
};
