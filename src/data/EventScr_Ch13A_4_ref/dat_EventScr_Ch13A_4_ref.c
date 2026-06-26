#include "global.h"

/* De-pointered from data/residual/EventScr_Ch13A_4.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch13A_4_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch13A_4\n"
"EventScr_Ch13A_4:\n"
"\t.4byte 0x00001923\n"
"\t.4byte 0x00010540\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x01CC0625\n"
"\t.4byte 0x00000C40\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x00020540\n"
"\t.4byte data_0890F2E0 + 0x3C\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x58\n"
"\t.4byte 0x00020540\n"
"\t.4byte data_0890F2E0 + 0x78\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x58\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
