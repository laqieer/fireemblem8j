#include "global.h"

/* Migrated from asm/data_08595864.s (region-same graphics, single section).
 * De-pointered for #143: this is a struct Glyph[] whose Glyph.sjisNext fields were
 * stored as raw absolute words inside an opaque INCBIN, so they did NOT relocate
 * under the +0x40000 shifted-ROM build (kanji glyph-chain corruption). Each sjisNext
 * is now a relocatable `.4byte Sym + addend`; the remaining glyph bytes stay raw via
 * .incbin. Byte-identical to the original INCBIN_U8 (verified by make compare).
 */

__asm__(
"	.section .data.residue.08595864, \"aw\", %progbits\n"
"	.global data_08595864\n"
"data_08595864:\n"
"	.4byte frontier_df4_uistuff_018_59B0FC + 0x510\n"
"	.incbin \"data/residual/data_08595864.bin\", 0x4, 0x44\n"
"	.4byte frontier_df4_uistuff_013_5987EC + 0x360\n"
"	.incbin \"data/residual/data_08595864.bin\", 0x4C, 0x44\n"
);
