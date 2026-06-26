#include "global.h"

/* De-pointered from data/residual/EventScr_Ch11B_0.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch11B_0_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch11B_0\n"
"EventScr_Ch11B_0:\n"
"\t.4byte 0x00111220\n"
"\t.4byte 0x000F2621\n"
"\t.4byte 0x000F3B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x0000000D\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0xCC\n"
"\t.4byte 0x0A931B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00101721\n"
"\t.4byte 0x00002721\n"
"\t.4byte 0x00012720\n"
"\t.4byte 0x00002220\n"
"\t.4byte 0x09092628\n"
"\t.4byte 0x00001A20\n"
"\t.4byte 0x00012C40\n"
"\t.4byte UnitDef_Ch11BEnemy_1\n"
"\t.4byte 0x00003020\n"
"\t.4byte 0x00012C40\n"
"\t.4byte UnitDef_Ch11BEnemy_2\n"
"\t.4byte 0x00003020\n"
"\t.4byte 0x00101720\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
