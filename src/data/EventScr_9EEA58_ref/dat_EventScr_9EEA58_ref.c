#include "global.h"

/* De-pointered from data/residual/EventScr_9EEA58.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_9EEA58_ref, \"a\", %progbits\n"
"\t.global EventScr_9EEA58\n"
"EventScr_9EEA58:\n"
"\t.4byte 0x00080320\n"
"\t.4byte 0x801B0C41\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x00101721\n"
"\t.4byte 0x801B0820\n"
"\t.4byte 0x0000342A\n"
"\t.4byte 0x0000342C\n"
"\t.4byte 0x0000342B\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x003F2520\n"
"\t.4byte 0x00101720\n"
"\t.4byte 0x05F43A41\n"
"\t.4byte 0x00080008\n"
"\t.4byte 0x040A3B20\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00101721\n"
"\t.4byte 0x002B0620\n"
"\t.4byte 0x001B2520\n"
"\t.4byte 0x00000120\n"
);
