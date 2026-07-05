#include "global.h"

/* Migrated from asm/data_08594E8C.s (region-same graphics, single section).
 * De-pointered for #143: this is a struct Glyph[] whose Glyph.sjisNext fields were
 * stored as raw absolute words inside an opaque INCBIN, so they did NOT relocate
 * under the +0x40000 shifted-ROM build (kanji glyph-chain corruption). Each sjisNext
 * is now a relocatable `.4byte Sym + addend`; the remaining glyph bytes stay raw via
 * .incbin. Byte-identical to the original INCBIN_U8 (verified by make compare).
 */

__asm__(
"	.section .data.residue.08594E8C, \"aw\", %progbits\n"
"	.global data_08594E8C\n"
"data_08594E8C:\n"
"	.4byte frontier_df4_uistuff_015_599BE4 + 0x168\n"
"	.incbin \"data/residual/data_08594E8C.bin\", 0x4, 0x44\n"
"	.4byte frontier_df4_uistuff_017_59A574 + 0x120\n"
"	.incbin \"data/residual/data_08594E8C.bin\", 0x4C, 0x44\n"
"	.4byte frontier_df4_uistuff_014_598E64 + 0x678\n"
"	.incbin \"data/residual/data_08594E8C.bin\", 0x94, 0x44\n"
);
