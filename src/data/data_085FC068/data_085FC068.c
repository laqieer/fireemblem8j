#include "global.h"
#include "anime.h"

/* Migrated from asm/data_085FC068.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_EkrBaseKaiten_1[] __attribute__((section(".data.residue.085FC068"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, -16, -8 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 0, -8 } } },
    ANIM_SPRITE_END,
};
