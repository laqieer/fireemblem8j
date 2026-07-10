#include "global.h"
#include "anime.h"

/* Migrated from asm/data_0864738C.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* D312 ID: byte-identical (24 B, whole symbol; unique single occurrence in the
 * fe8u ROM) to fe8u AnimSprite_FimbulvetrOBJ_24. Byte-neutral rename; section unchanged => same ROM bytes. */
struct AnimSpriteData AnimSprite_FimbulvetrOBJ_24[] __attribute__((section(".data.residue.0864738C"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x001F, -8, 0 } } },
    ANIM_SPRITE_END,
};
