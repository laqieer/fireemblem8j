#include "global.h"

/* De-pointered from data/residual/gEfxSelfThunderBGFrames.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 Img_EfxSelfThunderBG1[];
extern const u8 Img_EfxSelfThunderBG10[];
extern const u8 Img_EfxSelfThunderBG11[];
extern const u8 Img_EfxSelfThunderBG12[];
extern const u8 Img_EfxSelfThunderBG13[];
extern const u8 Img_EfxSelfThunderBG14[];
extern const u8 Img_EfxSelfThunderBG15[];
extern const u8 Img_EfxSelfThunderBG16[];
extern const u8 Img_EfxSelfThunderBG2[];
extern const u8 Img_EfxSelfThunderBG3[];
extern const u8 Img_EfxSelfThunderBG4[];
extern const u8 Img_EfxSelfThunderBG5[];
extern const u8 Img_EfxSelfThunderBG6[];
extern const u8 Img_EfxSelfThunderBG7[];
extern const u8 Img_EfxSelfThunderBG8[];
extern const u8 Img_EfxSelfThunderBG9[];
extern const u8 Pal1_EfxSelfThunderBG[];
extern const u8 Pal2_EfxSelfThunderBG[];
extern const u8 TSA1_EfxSelfThunderBG1[];
extern const u8 TSA1_EfxSelfThunderBG10[];
extern const u8 TSA1_EfxSelfThunderBG11[];
extern const u8 TSA1_EfxSelfThunderBG12[];
extern const u8 TSA1_EfxSelfThunderBG13[];
extern const u8 TSA1_EfxSelfThunderBG14[];
extern const u8 TSA1_EfxSelfThunderBG15[];
extern const u8 TSA1_EfxSelfThunderBG16[];
extern const u8 TSA1_EfxSelfThunderBG2[];
extern const u8 TSA1_EfxSelfThunderBG3[];
extern const u8 TSA1_EfxSelfThunderBG4[];
extern const u8 TSA1_EfxSelfThunderBG5[];
extern const u8 TSA1_EfxSelfThunderBG6[];
extern const u8 TSA1_EfxSelfThunderBG7[];
extern const u8 TSA1_EfxSelfThunderBG8[];
extern const u8 TSA1_EfxSelfThunderBG9[];
extern const u8 TSA2_EfxSelfThunderBG1[];
extern const u8 TSA2_EfxSelfThunderBG10[];
extern const u8 TSA2_EfxSelfThunderBG11[];
extern const u8 TSA2_EfxSelfThunderBG12[];
extern const u8 TSA2_EfxSelfThunderBG13[];
extern const u8 TSA2_EfxSelfThunderBG14[];
extern const u8 TSA2_EfxSelfThunderBG15[];
extern const u8 TSA2_EfxSelfThunderBG16[];
extern const u8 TSA2_EfxSelfThunderBG2[];
extern const u8 TSA2_EfxSelfThunderBG3[];
extern const u8 TSA2_EfxSelfThunderBG4[];
extern const u8 TSA2_EfxSelfThunderBG5[];
extern const u8 TSA2_EfxSelfThunderBG6[];
extern const u8 TSA2_EfxSelfThunderBG7[];
extern const u8 TSA2_EfxSelfThunderBG8[];
extern const u8 TSA2_EfxSelfThunderBG9[];

SECTION(".rodata.dat_gEfxSelfThunderBGFrames_ref") static const u32 gEfxSelfThunderBGFrames__shift[] = {
    0x00000004,
    (u32)&Img_EfxSelfThunderBG1,
    (u32)&TSA1_EfxSelfThunderBG1,
    (u32)&TSA2_EfxSelfThunderBG1,
    (u32)&Pal1_EfxSelfThunderBG,
    0x00000004,
    (u32)&Img_EfxSelfThunderBG2,
    (u32)&TSA1_EfxSelfThunderBG2,
    (u32)&TSA2_EfxSelfThunderBG2,
    (u32)&Pal1_EfxSelfThunderBG,
    0x00000004,
    (u32)&Img_EfxSelfThunderBG3,
    (u32)&TSA1_EfxSelfThunderBG3,
    (u32)&TSA2_EfxSelfThunderBG3,
    (u32)&Pal1_EfxSelfThunderBG,
    0x00000004,
    (u32)&Img_EfxSelfThunderBG4,
    (u32)&TSA1_EfxSelfThunderBG4,
    (u32)&TSA2_EfxSelfThunderBG4,
    (u32)&Pal1_EfxSelfThunderBG,
    0x00000004,
    (u32)&Img_EfxSelfThunderBG5,
    (u32)&TSA1_EfxSelfThunderBG5,
    (u32)&TSA2_EfxSelfThunderBG5,
    (u32)&Pal1_EfxSelfThunderBG,
    0x00000004,
    (u32)&Img_EfxSelfThunderBG6,
    (u32)&TSA1_EfxSelfThunderBG6,
    (u32)&TSA2_EfxSelfThunderBG6,
    (u32)&Pal1_EfxSelfThunderBG,
    0x00000004,
    (u32)&Img_EfxSelfThunderBG7,
    (u32)&TSA1_EfxSelfThunderBG7,
    (u32)&TSA2_EfxSelfThunderBG7,
    (u32)&Pal1_EfxSelfThunderBG,
    0x00000004,
    (u32)&Img_EfxSelfThunderBG8,
    (u32)&TSA1_EfxSelfThunderBG8,
    (u32)&TSA2_EfxSelfThunderBG8,
    (u32)&Pal1_EfxSelfThunderBG,
    0x00000004,
    (u32)&Img_EfxSelfThunderBG9,
    (u32)&TSA1_EfxSelfThunderBG9,
    (u32)&TSA2_EfxSelfThunderBG9,
    (u32)&Pal1_EfxSelfThunderBG,
    0x00000004,
    (u32)&Img_EfxSelfThunderBG10,
    (u32)&TSA1_EfxSelfThunderBG10,
    (u32)&TSA2_EfxSelfThunderBG10,
    (u32)&Pal1_EfxSelfThunderBG,
    0x00000004,
    (u32)&Img_EfxSelfThunderBG11,
    (u32)&TSA1_EfxSelfThunderBG11,
    (u32)&TSA2_EfxSelfThunderBG11,
    (u32)&Pal1_EfxSelfThunderBG,
    0x00000004,
    (u32)&Img_EfxSelfThunderBG12,
    (u32)&TSA1_EfxSelfThunderBG12,
    (u32)&TSA2_EfxSelfThunderBG12,
    (u32)&Pal1_EfxSelfThunderBG,
    0x00000004,
    (u32)&Img_EfxSelfThunderBG13,
    (u32)&TSA1_EfxSelfThunderBG13,
    (u32)&TSA2_EfxSelfThunderBG13,
    (u32)&Pal1_EfxSelfThunderBG,
    0x00000004,
    (u32)&Img_EfxSelfThunderBG14,
    (u32)&TSA1_EfxSelfThunderBG14,
    (u32)&TSA2_EfxSelfThunderBG14,
    (u32)&Pal1_EfxSelfThunderBG,
    0x00000004,
    (u32)&Img_EfxSelfThunderBG15,
    (u32)&TSA1_EfxSelfThunderBG15,
    (u32)&TSA2_EfxSelfThunderBG15,
    (u32)&Pal2_EfxSelfThunderBG,
    0x00000004,
    (u32)&Img_EfxSelfThunderBG16,
    (u32)&TSA1_EfxSelfThunderBG16,
    (u32)&TSA2_EfxSelfThunderBG16,
    (u32)&Pal2_EfxSelfThunderBG,
    0xFFFFFFFF,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
__asm__(".global gEfxSelfThunderBGFrames\n\t.set gEfxSelfThunderBGFrames, gEfxSelfThunderBGFrames__shift\n");
