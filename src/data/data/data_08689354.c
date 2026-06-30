#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EfxFenrir1
 */

extern struct AnimSpriteData AnimSprite_EfxFenrir_19[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_18[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_3[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_2[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_1[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_30[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_21[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_20[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_6[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_5[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_4[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_17[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_8[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_9[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_10[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_11[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_12[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_13[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_14[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_15[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_16[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_7[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_22[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_23[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_24[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_25[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_26[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_27[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_28[];
extern struct AnimSpriteData AnimSprite_EfxFenrir_29[];

u32 data_08689354[] __attribute__((section(".data.residue.08689354"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_19, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_18, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_1, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_18, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_19, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_30, 10),
    ANIMSCR_BLOCKED,

    /* AnimScr_EfxFenrir2 */
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_21, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_20, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_6, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_5, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_5, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_6, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_20, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_21, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_30, 10),
    ANIMSCR_BLOCKED,

    /* AnimScr_EfxFenrir3 */
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_17, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_9, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_10, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_11, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_12, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_13, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_14, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_15, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_22, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_23, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_24, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_25, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_26, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_27, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_28, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxFenrir_29, 2),
    ANIMSCR_BLOCKED,
};
