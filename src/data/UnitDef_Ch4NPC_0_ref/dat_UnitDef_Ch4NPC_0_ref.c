#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch4NPC_0.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 REDA_Ch4NPC_0_DOZLA[];
extern const u8 REDA_Ch4NPC_0_LARACHEL[];
extern const u8 REDA_Ch4NPC_0_RENNAC[];

SECTION(".rodata.dat_UnitDef_Ch4NPC_0_ref") static const u32 UnitDef_Ch4NPC_0__shift[] = {
    0x0B014B19,
    0x0100000D,
    (u32)&REDA_Ch4NPC_0_LARACHEL,
    0x0000004C,
    0x00000000,
    0x0B01331C,
    0x0100000E,
    (u32)&REDA_Ch4NPC_0_RENNAC,
    0x00000003,
    0x00000000,
    0x0B01431A,
    0x0100000C,
    (u32)&REDA_Ch4NPC_0_DOZLA,
    0x00000021,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
__asm__(".global UnitDef_Ch4NPC_0\n\t.set UnitDef_Ch4NPC_0, UnitDef_Ch4NPC_0__shift\n");
