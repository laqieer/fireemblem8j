#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch5xEnemy_3.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch5xEnemy_3_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch5xEnemy_3\n"
"UnitDef_Ch5xEnemy_3:\n"
"\t.4byte 0x0D001F80\n"
"\t.4byte 0x01000201\n"
"\t.4byte data_0890A480 + 0x54\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0D001F80\n"
"\t.4byte 0x01000381\n"
"\t.4byte data_0890A480 + 0x5C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0D001F80\n"
"\t.4byte 0x010002C1\n"
"\t.4byte data_0890A480 + 0x64\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0D001F80\n"
"\t.4byte 0x010001C1\n"
"\t.4byte data_0890A480 + 0x6C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0D001F80\n"
"\t.4byte 0x01000408\n"
"\t.4byte data_0890A480 + 0x74\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
