#include "global.h"

/* Migrated from asm/data_08908CA0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08908CA0, \"aw\", %progbits\n"
"\t.global UnitDef_Ch3NPC\n"
"UnitDef_Ch3NPC:\n"
"\t.4byte 0x12000D09\n"
"\t.4byte 0x01000140\n"
"\t.4byte data_08908958 + 0x19C\n"
"\t.4byte 0x006C6B01\n"
"\t.4byte 0x00080506\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice UnitDef_Ch3NPC: ptr=1 data=9 skip=0 */
u8 REDA_Ch3Enemy_2_RIEV[] __attribute__((section(".data.residue.08908CC8"))) = INCBIN_U8("data/residual/data_08908CA0.bin", 40, 8);
u8 REDA_Ch3Enemy_2_CAELLACH[] __attribute__((section(".data.residue.08908CD0"))) = INCBIN_U8("data/residual/data_08908CA0.bin", 48, 8);
u8 REDA_Ch3Enemy_2_VALTER[] __attribute__((section(".data.residue.08908CD8"))) = INCBIN_U8("data/residual/data_08908CA0.bin", 56, 8);
u8 UnitDef_Ch3Units[] __attribute__((section(".data.residue.08908CE0"))) = INCBIN_U8("data/residual/data_08908CA0.bin", 64, 20);
u8 UnitDef_Ch3Enemy_1[] __attribute__((section(".data.residue.08908CF4"))) = INCBIN_U8("data/residual/data_08908CA0.bin", 84, 120);
