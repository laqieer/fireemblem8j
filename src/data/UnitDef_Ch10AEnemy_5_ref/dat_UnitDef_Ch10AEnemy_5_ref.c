#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch10AEnemy_5.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch10AEnemy_5_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch10AEnemy_5\n"
"UnitDef_Ch10AEnemy_5:\n"
"\t.4byte 0x550048A8\n"
"\t.4byte 0x010001C0\n"
"\t.4byte data_0890C9BC + 0x84\n"
"\t.4byte 0x00000015\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x550048A8\n"
"\t.4byte 0x00000200\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000015\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x4D0048A8\n"
"\t.4byte 0x01000180\n"
"\t.4byte data_0890C9BC + 0x8C\n"
"\t.4byte 0x0000001C\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
