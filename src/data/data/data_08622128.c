#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EfxThunderOBJ_L
 */

extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_18[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_1[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_3[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_4[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_5[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_6[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_7[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_8[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_9[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_10[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_11[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_12[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_13[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_14[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_15[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_16[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_17[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_19[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_20[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_21[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_22[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_23[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_24[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_25[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_26[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_27[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_28[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_29[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_L_30[];

u32 data_08622128[] __attribute__((section(".data.residue.08622128"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 14),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_1, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_3, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_5, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_6, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_9, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_10, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_11, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_12, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_13, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_14, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_15, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_17, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_19, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_20, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_21, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_22, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_23, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_24, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_25, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_26, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_27, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_28, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_18, 1),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_29, 1),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_L_30, 1),
    ANIMSCR_BLOCKED,
};
