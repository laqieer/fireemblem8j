#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EfxBindingBlade_Right
 */

extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right1[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right2[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right3[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right4[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right5[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right6[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right7[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right8[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right9[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right10[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right11[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right12[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right13[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right14[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right15[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right16[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right17[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right18[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right19[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right20[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right21[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right22[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right23[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right24[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right25[];
extern struct AnimSpriteData AnimSprite_EfxBindingBlade_Right26[];

u32 data_0860DEB4[] __attribute__((section(".data.residue.0860DEB4"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right1, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right5, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right6, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right7, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right9, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right10, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right11, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right12, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right13, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right14, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right15, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right16, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right17, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right18, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right19, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right20, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right21, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right22, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right23, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right24, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right25, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBindingBlade_Right26, 2),
    ANIMSCR_BLOCKED,
};
