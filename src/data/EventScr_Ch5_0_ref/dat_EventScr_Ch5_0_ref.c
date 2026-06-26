#include "global.h"

/* De-pointered from data/residual/EventScr_Ch5_0.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch5_0_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch5_0\n"
"EventScr_Ch5_0:\n"
"\t.4byte 0x00001520\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x0000098D\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A60448\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00001521\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x085B9D24\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00030540\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0xFFFF3720\n"
"\t.4byte 0x00020540\n"
"\t.4byte EventScr_Ch5_9\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_CallOnTutorialMode\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
