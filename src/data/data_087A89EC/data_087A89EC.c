#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EfxLokmsunaObjLeft
 */

extern struct AnimSpriteData AnimSprite_EfxLokmsunaObj_L_1[];
extern struct AnimSpriteData AnimSprite_EfxLokmsunaObj_L_2[];
extern struct AnimSpriteData AnimSprite_EfxLokmsunaObj_L_3[];
extern struct AnimSpriteData AnimSprite_EfxLokmsunaObj_L_4[];
extern struct AnimSpriteData AnimSprite_EfxLokmsunaObj_L_5[];
extern struct AnimSpriteData AnimSprite_EfxLokmsunaObj_L_6[];

u32 data_087A89EC[] __attribute__((section(".data.residue.087A89EC"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObj_L_1, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObj_L_2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObj_L_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObj_L_4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObj_L_5, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObj_L_6, 3),
    ANIMSCR_BLOCKED,
};
