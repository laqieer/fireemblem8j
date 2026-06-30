#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EfxSunakemuriOBJ2_R
 */

extern struct AnimSpriteData AnimSprite_EfxSunakemuriOBJ2_R_1[];
extern struct AnimSpriteData AnimSprite_EfxSunakemuriOBJ2_R_2[];
extern struct AnimSpriteData AnimSprite_EfxSunakemuriOBJ2_R_3[];
extern struct AnimSpriteData AnimSprite_EfxSunakemuriOBJ2_R_4[];

u32 data_0861E430[] __attribute__((section(".data.residue.0861E430"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ2_R_1, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ2_R_2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ2_R_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ2_R_4, 1),
    ANIMSCR_BLOCKED,
};
