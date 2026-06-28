#include "global.h"

/* De-pointered from data/residual/EventScr_Ruin_58.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ruin_58_ref, \"a\", %progbits\n"
"\t.global EventScr_Ruin_58\n"
"EventScr_Ruin_58:\n"
"\t.4byte 0x00101721\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x0000004F\n"
"\t.4byte 0x00001A21\n"
"\t.4byte 0x00000820\n"
"\t.4byte 0xFFFF2140\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00101720\n"
"\t.4byte 0xFFFF0E21\n"
"\t.4byte 0x00101721\n"
"\t.4byte 0x00010540\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x01220620\n"
"\t.4byte 0x00000C45\n"
"\t.4byte 0x00030002\n"
"\t.4byte 0x00002220\n"
"\t.4byte 0x00101720\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
