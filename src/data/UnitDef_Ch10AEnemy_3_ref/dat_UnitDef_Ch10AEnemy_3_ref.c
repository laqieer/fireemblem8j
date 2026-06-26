#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch10AEnemy_3.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch10AEnemy_3_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch10AEnemy_3\n"
"UnitDef_Ch10AEnemy_3:\n"
"\t.4byte 0x550048A8\n"
"\t.4byte 0x01000780\n"
"\t.4byte data_0890C9BC + 0x3C\n"
"\t.4byte 0x00000015\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x550048A8\n"
"\t.4byte 0x01000780\n"
"\t.4byte data_0890C9BC + 0x44\n"
"\t.4byte 0x00000015\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x0D0049A8\n"
"\t.4byte 0x01000780\n"
"\t.4byte data_0890C9BC + 0x4C\n"
"\t.4byte 0x00000016\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x550048A8\n"
"\t.4byte 0x01000780\n"
"\t.4byte data_0890C9BC + 0x54\n"
"\t.4byte 0x00000015\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x550048A8\n"
"\t.4byte 0x01000780\n"
"\t.4byte data_0890C9BC + 0x5C\n"
"\t.4byte 0x00006115\n"
"\t.4byte 0x00090000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
