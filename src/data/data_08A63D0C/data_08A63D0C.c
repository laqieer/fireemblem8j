#include "global.h"

/* Migrated from asm/data_08A63D0C.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A63D0C, \"aw\", %progbits\n"
"\t.global EventScr_Ch4_3\n"
"EventScr_Ch4_3:\n"
"\t.4byte 0x00001520\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x00000975\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0xF4\n"
"\t.4byte 0x00001521\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_085B9BBC + 0x168\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x0000001F\n"
"\t.4byte 0xFFFF3720\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch4_3: ptr=2 data=13 skip=0 */
__asm__(
"\t.section .data.residue.08A63D48, \"aw\", %progbits\n"
"\t.global EventScr_Ch4_4\n"
"EventScr_Ch4_4:\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch4Enemy_2\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x58\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch4_4: ptr=2 data=4 skip=0 */
__asm__(
"\t.section .data.residue.08A63D60, \"aw\", %progbits\n"
"\t.global EventScr_Ch4_5\n"
"EventScr_Ch4_5:\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000A40\n"
"\t.4byte UnitDef_Ch14BAlly_7\n"
"\t.4byte 0x00080221\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch4_5: ptr=1 data=6 skip=0 */
__asm__(
"\t.section .data.residue.08A63D7C, \"aw\", %progbits\n"
"\t.global EventScr_Ch4_6\n"
"EventScr_Ch4_6:\n"
"\t.4byte 0x00020540\n"
"\t.4byte UnitDef_Ch4Enemy_1\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0x58\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch4_6: ptr=2 data=4 skip=0 */
u8 EventScr_Ch4_7[] __attribute__((section(".data.residue.08A63D94"))) = INCBIN_U8("data/residual/data_08A63D0C.bin", 136, 32);
u8 EventScr_Ch4_8[] __attribute__((section(".data.residue.08A63DB4"))) = INCBIN_U8("data/residual/data_08A63D0C.bin", 168, 36);
u8 EventScr_Ch4_9[] __attribute__((section(".data.residue.08A63DD8"))) = INCBIN_U8("data/residual/data_08A63D0C.bin", 204, 32);
