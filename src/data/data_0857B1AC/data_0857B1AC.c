#include "global.h"
#include "fontgrp.h"

/* Migrated from asm/data_0857B1AC.s (region-same graphics, single section).
 * Typed as struct Glyph (0x48 B/record) so sjisNext is a relocatable
 * symbol reference (R_ARM_ABS32), not a raw ROM literal -- issue #143:
 * agbcc does not emit relocations for plain numeric u32 initializers,
 * so the previous `u32[]` form silently baked a non-shiftable pointer.
 * Byte-identical to baserom (gated by make compare). */

extern struct Glyph frontier_df3_fontgrp_se_000_57E884[];

struct Glyph SjisGlyphs_0857B1AC[] __attribute__((section(".data.residue.0857B1AC"))) = {
    { .sjisNext = &frontier_df3_fontgrp_se_000_57E884[4], .sjisByte1 = 0x82, .width = 0x06,
      .bitmap = {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x000003FC, 0x00000EAB, 0x00003BFC, 0x00003B00,
        0x00000EF0, 0x000003AC, 0x000000F0, 0x00000000,
      } },
};
