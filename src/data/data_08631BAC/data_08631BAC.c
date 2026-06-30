#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EfxElfireObjRight
 */

extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_1[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_2[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_3[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_4[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_5[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_6[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_7[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_8[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_9[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_10[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_11[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_12[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_13[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_14[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_15[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_16[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_17[];
extern u8 data_086314EC[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_19[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_20[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_21[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_22[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_23[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_24[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_26[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_27[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_28[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_29[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_30[];

u32 data_08631BAC[] __attribute__((section(".data.residue.08631BAC"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_1, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_2, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_2, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_3, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_5, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_6, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_9, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_10, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_11, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_12, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_13, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_14, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_15, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_17, 1),
    ANIMSCR_FORCE_SPRITE(data_086314EC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_19, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_20, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_21, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_22, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_23, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_24, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_26, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_27, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_28, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_29, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_30, 1),
    ANIMSCR_BLOCKED,
};
