#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch4Ally_0.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_UnitDef_Ch4Ally_0_ref, \"a\", %progbits\n"
"\t.global UnitDef_Ch4Ally_0\n"
"UnitDef_Ch4Ally_0:\n"
"\t.4byte 0x08000201\n"  /* coincidental const into fn: raw */
"\t.4byte 0x01000005\n"
"\t.4byte REDA_Ch4Ally_0_EIRIKA\n"
"\t.4byte 0x00006C09\n"
"\t.4byte 0x00000000\n"
"\t.4byte SpriteText_DrawBackground + 0x1\n"
"\t.4byte 0x01000005\n"
"\t.4byte REDA_Ch4Ally_0_MOULDER\n"
"\t.4byte 0x0000004B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000D09\n"  /* coincidental const into fn: raw */
"\t.4byte 0x01000004\n"
"\t.4byte REDA_Ch4Ally_0_COLM\n"
"\t.4byte 0x00006B01\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08004806\n"  /* coincidental const into fn: raw */
"\t.4byte 0x01000004\n"
"\t.4byte REDA_Ch4Ally_0_VANESSA\n"
"\t.4byte 0x00006C15\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000903\n"  /* coincidental const into fn: raw */
"\t.4byte 0x01000003\n"
"\t.4byte REDA_Ch4Ally_0_GILLIAM\n"
"\t.4byte 0x00006C14\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08001A08\n"  /* coincidental const into fn: raw */
"\t.4byte 0x01000003\n"
"\t.4byte REDA_Ch4Ally_0_NEIMI\n"
"\t.4byte 0x00006C2D\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x08000702\n"  /* coincidental const into fn: raw */
"\t.4byte 0x01000006\n"
"\t.4byte REDA_Ch4Ally_0_SETH\n"
"\t.4byte 0x006C1703\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x10003D07\n"
"\t.4byte 0x01000002\n"
"\t.4byte REDA_Ch4Ally_0_ROSS\n"
"\t.4byte 0x00006C2C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
