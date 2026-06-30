#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EfxBerserk1
 */

extern struct AnimSpriteData AnimSprite_EfxBerserk1_1[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_2[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_3[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_4[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_5[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_6[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_7[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_8[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_9[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_10[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_11[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_12[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_13[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_14[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_15[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_16[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_17[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_18[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_19[];
extern struct AnimSpriteData AnimSprite_EfxBerserk1_20[];

u32 data_086B9E8C[] __attribute__((section(".data.residue.086B9E8C"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_1, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_4, 2),
    ANIMSCR_BLOCKED,

    /* AnimScr_EfxBerserk2 */
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_5, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_6, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_7, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_8, 2),
    ANIMSCR_BLOCKED,

    /* AnimScr_EfxBerserk3 */
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_9, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_10, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_11, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_12, 2),
    ANIMSCR_BLOCKED,

    /* AnimScr_EfxBerserk4 */
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_13, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_14, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_15, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_16, 2),
    ANIMSCR_BLOCKED,

    /* AnimScr_EfxBerserk5 */
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_17, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_18, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_19, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_20, 2),
    ANIMSCR_BLOCKED,
};
