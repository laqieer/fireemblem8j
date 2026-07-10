#include "global.h"
#include "anime.h"

/* Migrated from asm/data_0872C080.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

extern struct AnimSpriteData AnimSprite_NaglfarSprites_A_0[];
extern struct AnimSpriteData AnimSprite_NaglfarSprites_A_1[];
extern struct AnimSpriteData AnimSprite_Banim_49[];
extern struct AnimSpriteData AnimSprite_efxNaglfarOBJ_0[];
extern struct AnimSpriteData AnimSprite_efxNaglfarOBJ_2[];

u32 AnimScr_efxNaglfarOBJ[] __attribute__((section(".data.residue.0872C080"))) = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_NaglfarSprites_A_0, 4), 0x81000000,
    ANIMSCR_FORCE_SPRITE(AnimSprite_NaglfarSprites_A_1, 4), 0x81000000,
    ANIMSCR_FORCE_SPRITE(AnimSprite_Banim_49, 4), 0x81000000,
    ANIMSCR_FORCE_SPRITE(AnimSprite_efxNaglfarOBJ_0, 4), 0x81000000,
    ANIMSCR_FORCE_SPRITE(AnimSprite_efxNaglfarOBJ_2, 2), 0x81000000,
    0x0872C05E, 0x81000000,
};
