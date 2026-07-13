#include "global.h"
#include "fontgrp.h"

/* Migrated from asm/data_0857D36C.s (region-same graphics, single section).
 * Typed as struct Glyph (0x48 B/record) so sjisNext is a relocatable
 * symbol reference (R_ARM_ABS32), not a raw ROM literal -- issue #143:
 * agbcc does not emit relocations for plain numeric u32 initializers,
 * so the previous `u32[]` form silently baked a non-shiftable pointer.
 * Byte-identical to baserom (gated by make compare). */

extern struct Glyph frontier_df3_fontgrp_se_009_582F1C[];

struct Glyph SjisGlyphs_0857D36C[] __attribute__((section(".data.residue.0857D36C"))) = {
    { .sjisNext = &frontier_df3_fontgrp_se_009_582F1C[162], .sjisByte1 = 0x82, .width = 0x07,
      .bitmap = {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x00000FC0, 0x00003AB0, 0x0000EBAC,
        0x0000EBEB, 0x0000EBEB, 0x0000EBEB, 0x0000EBEB,
        0x00003AEB, 0x00000EAC, 0x000003F0, 0x00000000,
      } },
};
