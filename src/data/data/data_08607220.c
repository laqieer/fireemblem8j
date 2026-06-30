#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_efxShooterOBJ_1
 */

extern struct AnimSpriteData AnimSprite_efxShooterOBJ_6[];
extern struct AnimSpriteData AnimSprite_efxShooterOBJ_5[];
extern struct AnimSpriteData AnimSprite_efxShooterOBJ_4[];
extern struct AnimSpriteData AnimSprite_efxShooterOBJ_3[];
extern struct AnimSpriteData AnimSprite_efxShooterOBJ_2[];

u32 data_08607220[] __attribute__((section(".data.residue.08607220"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_efxShooterOBJ_6, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_efxShooterOBJ_5, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_efxShooterOBJ_4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_efxShooterOBJ_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_efxShooterOBJ_2, 2),
    ANIMSCR_BLOCKED,
};
