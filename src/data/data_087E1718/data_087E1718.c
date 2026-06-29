#include "global.h"

/* Migrated from asm/data_087E1718.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* D312 ID: funcmap exact (layout/us_jp_funcmap.tsv) + byte-identical (248 B, whole
 * symbol) to fe8u btl_bg_64_palette. Byte-neutral rename; section unchanged. */
u8 btl_bg_64_palette[] __attribute__((section(".data.residue.087E1718"))) = INCBIN_U8("data/residual/data_087E1718.bin");
