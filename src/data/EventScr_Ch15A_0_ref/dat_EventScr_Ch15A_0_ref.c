#include "global.h"

/* De-pointered from data/residual/EventScr_Ch15A_0.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch15A_0_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch15A_0\n"
"EventScr_Ch15A_0:\n"
"\t.4byte 0x00251220\n"
"\t.4byte 0x00090228\n"
"\t.4byte 0x00012C40\n"
"\t.4byte UnitDef_Ch15AAlly_1\n"
"\t.4byte 0x00003020\n"
"\t.4byte 0x00090220\n"
"\t.4byte 0x000F3B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000049\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x00000ADC\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0xF4\n"
"\t.4byte 0x000F3421\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
