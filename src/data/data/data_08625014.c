#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EfxFireOBJ_R_Front
 */

extern struct AnimSpriteData AnimSprite_EfxFireOBJ_R_10[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_R_1[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_R_2[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_R_3[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_R_4[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_R_5[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_R_6[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_R_7[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_R_8[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_R_9[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_R_11[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_R_12[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_R_13[];
extern struct AnimSpriteData AnimSprite_EfxFireOBJ_R_14[];

u32 data_08625014[] __attribute__((section(".data.residue.08625014"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_10, 25),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_1, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_4, 10),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_5, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_6, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_7, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_9, 2),
    ANIMSCR_BLOCKED,

    /* AnimScr_EfxFireOBJ_R_Back */
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_10, 25),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_1, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_4, 10),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_5, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_11, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_12, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_13, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFireOBJ_R_14, 2),
    ANIMSCR_BLOCKED,
};
