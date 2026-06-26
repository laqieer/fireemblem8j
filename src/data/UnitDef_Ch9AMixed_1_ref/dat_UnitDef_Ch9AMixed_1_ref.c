#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch9AMixed_1.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch9AMixed_1_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch9AMixed_1\n"
"UnitDef_Ch9AMixed_1:\n"
"\t.4byte 0x08000702\n"
"\t.4byte 0x01000196\n"
"\t.4byte data_0890C0A4 + 0xD8\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000201\n"
"\t.4byte 0x00000195\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0D003FA7\n"
"\t.4byte 0x00000216\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
