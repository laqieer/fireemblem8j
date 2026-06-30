#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EfxSunakemuriOBJ1_L
 */

extern struct AnimSpriteData AnimSprite_EfxSunakemuriOBJ1_L_1[];
extern struct AnimSpriteData AnimSprite_EfxSunakemuriOBJ1_L_2[];
extern struct AnimSpriteData AnimSprite_EfxSunakemuriOBJ1_L_3[];
extern struct AnimSpriteData AnimSprite_EfxSunakemuriOBJ1_L_4[];

u32 data_0861E38C[] __attribute__((section(".data.residue.0861E38C"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ1_L_1, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ1_L_2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ1_L_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ1_L_4, 1),
    ANIMSCR_BLOCKED,
};
