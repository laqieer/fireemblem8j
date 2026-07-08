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

SECTION(".rodata.dat_TextGlyphs_Special_ref") struct Glyph *TextGlyphs_Special[] = {
    (struct Glyph *)&gFontgrp_323,
    (struct Glyph *)&gFontgrp_324,
    (struct Glyph *)&gFontgrp_325,
    (struct Glyph *)&gFontgrp_326,
    (struct Glyph *)&gFontgrp_327,
    (struct Glyph *)&gFontgrp_328,
    (struct Glyph *)&gFontgrp_329,
    (struct Glyph *)&gFontgrp_330,
    (struct Glyph *)&gFontgrp_331,
    (struct Glyph *)&gFontgrp_332,
    (struct Glyph *)&gFontgrp_333,
    (struct Glyph *)&gFontgrp_334,
    (struct Glyph *)&gFontgrp_335,
    (struct Glyph *)&gFontgrp_336,
    (struct Glyph *)&gFontgrp_337,
    (struct Glyph *)&gFontgrp_338,
    (struct Glyph *)&gFontgrp_339,
    (struct Glyph *)&gFontgrp_340,
    (struct Glyph *)&gFontgrp_341,
    (struct Glyph *)&gFontgrp_342,
    (struct Glyph *)&gFontgrp_343,
    (struct Glyph *)&gFontgrp_344,
    (struct Glyph *)&gFontgrp_345,
    (struct Glyph *)&gFontgrp_346,
    (struct Glyph *)&gFontgrp_347,
    (struct Glyph *)&gFontgrp_348,
    (struct Glyph *)&gFontgrp_349,
    (struct Glyph *)&gFontgrp_350,
    (struct Glyph *)&gFontgrp_351,
    (struct Glyph *)&gFontgrp_352,
    (struct Glyph *)&gFontgrp_353,
    (struct Glyph *)&gFontgrp_354,
    (struct Glyph *)&gFontgrp_355,
    (struct Glyph *)&gFontgrp_356,
    (struct Glyph *)&gFontgrp_357,
    (struct Glyph *)&gFontgrp_358,
    (struct Glyph *)&gFontgrp_359,
    (struct Glyph *)&gFontgrp_360,
    (struct Glyph *)&gFontgrp_361,
    (struct Glyph *)&gFontgrp_362,
    (struct Glyph *)&gFontgrp_363,
    (struct Glyph *)&gFontgrp_364,
};
