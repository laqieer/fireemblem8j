#include "global.h"

/* De-pointered from data/residual/UnitDef_Event_PrologueGradoShamans.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Event_PrologueGradoShamans_ref, \"a\", %progbits\n"
"\t.global UnitDef_Event_PrologueGradoShamans\n"
"UnitDef_Event_PrologueGradoShamans:\n"
"\t.4byte 0x0C002D80\n"
"\t.4byte 0x01000045\n"
"\t.4byte data_08908228 + 0x28\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0C002D80\n"
"\t.4byte 0x01000085\n"
"\t.4byte data_08908228 + 0x30\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0D002F80\n"
"\t.4byte 0x01000293\n"
"\t.4byte data_08908228 + 0x38\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0D002F80\n"
"\t.4byte 0x01000294\n"
"\t.4byte data_08908228 + 0x40\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
