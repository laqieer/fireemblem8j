#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_FirebreathOBJ_Left
 */

extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left1[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left2[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left3[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left4[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left5[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left6[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left7[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left8[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left9[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left10[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left11[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left12[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left13[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left14[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left15[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left16[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left17[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left18[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left19[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left20[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left21[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left22[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left23[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left24[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left25[];
extern struct AnimSpriteData AnimSprite_FirebreathOBJ_Left26[];

u32 data_0860F5FC[] __attribute__((section(".data.residue.0860F5FC"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left1, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left5, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left6, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left7, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left9, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left10, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left11, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left12, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left13, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left14, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left15, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left16, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left17, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left18, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left19, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left20, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left21, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left22, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left23, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left24, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left25, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_FirebreathOBJ_Left26, 2),
    ANIMSCR_BLOCKED,
};
