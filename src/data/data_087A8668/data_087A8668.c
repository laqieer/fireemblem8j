#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EfxSong
 */

extern struct AnimSpriteData AnimSprite_EfxSong_1[];
extern struct AnimSpriteData AnimSprite_EfxSong_2[];
extern struct AnimSpriteData AnimSprite_EfxSong_3[];
extern struct AnimSpriteData AnimSprite_EfxSong_4[];
extern struct AnimSpriteData AnimSprite_EfxSong_5[];
extern struct AnimSpriteData AnimSprite_EfxSong_6[];
extern struct AnimSpriteData AnimSprite_EfxSong_7[];
extern struct AnimSpriteData AnimSprite_EfxSong_8[];
extern struct AnimSpriteData AnimSprite_EfxSong_9[];
extern struct AnimSpriteData AnimSprite_EfxSong_10[];
extern struct AnimSpriteData AnimSprite_EfxSong_11[];
extern struct AnimSpriteData AnimSprite_EfxSong_12[];
extern struct AnimSpriteData AnimSprite_EfxSong_13[];
extern struct AnimSpriteData AnimSprite_EfxSong_14[];
extern struct AnimSpriteData AnimSprite_EfxSong_15[];
extern struct AnimSpriteData AnimSprite_EfxSong_16[];
extern struct AnimSpriteData AnimSprite_EfxSong_17[];
extern struct AnimSpriteData AnimSprite_EfxSong_18[];
extern struct AnimSpriteData AnimSprite_EfxSong_19[];
extern struct AnimSpriteData AnimSprite_EfxSong_20[];
extern struct AnimSpriteData AnimSprite_EfxSong_21[];
extern struct AnimSpriteData AnimSprite_EfxSong_22[];
extern struct AnimSpriteData AnimSprite_EfxSong_23[];
extern struct AnimSpriteData AnimSprite_EfxSong_24[];
extern struct AnimSpriteData AnimSprite_EfxSong_25[];
extern struct AnimSpriteData AnimSprite_EfxSong_26[];
extern struct AnimSpriteData AnimSprite_EfxSong_27[];
extern struct AnimSpriteData AnimSprite_EfxSong_28[];
extern struct AnimSpriteData AnimSprite_EfxSong_29[];
extern struct AnimSpriteData AnimSprite_EfxSong_30[];
extern struct AnimSpriteData AnimSprite_EfxSong_31[];
extern struct AnimSpriteData AnimSprite_EfxSong_32[];
extern struct AnimSpriteData AnimSprite_EfxSong_33[];
extern struct AnimSpriteData AnimSprite_EfxSong_34[];
extern struct AnimSpriteData AnimSprite_EfxSong_35[];
extern struct AnimSpriteData AnimSprite_EfxSong_36[];
extern struct AnimSpriteData AnimSprite_EfxSong_37[];
extern struct AnimSpriteData AnimSprite_EfxSong_38[];
extern struct AnimSpriteData AnimSprite_EfxSong_39[];
extern struct AnimSpriteData AnimSprite_EfxSong_40[];
extern struct AnimSpriteData AnimSprite_EfxSong_41[];
extern struct AnimSpriteData AnimSprite_EfxSong_42[];
extern struct AnimSpriteData AnimSprite_EfxSong_43[];
extern struct AnimSpriteData AnimSprite_EfxSong_44[];
extern struct AnimSpriteData AnimSprite_EfxSong_45[];
extern struct AnimSpriteData AnimSprite_EfxSong_46[];
extern struct AnimSpriteData AnimSprite_EfxSong_47[];
extern struct AnimSpriteData AnimSprite_EfxSong_48[];
extern struct AnimSpriteData AnimSprite_EfxSong_49[];
extern struct AnimSpriteData AnimSprite_EfxSong_50[];
extern struct AnimSpriteData AnimSprite_EfxSong_51[];
extern struct AnimSpriteData AnimSprite_EfxSong_52[];
extern struct AnimSpriteData AnimSprite_EfxSong_53[];
extern struct AnimSpriteData AnimSprite_EfxSong_54[];
extern struct AnimSpriteData AnimSprite_EfxSong_55[];
extern struct AnimSpriteData AnimSprite_EfxSong_56[];

u32 data_087A8668[] __attribute__((section(".data.residue.087A8668"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_1, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_2, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_3, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_5, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_6, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_9, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_10, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_11, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_12, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_13, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_14, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_15, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_16, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_17, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_19, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_20, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_21, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_22, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_23, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_24, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_25, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_26, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_27, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_28, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_29, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_30, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_31, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_32, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_33, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_34, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_35, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_36, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_37, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_38, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_39, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_40, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_41, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_42, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_43, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_44, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_45, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_46, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_47, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_48, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_49, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_50, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_51, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_52, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_53, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_54, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_55, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSong_56, 1),
    ANIMSCR_BLOCKED,
};
