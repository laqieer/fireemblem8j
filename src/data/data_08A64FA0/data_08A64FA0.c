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
u32 EventScr_Ch7_3[] __attribute__((section(".data.residue.08A64FF0"))) = {
    0x0A022620, 0x0A023B24, 0x003C0E20, 0x00003B22,
    0x08112620, 0x08113B24, 0x003C0E20, 0x00003B22,
    0x00012621, 0x00013B21, 0x003C0E20, 0x00003B22,
    0x00083322, 0x00000C40, 0x0000000C, 0x00083323,
    0x00000C40, 0x0000000C, 0x00001A20, 0x09C21B20,
    0x00001D20, 0x00001B22, 0x00010920, 0x00000820,
    0x00001A20, 0x09C11B20, 0x00001D20, 0x00001B22,
    0x00010820, 0x00D50229, 0x00000120,
};
