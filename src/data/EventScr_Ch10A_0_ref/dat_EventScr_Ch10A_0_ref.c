#include "global.h"

/* De-pointered from data/residual/EventScr_Ch10A_0.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch10A_0_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch10A_0\n"
"EventScr_Ch10A_0:\n"
"\t.4byte 0x004F2621\n"
"\t.4byte 0x004F3B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00141220\n"
"\t.4byte 0x00001A20\n"
"\t.4byte 0x09F11B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x01103B20\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00001520\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000013\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x000009F2\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0xF4\n"
"\t.4byte 0x00001521\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
