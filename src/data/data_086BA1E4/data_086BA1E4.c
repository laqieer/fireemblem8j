#include "global.h"

/* Migrated from asm/data_086BA1E4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* Stays raw u32[] (NOT struct AnimSpriteData): OAM/AnimScr hybrid whose size
 * (196 B) is not a multiple of the 12-byte AnimSpriteData stride. Entries 0..8 are
 * a valid OAM prefix (108 B), then 88 B of AnimScr words (0x086B9EF2.. ROM ptrs,
 * 0x80000000 blocked-markers) with non-zero `pad`, ending on a stray 4-byte word.
 * Not byte-identically typeable as struct AnimSpriteData[]; kept raw (floor). */
u32 AnimSprite_EfxBerserk2_15[] __attribute__((section(".data.residue.086BA1E4"))) = {
    0x00000000, 0x0000001F, 0x0000FFF8, 0x00000001,
    0x00000000, 0x00000000, 0x40000000, 0xFFF80040,
    0x0000FFB8, 0x00000001, 0x00000000, 0x00000000,
    0x80000000, 0x00000015, 0x0000FFA0, 0x90000000,
    0xFFE00015, 0x0000FFA0, 0xA0000000, 0x00000015,
    0x0000FFC0, 0xB0000000, 0xFFE00015, 0x0000FFC0,
    0x00000001, 0x00000000, 0x00000000, 0x086B9EF2,
    0x086B9F46, 0x80000000, 0x086B9F6A, 0x086B9FBE,
    0x80000000, 0x086B9FE2, 0x086BA036, 0x80000000,
    0x086BA05A, 0x086BA0AE, 0x80000000, 0x086BA0D2,
    0x086BA126, 0x086BA14A, 0x086BA186, 0x086BA1AA,
    0x086BA1CE, 0x086BA1E6, 0x086BA1FE, 0x086BA216,
    0x80000000,
};
