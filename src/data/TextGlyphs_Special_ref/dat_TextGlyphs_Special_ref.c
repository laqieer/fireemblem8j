#include "global.h"

/* De-pointered from data/residual/TextGlyphs_Special.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 gFontgrp_323[];
extern const u8 gFontgrp_324[];
extern const u8 gFontgrp_325[];
extern const u8 gFontgrp_326[];
extern const u8 gFontgrp_327[];
extern const u8 gFontgrp_328[];
extern const u8 gFontgrp_329[];
extern const u8 gFontgrp_330[];
extern const u8 gFontgrp_331[];
extern const u8 gFontgrp_332[];
extern const u8 gFontgrp_333[];
extern const u8 gFontgrp_334[];
extern const u8 gFontgrp_335[];
extern const u8 gFontgrp_336[];
extern const u8 gFontgrp_337[];
extern const u8 gFontgrp_338[];
extern const u8 gFontgrp_339[];
extern const u8 gFontgrp_340[];
extern const u8 gFontgrp_341[];
extern const u8 gFontgrp_342[];
extern const u8 gFontgrp_343[];
extern const u8 gFontgrp_344[];
extern const u8 gFontgrp_345[];
extern const u8 gFontgrp_346[];
extern const u8 gFontgrp_347[];
extern const u8 gFontgrp_348[];
extern const u8 gFontgrp_349[];
extern const u8 gFontgrp_350[];
extern const u8 gFontgrp_351[];
extern const u8 gFontgrp_352[];
extern const u8 gFontgrp_353[];
extern const u8 gFontgrp_354[];
extern const u8 gFontgrp_355[];
extern const u8 gFontgrp_356[];
extern const u8 gFontgrp_357[];
extern const u8 gFontgrp_358[];
extern const u8 gFontgrp_359[];
extern const u8 gFontgrp_360[];
extern const u8 gFontgrp_361[];
extern const u8 gFontgrp_362[];
extern const u8 gFontgrp_363[];
extern const u8 gFontgrp_364[];

SECTION(".rodata.dat_TextGlyphs_Special_ref") static const u32 TextGlyphs_Special__shift[] = {
    (u32)&gFontgrp_323,
    (u32)&gFontgrp_324,
    (u32)&gFontgrp_325,
    (u32)&gFontgrp_326,
    (u32)&gFontgrp_327,
    (u32)&gFontgrp_328,
    (u32)&gFontgrp_329,
    (u32)&gFontgrp_330,
    (u32)&gFontgrp_331,
    (u32)&gFontgrp_332,
    (u32)&gFontgrp_333,
    (u32)&gFontgrp_334,
    (u32)&gFontgrp_335,
    (u32)&gFontgrp_336,
    (u32)&gFontgrp_337,
    (u32)&gFontgrp_338,
    (u32)&gFontgrp_339,
    (u32)&gFontgrp_340,
    (u32)&gFontgrp_341,
    (u32)&gFontgrp_342,
    (u32)&gFontgrp_343,
    (u32)&gFontgrp_344,
    (u32)&gFontgrp_345,
    (u32)&gFontgrp_346,
    (u32)&gFontgrp_347,
    (u32)&gFontgrp_348,
    (u32)&gFontgrp_349,
    (u32)&gFontgrp_350,
    (u32)&gFontgrp_351,
    (u32)&gFontgrp_352,
    (u32)&gFontgrp_353,
    (u32)&gFontgrp_354,
    (u32)&gFontgrp_355,
    (u32)&gFontgrp_356,
    (u32)&gFontgrp_357,
    (u32)&gFontgrp_358,
    (u32)&gFontgrp_359,
    (u32)&gFontgrp_360,
    (u32)&gFontgrp_361,
    (u32)&gFontgrp_362,
    (u32)&gFontgrp_363,
    (u32)&gFontgrp_364,
};
__asm__(".global TextGlyphs_Special\n\t.set TextGlyphs_Special, TextGlyphs_Special__shift\n");
