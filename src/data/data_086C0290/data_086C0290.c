#include "global.h"

/* #145 B1 shiftability carve (pure typed C, no inline asm -- issue #152):
 * EfxIvald battle-anim slice (JP 0x086C0290), split at its interior symbol boundary
 * so AnimScr_EfxIvald_L4 (word 42, 0x086C0338) becomes a real relocatable T symbol.
 * The two interior command pointers back into this blob (0x086C0291) are relocatable
 * refs; anim-command words (0x186C.../0x386C...) are not pointers and stay raw.
 * Byte-exact via `make compare`. */

/* Stays raw u32[] (NOT struct AnimSpriteData): this symbol is animation SCRIPT
 * data, not OAM sprite data. Only entry 0 is an ANIM_SPRITE_END terminator; every
 * following word is an AnimScr command/pointer (0x086BFD52.. ROM ptrs, 0x186B..
 * delay-cmds) whose high bytes are non-zero -- i.e. they would land in the
 * AnimSpriteData 12-byte `pad` field (bytes 10..11), which C zero-fills -- so the
 * blob cannot be represented byte-identically as struct AnimSpriteData. It is
 * consumed as a script via `&AnimSprite_EfxIvald2_57 + 1` below. */
u32 AnimSprite_EfxIvald2_57[] __attribute__((section(".data.residue.086C0290"))) = {
    0x00000001,
    0x00000000,
    0x00000000,
    0x086BFD52,
    0x086BFD6A,
    0x086BFD82,
    0x086BFD9A,
    0x086BFDB2,
    0x086BFDCA,
    0x086BFDE3,
    0x186BFDF8,
    0x086BFE13,
    0x086BFE2A,
    0x80000000,
    0x086BFE42,
    0x086BFE5A,
    0x086BFE72,
    0x086BFE8A,
    0x086BFEA2,
    0x086BFEBA,
    0x086BFED3,
    0x186BFEE8,
    0x086BFF03,
    0x086BFF1A,
    0x80000000,
    0x186BFF30,
    0x186BFF48,
    0x186BFF60,
    0x186BFF78,
    0x186BFF90,
    0x186BFFA8,
    0x186BFFC0,
    0x186BFFD8,
    0x186BFFF0,
    0x086C000B,
    0x186C0020,
    0x186C0038,
    0x186C0050,
    0x186C0068,
    0x186C0080,
    0x186C0098,
    0x80000000,
};

u32 AnimScr_EfxIvald_L4[] __attribute__((section(".data.residue.086C0290"))) = {
    0x186C00B0,
    0x186C00C8,
    0x186C00E0,
    0x186C00F8,
    0x186C0110,
    0x186C0128,
    0x186C0140,
    0x186C0158,
    0x186C0170,
    0x186C0188,
    0x186C01A0,
    0x186C01B8,
    0x186C01D0,
    0x186C01E8,
    0x186C0200,
    0x186C0218,
    0x186C0230,
    0x80000000,
    0x386C0260,
    (u32)&AnimSprite_EfxIvald2_57 + 0x1,
    0x80000000,
    0x386C0278,
    (u32)&AnimSprite_EfxIvald2_57 + 0x1,
    0x80000000,
};
