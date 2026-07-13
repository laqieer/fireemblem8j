#include "global.h"
#include "fontgrp.h"

/* Migrated from asm/data_0857DA2C.s (region-same graphics, single section).
 * Typed as struct Glyph (0x48 B/record) so sjisNext is a relocatable
 * symbol reference (R_ARM_ABS32), not a raw ROM literal -- issue #143:
 * agbcc does not emit relocations for plain numeric u32 initializers,
 * so the previous `u32[]` form silently baked a non-shiftable pointer.
 * Byte-identical to baserom (gated by make compare). */

extern struct Glyph frontier_df4_uistuff_006_57E4DC[];

struct Glyph SjisGlyphs_0857DA2C[] __attribute__((section(".data.residue.0857DA2C"))) = {
    { .sjisNext = &frontier_df4_uistuff_006_57E4DC[5], .sjisByte1 = 0x81, .width = 0x06,
      .bitmap = {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x00000000, 0x00000000, 0x0000003C,
        0x000000EB, 0x000000EB, 0x0000003C, 0x00000000,
      } },
};
