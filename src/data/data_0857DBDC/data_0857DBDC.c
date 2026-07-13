#include "global.h"
#include "fontgrp.h"

/* Migrated from asm/data_0857DBDC.s (region-same graphics, single section).
 * Typed as struct Glyph (0x48 B/record) so sjisNext is a relocatable
 * symbol reference (R_ARM_ABS32), not a raw ROM literal -- issue #143:
 * agbcc does not emit relocations for plain numeric u32 initializers,
 * so the previous `u32[]` form silently baked a non-shiftable pointer.
 * Byte-identical to baserom (gated by make compare). */

extern struct Glyph frontier_df3_fontgrp_se_002_57FACC[];

struct Glyph SjisGlyphs_0857DBDC[] __attribute__((section(".data.residue.0857DBDC"))) = {
    { .sjisNext = &frontier_df3_fontgrp_se_002_57FACC[6], .sjisByte1 = 0x82, .width = 0x07,
      .bitmap = {
        0x00000000, 0x00000000, 0x00000000, 0x00003FFC,
        0x0000EAAB, 0x0000EFAC, 0x000033AC, 0x00000FAC,
        0x00003AAC, 0x00003BAC, 0x00000FAC, 0x000003AC,
        0x000003AC, 0x00000EAB, 0x000003FC, 0x00000000,
      } },
};
