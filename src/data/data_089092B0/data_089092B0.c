#include "global.h"

/* Migrated from asm/data_089092B0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* D312 ID: funcmap exact (layout/us_jp_funcmap.tsv) + extern decl in include/eventcall.h
 * + byte-identical (60 B, whole symbol) to fe8u UnitDef_Ch4Ally_3. Byte-neutral rename
 * (u8[] def matches the established UnitDef pattern, cf data_08908CA0); section unchanged. */
__asm__(
"\t.section .data.residue.089092B0, \"aw\", %progbits\n"
"\t.global UnitDef_Ch4Ally_3\n"
"UnitDef_Ch4Ally_3:\n"
"\t.4byte IrqMain + 0x105\n"
"\t.4byte 0x00000148\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte DecodeString + 0x1E\n"
"\t.4byte 0x00000108\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
