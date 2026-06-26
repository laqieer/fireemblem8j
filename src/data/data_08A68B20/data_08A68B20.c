#include "global.h"

/* Migrated from asm/data_08A68B20.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A68B20, \"aw\", %progbits\n"
"\t.global data_08A68B20\n"
"data_08A68B20:\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_Ch16A_11\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00102520\n"
"\t.4byte 0x00002C40\n"
"\t.4byte frontier_df3_unitdef_b_007_911200 + 0x190\n"
"\t.4byte 0x00003020\n"
"\t.4byte 0x00012C40\n"
"\t.4byte UnitDef_Ch16AEnemy_0\n"
"\t.4byte 0x00003020\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch16AEnemy_1\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x2C\n"
"\t.4byte 0x0000342A\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_085B9BBC + 0x200\n"
"\t.4byte 0x000C0229\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice data_08A68B20: ptr=6 data=16 skip=0 */
