#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch8Enemy_8.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch8Enemy_8_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch8Enemy_8\n"
"UnitDef_Ch8Enemy_8:\n"
"\t.4byte 0x55000F8D\n"
"\t.4byte 0x01000610\n"
"\t.4byte data_0890BDC4 + 0x90\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x55003F8D\n"
"\t.4byte 0x01000610\n"
"\t.4byte data_0890BDC4 + 0x98\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x55000F8D\n"
"\t.4byte 0x01000610\n"
"\t.4byte data_0890BDC4 + 0xA0\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x55004E8D\n"
"\t.4byte 0x01000610\n"
"\t.4byte data_0890BDC4 + 0xA8\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
