#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch5xAlly_2.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch5xAlly_2_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch5xAlly_2\n"
"UnitDef_Ch5xAlly_2:\n"
"\t.4byte 0x0800010F\n"
"\t.4byte 0x01000309\n"
"\t.4byte data_0890A3D4 + 0x28\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000510\n"
"\t.4byte 0x01000349\n"
"\t.4byte data_0890A3D4 + 0x30\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000511\n"
"\t.4byte 0x01000348\n"
"\t.4byte data_0890A3D4 + 0x38\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000742\n"
"\t.4byte 0x01000388\n"
"\t.4byte data_0890A3D4 + 0x40\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
