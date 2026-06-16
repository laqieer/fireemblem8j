#include "global.h"

/* Migrated from asm/dat_TextGlyphs_Special_ref.s. TextGlyphs is a `struct Glyph *[]` relocatable
 * pointer table (absolute glyph addresses) -> raw bytes via INCBIN_U8 + a
 * typed alias (agbcc-accepted) so the header type is satisfied. byte-identical. */

SECTION(".rodata.dat_TextGlyphs_Special_ref") u8 TextGlyphs_Special_data[] = INCBIN_U8("data/residual/TextGlyphs_Special.bin");
extern struct Glyph *TextGlyphs_Special[1] __attribute__((alias("TextGlyphs_Special_data")));
