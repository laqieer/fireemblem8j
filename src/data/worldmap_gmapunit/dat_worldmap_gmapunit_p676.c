#include "global.h"

/* Migrated from asm/dat_worldmap_gmapunit_p676.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* gDefaultFaceConfig: typed struct FaceVramEntry[4] (region-same, fe8u parity).
 * struct FaceVramEntry comes from types.h via global.h; face.h is NOT included here
 * because it re-declares the gSprite_Face* arrays (defined as u8[] below) -> conflict. */
SECTION(".rodata.dat_worldmap_gmapunit_p676") struct FaceVramEntry gDefaultFaceConfig[4] = {
    [0] = { .tileOffset = 0x20 * 0x300, .paletteId = 6, },
    [1] = { .tileOffset = 0x20 * 0x280, .paletteId = 7, },
    [2] = { .tileOffset = 0x20 * 0x200, .paletteId = 8, },
    [3] = { .tileOffset = 0x20 * 0x380, .paletteId = 9, },
};
SECTION(".rodata.dat_worldmap_gmapunit_p676") u8 gSprite_Face64x96[] = INCBIN_U8("data/residual/gSprite_Face64x96.bin");
SECTION(".rodata.dat_worldmap_gmapunit_p676") u8 gSprite_Face64x96_Flipped[] = INCBIN_U8("data/residual/gSprite_Face64x96_Flipped.bin");
SECTION(".rodata.dat_worldmap_gmapunit_p676") u8 gSprite_Face96x96[] = INCBIN_U8("data/residual/gSprite_Face96x96.bin");
SECTION(".rodata.dat_worldmap_gmapunit_p676") u8 gSprite_Face96x96_Flipped[] = INCBIN_U8("data/residual/gSprite_Face96x96_Flipped.bin");
SECTION(".rodata.dat_worldmap_gmapunit_p676") u8 gSprite_Face80x72[] = INCBIN_U8("data/residual/gSprite_Face80x72.bin");
SECTION(".rodata.dat_worldmap_gmapunit_p676") u8 gSprite_Face80x72_Flipped[] = INCBIN_U8("data/residual/gSprite_Face80x72_Flipped.bin");
SECTION(".rodata.dat_worldmap_gmapunit_p676") u8 gSprite_Face96x72[] = INCBIN_U8("data/residual/gSprite_Face96x72.bin");
SECTION(".rodata.dat_worldmap_gmapunit_p676") u8 gSprite_Face96x72_Flipped[] = INCBIN_U8("data/residual/gSprite_Face96x72_Flipped.bin");
