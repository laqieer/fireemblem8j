#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch9AAlly_0.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch9AAlly_0_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch9AAlly_0\n"
"UnitDef_Ch9AAlly_0:\n"
"\t.4byte 0x08000201\n"
"\t.4byte 0x010000C8\n"
"\t.4byte data_0890C0A4 + 0x78\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x20004822\n"
"\t.4byte 0x01000108\n"
"\t.4byte data_0890C0A4 + 0x80\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000702\n"
"\t.4byte 0x010000C9\n"
"\t.4byte data_0890C0A4 + 0x88\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
