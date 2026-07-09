#include "global.h"
#include "anime.h"

/* Migrated from asm/data_08636294.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData dat_AnimSprite_08636294_ref[] __attribute__((section(".data.residue.08636294"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0000, -8, 8 } } },
    ANIM_SPRITE_END,
    { .header = 0x00004000, .as = { .object = { 0x0002, -8, 8 } } },
    ANIM_SPRITE_END,
};
