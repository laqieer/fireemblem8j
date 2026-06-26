#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch6Enemy_0.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch6Enemy_0_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch6Enemy_0\n"
"UnitDef_Ch6Enemy_0:\n"
"\t.4byte 0x3D000580\n"
"\t.4byte 0x010002C0\n"
"\t.4byte data_0890A6A8 + 0x70\n"
"\t.4byte 0x00000014\n"
"\t.4byte 0x00010000\n"
"\t.4byte 0x35000580\n"
"\t.4byte 0x01000240\n"
"\t.4byte data_0890A6A8 + 0x78\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00010000\n"
"\t.4byte 0x35000580\n"
"\t.4byte 0x01000340\n"
"\t.4byte data_0890A6A8 + 0x80\n"
"\t.4byte 0x0000141C\n"
"\t.4byte 0x00010000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
