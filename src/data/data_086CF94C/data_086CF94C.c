#include "global.h"

/* #145 B1 shiftability carve (pure typed C, no inline asm -- issue #152):
 * DarkGradoOBJ02piece battle-anim slice (JP 0x086CF94C). The blob is split at its
 * interior symbol boundaries into consecutive same-section arrays so the linker
 * places them contiguously (byte-identical) and each AnimScr piece_R label becomes a
 * real relocatable T symbol. Every embedded ROM pointer word is a relocatable ref;
 * the piece_L self-refs point back into data_086CF94C. Byte-exact via `make compare`. */

extern const u8 AnimSprite_EfxDarkGradoOBJ02piece_R_1[];
extern const u8 AnimSprite_EfxDarkGradoOBJ02piece_R_2[];
extern const u8 AnimSprite_EfxDarkGradoOBJ02piece_R_3[];

u32 AnimSprite_EfxDarkGradoOBJ02piece_R_4[] __attribute__((section(".data.residue.086CF94C"))) = {
    0x80000000,
    0xFFF0000C,
    0x0000FFF0,
    0x00000001,
    0x00000000,
    0x00000000,
    0x80000000,
    0xFFF00010,
    0x0000FFF0,
    0x00000001,
    0x00000000,
    0x00000000,
    0x80000000,
    0xFFF00014,
    0x0000FFF0,
    0x00000001,
    0x00000000,
    0x00000000,
};

u32 AnimScr_EfxDarkGradoOBJ02piece1_R[] __attribute__((section(".data.residue.086CF94C"))) = {
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_1 + 0x1,
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_2 + 0x1,
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_3 + 0x1,
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_2 + 0x1,
    0x82000000,
};

u32 AnimScr_EfxDarkGradoOBJ02piece2_R[] __attribute__((section(".data.residue.086CF94C"))) = {
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_4 + 0x1,
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_4 + 0x19,
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_4 + 0x31,
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_4 + 0x19,
    0x82000000,
    0xFFFF0001,
    0x0000FF80,
    0x00800000,
    0x80000300,
    0x00000000,
    0x0000FFE0,
    0x00000001,
    0x00000000,
    0x00000000,
    0xFFFF0001,
    0x0000FF80,
    0x00800000,
    0x80000300,
    0x00000004,
    0x0000FFE0,
    0x00000001,
    0x00000000,
    0x00000000,
    0xFFFF0001,
    0x0000FF80,
    0x00800000,
    0x80000300,
    0x00000008,
    0x0000FFE0,
    0x00000001,
    0x00000000,
    0x00000000,
    0x90000000,
    0xFFF0000C,
    0x0000FFF0,
    0x00000001,
    0x00000000,
    0x00000000,
    0x90000000,
    0xFFF00010,
    0x0000FFF0,
    0x00000001,
    0x00000000,
    0x00000000,
    0x90000000,
    0xFFF00014,
    0x0000FFF0,
    0x00000001,
    0x00000000,
    0x00000000,
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_4 + 0x71,
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_4 + 0x95,
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_4 + 0xB9,
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_4 + 0x95,
    0x82000000,
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_4 + 0xDD,
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_4 + 0xF5,
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_4 + 0x10D,
    (u32)&AnimSprite_EfxDarkGradoOBJ02piece_R_4 + 0xF5,
    0x82000000,
};
