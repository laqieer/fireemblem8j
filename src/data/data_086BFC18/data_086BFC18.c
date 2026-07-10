#include "global.h"

/* Migrated from asm/data_086BFC18.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* Stays raw u32[] (NOT struct AnimSpriteData): OAM/AnimScr hybrid. Entries 0..4
 * are a valid AnimSpriteData OAM prefix (60 B: 2 objects + 3 terminators), but the
 * remaining 252 B are AnimScr command/pointer words (0x086BF70A.. ROM ptrs,
 * 0x186B.. delay-cmds, 0x386B.. loop-cmds) whose non-zero high bytes fall in the
 * AnimSpriteData `pad` field, so the symbol as a whole is not byte-identically
 * typeable as struct AnimSpriteData[]. Kept raw (correct floor). */
u32 AnimSprite_EfxIvald1_55[] __attribute__((section(".data.residue.086BFC18"))) = {
    0x40000000, 0xFFF80000, 0x0000FFF8, 0x00000001,
    0x00000000, 0x00000000, 0x40000000, 0xFFF80002,
    0x0000FFF8, 0x00000001, 0x00000000, 0x00000000,
    0x00000001, 0x00000000, 0x00000000, 0x086BF70A,
    0x086BF722, 0x086BF73A, 0x086BF752, 0x086BF76A,
    0x086BF782, 0x086BF79B, 0x186BF7B0, 0x086BF7CB,
    0x086BF7E2, 0x80000000, 0x086BF7FA, 0x086BF812,
    0x086BF82A, 0x086BF842, 0x086BF85A, 0x086BF872,
    0x086BF88B, 0x186BF8A0, 0x086BF8BB, 0x086BF8D2,
    0x80000000, 0x186BF8E8, 0x186BF900, 0x186BF918,
    0x186BF930, 0x186BF948, 0x186BF960, 0x186BF978,
    0x186BF990, 0x186BF9A8, 0x086BF9C3, 0x186BF9D8,
    0x186BF9F0, 0x186BFA08, 0x186BFA20, 0x186BFA38,
    0x186BFA50, 0x80000000, 0x186BFA68, 0x186BFA80,
    0x186BFA98, 0x186BFAB0, 0x186BFAC8, 0x186BFAE0,
    0x186BFAF8, 0x186BFB10, 0x186BFB28, 0x186BFB40,
    0x186BFB58, 0x186BFB70, 0x186BFB88, 0x186BFBA0,
    0x186BFBB8, 0x186BFBD0, 0x186BFBE8, 0x80000000,
    0x386BFC18, 0x086BFC49, 0x80000000, 0x386BFC30,
    0x086BFC49, 0x80000000,
};
