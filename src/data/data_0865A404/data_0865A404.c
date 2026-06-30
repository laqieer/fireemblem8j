#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EfxMistyRainObj2
 */

extern struct AnimSpriteData AnimSprite_EfxMistyRainObj2_1[];
extern struct AnimSpriteData AnimSprite_EfxMistyRainObj2_2[];
extern struct AnimSpriteData AnimSprite_EfxMistyRainObj2_3[];
extern struct AnimSpriteData AnimSprite_EfxMistyRainObj2_4[];

u32 data_0865A404[] __attribute__((section(".data.residue.0865A404"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj2_1, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj2_2, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj2_3, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMistyRainObj2_4, 3),
    ANIMSCR_BLOCKED,
};
