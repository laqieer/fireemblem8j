#include "global.h"

/* Migrated from asm/data_08925DD8.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* D312 ID: funcmap exact (layout/us_jp_funcmap.tsv) + extern decl in include/eventcall.h
 * + byte-identical (220 B, whole symbol) to fe8u UnitDef_UnusedAlly_4. Byte-neutral rename
 * (u8[] def matches the established UnitDef pattern); section unchanged => same ROM bytes. */
u8 UnitDef_UnusedAlly_4[] __attribute__((section(".data.residue.08925DD8"))) = INCBIN_U8("data/residual/data_08925DD8.bin");
