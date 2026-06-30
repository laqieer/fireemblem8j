#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EfxFireOBJ_L_Front
 */

extern struct AnimSpriteData AnimSprite_EfxFireOBJ_L_10[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_L_1[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_L_2[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_L_3[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_L_4[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_L_5[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_L_6[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_L_7[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_L_8[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_L_9[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_L_11[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_L_12[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_L_13[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_L_14[];

u32 data_08624C8C[] __attribute__((section(".data.residue.08624C8C"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_10, 25),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_1, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_4, 10),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_5, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_6, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_7, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_9, 2),
    ANIMSCR_BLOCKED,

    /* AnimScr_EfxFireOBJ_L_Back */
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_10, 25),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_1, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_4, 10),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_5, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_11, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_12, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_13, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_L_14, 2),
    ANIMSCR_BLOCKED,
};
