#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_HurtmutEff00OBJ2_Left
 */

extern struct AnimSpriteData AnimSprite_HurtmutEff01OBJ2_1[];
extern struct AnimSpriteData AnimSprite_HurtmutEff01OBJ2_2[];
extern struct AnimSpriteData AnimSprite_HurtmutEff01OBJ2_3[];
extern struct AnimSpriteData AnimSprite_HurtmutEff01OBJ2_4[];
extern struct AnimSpriteData AnimSprite_HurtmutEff01OBJ2_5[];
extern struct AnimSpriteData AnimSprite_HurtmutEff01OBJ2_6[];
extern struct AnimSpriteData AnimSprite_HurtmutEff01OBJ2_7[];
extern struct AnimSpriteData AnimSprite_HurtmutEff01OBJ2_8[];

u32 data_0860EA7C[] __attribute__((section(".data.residue.0860EA7C"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_1, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_2, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_3, 3),
    ANIMSCR_BLOCKED,

    /* AnimScr_HurtmutEff01OBJ2_Left */
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_1, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_2, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_3, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_4, 4),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_5, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_6, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_7, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_8, 2),
    ANIMSCR_BLOCKED,
};
