#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_efxShooterOBJ_0
 */

extern struct AnimSpriteData AnimSprite_efxShooterOBJ_1[];
extern struct AnimSpriteData AnimSprite_efxShooterOBJ_0[];
extern struct AnimSpriteData AnimSprite_Banim_1[];
extern struct AnimSpriteData AnimSprite_EfxTeyariObjType1Left_15[];
extern struct AnimSpriteData AnimSprite_EfxTeyariObjType1Left_14[];

u32 data_08607184[] __attribute__((section(".data.residue.08607184"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_efxShooterOBJ_1, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_efxShooterOBJ_0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Banim_1, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_15, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_14, 2),
    ANIMSCR_BLOCKED,
};
