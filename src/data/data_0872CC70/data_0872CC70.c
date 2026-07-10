#include "global.h"
#include "anime.h"

/* Migrated from asm/data_0872CC70.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

extern struct AnimSpriteData AnimSprite_NaglfarSprites_B[];
extern struct AnimSpriteData AnimSprite_Banim_50[];
extern struct AnimSpriteData AnimSprite_efxNaglfarOBJ2_0[];
extern struct AnimSpriteData AnimSprite_efxNaglfarOBJ2_1[];

u32 AnimScr_efxNaglfarOBJ2_0[] __attribute__((section(".data.residue.0872CC70"))) = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_NaglfarSprites_B, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_Banim_50, 2),
    0x81000000,
    ANIMSCR_FORCE_SPRITE(AnimSprite_efxNaglfarOBJ2_0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_efxNaglfarOBJ2_1, 2),
    0x81000000, 0x50008000, 0x00280012,
    0x0000FF88, 0x90008000, 0x00200013, 0x0000FFA8,
    0x90008000, 0x00180016, 0x0000FFC8, 0x90008000,
    0x00180018, 0x0000FFE8, 0x50008000, 0x00180015,
    0x0000FFA8, 0xB0008000, 0x00080000, 0x0000FFE8,
    0x70008000, 0x00000002, 0x0000FFE8, 0xB0008000,
    0xFFF80003, 0x0000FFC8, 0xB0008000, 0xFFF80005,
    0x0000FFA8, 0xB0008000, 0xFFF80007, 0x0000FF88,
    0x70008000, 0x00700012, 0x0000FFE8, 0xB0008000,
    0x00680013, 0x0000FFC8, 0xB0008000, 0x00600016,
    0x0000FFA8, 0xB0008000, 0x00600018, 0x0000FF88,
    0x70008000, 0x00600015, 0x0000FFC8, 0x00000001,
    0x00000000, 0x00000000,
};
