#include "global.h"

/* De-pointered from data/residual/EventScr_Ch5_5.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_EventScr_Ch5_5_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch5_5\n"
"EventScr_Ch5_5:\n"
"\t.4byte 0x00020540\n"
"\t.4byte EventScr_Ch5_10\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_CallOnTutorialMode\n"
"\t.4byte 0x00131220\n"
"\t.4byte 0x00020540\n"
"\t.4byte frontier_df4_banim_b_074_909DE8\n"
"\t.4byte 0x00000A40\n"
"\t.4byte 0x08A603AC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x100E3B20\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00001A20\n"
"\t.4byte 0x09851B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);
