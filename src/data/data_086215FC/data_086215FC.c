#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EfxThunderOBJ_R
 */

extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_18[];
extern u8 AnimSprite_EfxThunderOBJ_R_1[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_3[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_4[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_5[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_6[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_7[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_8[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_9[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_10[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_11[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_12[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_13[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_14[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_15[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_16[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_17[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_19[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_20[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_21[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_22[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_23[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_24[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_25[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_26[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_27[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_28[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_29[];
extern struct AnimSpriteData AnimSprite_EfxThunderOBJ_R_30[];

u32 data_086215FC[] __attribute__((section(".data.residue.086215FC"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 14),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_1, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_3, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_5, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_6, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_9, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_10, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_11, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_12, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_13, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_14, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_15, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_17, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_19, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_20, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_21, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_22, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_23, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_24, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_25, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_26, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_27, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_28, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_18, 1),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_29, 1),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxThunderOBJ_R_30, 1),
    ANIMSCR_BLOCKED,
};
