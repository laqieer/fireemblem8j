#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch9AMixed_0.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch9AMixed_0_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch9AMixed_0\n"
"UnitDef_Ch9AMixed_0:\n"
"\t.4byte 0x0B004B19\n"
"\t.4byte 0x01000012\n"
"\t.4byte data_0890C0A4 + 0x90\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0B00431A\n"
"\t.4byte 0x01000011\n"
"\t.4byte data_0890C0A4 + 0x98\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0B00331C\n"
"\t.4byte 0x01000013\n"
"\t.4byte data_0890C0A4 + 0xA0\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000201\n"
"\t.4byte 0x020000CF\n"
"\t.4byte data_0890C0A4 + 0xA8\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000702\n"
"\t.4byte 0x030000D0\n"
"\t.4byte data_0890C0A4 + 0xB8\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
