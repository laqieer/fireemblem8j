#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EfxHazymoonOBJ2_3
 */

extern struct AnimSpriteData AnimSprite_EfxHazymoonOBJ2_1_1[];
extern struct AnimSpriteData AnimSprite_EfxHazymoonOBJ2_1_2[];
extern struct AnimSpriteData AnimSprite_EfxHazymoonOBJ2_1_3[];
extern struct AnimSpriteData AnimSprite_EfxHazymoonOBJ2_1_4[];

u32 data_0867E3B4[] __attribute__((section(".data.residue.0867E3B4"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_1_1, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_1_2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_1_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHazymoonOBJ2_1_4, 4),
    ANIMSCR_BLOCKED,
};
