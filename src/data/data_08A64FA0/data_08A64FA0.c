#include "global.h"

/* Migrated from asm/data_08A64FA0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A64FA0, \"aw\", %progbits\n"
"\t.global EventScr_Ch7_1\n"
"EventScr_Ch7_1:\n"
"\t.4byte 0x00001520\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x000009C7\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0xF4\n"
"\t.4byte 0x00001521\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch7_1: ptr=1 data=9 skip=0 */
__asm__(
"\t.section .data.residue.08A64FC8, \"aw\", %progbits\n"
"\t.global EventScr_Ch7_2\n"
"EventScr_Ch7_2:\n"
"\t.4byte 0x00001520\n"
"\t.4byte 0x00020540\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00030540\n"
"\t.4byte 0x000009C8\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A60354 + 0xF4\n"
"\t.4byte 0x00001521\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch7_2: ptr=1 data=9 skip=0 */
u8 EventScr_Ch7_3[] __attribute__((section(".data.residue.08A64FF0"))) = INCBIN_U8("data/residual/data_08A64FA0.bin", 80, 124);
