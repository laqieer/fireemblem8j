#include "global.h"

/* De-pointered from data/residual/EventScr_Ch12A_0.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch12A_0_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch12A_0\n"
"EventScr_Ch12A_0:\n"
"\t.4byte 0x00001520\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x00000A24\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0xF4\n"
"\t.4byte 0x00001521\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_085B9BBC + 0x168\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x00000059\n"
"\t.4byte 0xFFFF3720\n"
"\t.4byte 0x00022720\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
