#include "global.h"

/* Byte-neutral SPLIT of the former data_0890F2E0 residue (320 B) into
 * 5 named sub-objects. Each keeps its exact word stream and its own
 * .data.residue.<ADDR> section for contiguous address-order placement
 * (make compare is the oracle). Consumers repoint from data_0890F2E0+0xNN. */

u32 UnitDef_Ch13AEnemy_4[] __attribute__((section(".data.residue.0890F2E0"))) = {
    0x65000580, 0x00000180, 0x00000000, 0x00000016, 0x00091200, 0x65000580,
    0x00000200, 0x00000000, 0x00000016, 0x00091200, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000,
};
u32 UnitDef_Ch13AEnemy_5[] __attribute__((section(".data.residue.0890F31C"))) = {
    0x65000580, 0x00000057, 0x00000000, 0x00000014, 0x00090000, 0x65000580,
    0x000000D7, 0x00000000, 0x00000014, 0x00090000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000,
};
u32 UnitDef_Ch13AEnemy_6[] __attribute__((section(".data.residue.0890F358"))) = {
    0x65000580, 0x000002D7, 0x00000000, 0x00000014, 0x00090000, 0x65000580,
    0x00000357, 0x00000000, 0x00000001, 0x00090000, 0x5D000580, 0x000003D7,
    0x00000000, 0x00001C14, 0x00090000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000,
};
u32 UnitDef_Ch13AEnemy_7[] __attribute__((section(".data.residue.0890F3A8"))) = {
    0x5D000F80, 0x00002083, 0x00000000, 0x00000013, 0x00090000, 0x65003F80,
    0x00000044, 0x00000000, 0x0000001F, 0x00090000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000,
};
u32 UnitDef_Ch13AEnemy_8[] __attribute__((section(".data.residue.0890F3E4"))) = {
    0x65000F80, 0x00000083, 0x00000000, 0x00000001, 0x00090000, 0x65003F80,
    0x00000044, 0x00000000, 0x0000001F, 0x00090000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000,
};
