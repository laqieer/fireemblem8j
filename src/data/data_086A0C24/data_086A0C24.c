#include "global.h"
#include "anime.h"

/* Migrated from asm/data_086A0C24.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_EfxLiveOBJ_79[] __attribute__((section(".data.residue.086A0C24"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00DD, 0x007F, 0xFF81, 0x00DD } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 0, -39 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -16, -39 } } },
    ANIM_SPRITE_END,
};
