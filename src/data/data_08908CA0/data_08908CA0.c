#include "global.h"

extern const u8 REDA_Ch3NPC_COLM[];

/* Migrated from asm/data_08908CA0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u32 UnitDef_Ch3NPC[] __attribute__((section(".data.residue.08908CA0"))) = {
    0x12000D09,
    0x01000140,
    (u32)&REDA_Ch3NPC_COLM,
    0x006C6B01,
    0x00080506,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
u32 REDA_Ch3Enemy_2_RIEV[] __attribute__((section(".data.residue.08908CC8"))) = {
    0x0001014E, 0x0000FFFF,
};
u32 REDA_Ch3Enemy_2_CAELLACH[] __attribute__((section(".data.residue.08908CD0"))) = {
    0x0001014F, 0x0000FFFF,
};
u32 REDA_Ch3Enemy_2_VALTER[] __attribute__((section(".data.residue.08908CD8"))) = {
    0x0001014D, 0x0000FFFF,
};
u32 UnitDef_Ch3Units[] __attribute__((section(".data.residue.08908CE0"))) = {
    0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000,
};
u32 UnitDef_Ch3Enemy_1[] __attribute__((section(".data.residue.08908CF4"))) = {
    0x0D6B0B6B, 0x0000008E, 0x00000000, 0x00000000,
    0x00000000, 0x0D6B4F40, 0x000000CF, 0x00000000,
    0x00000000, 0x00000000, 0x0D00351D, 0x0000014E,
    0x00000000, 0x00000000, 0x00000000, 0x0D002169,
    0x0000014D, 0x00000000, 0x00000000, 0x00000000,
    0x0D6B2A44, 0x0000014F, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000,
};
