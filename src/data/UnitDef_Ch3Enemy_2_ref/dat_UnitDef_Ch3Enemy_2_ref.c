#include "global.h"

/* De-pointered from data/residual/UnitDef_Ch3Enemy_2.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 REDA_Ch3Enemy_2_CAELLACH[];
extern const u8 REDA_Ch3Enemy_2_RIEV[];
extern const u8 REDA_Ch3Enemy_2_VALTER[];

SECTION(".rodata.dat_UnitDef_Ch3Enemy_2_ref") static const u32 UnitDef_Ch3Enemy_2__shift[] = {
    0x0D002B57,
    0x0100028E,
    (u32)&REDA_Ch3Enemy_2_RIEV,
    0x00000000,
    0x00000000,
    0x0D001153,
    0x0100028F,
    (u32)&REDA_Ch3Enemy_2_CAELLACH,
    0x00000000,
    0x00000000,
    0x0D002343,
    0x0100028D,
    (u32)&REDA_Ch3Enemy_2_VALTER,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
__asm__(".global UnitDef_Ch3Enemy_2\n\t.set UnitDef_Ch3Enemy_2, UnitDef_Ch3Enemy_2__shift\n");
