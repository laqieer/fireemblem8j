#include "global.h"

/* De-pointered from data/residual/EventScr_Ch9B_9.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 UnitDef_Ch14BAlly_7[];

SECTION(".rodata.dat_EventScr_Ch9B_9_ref") static const u32 EventScr_Ch9B_9__shift[] = {
    0x00020540,
    0x00000000,
    0x00000A40,
    (u32)&UnitDef_Ch14BAlly_7,
    0x01030F21,
    0x00001927,
    0x00000C41,
    0x0000000C,
    0x00001922,
    0x00000C40,
    0x0000000C,
    0x03030F21,
    0x00000820,
    0x000E0221,
    0x00070228,
    0x00000120,
};
__asm__(".global EventScr_Ch9B_9\n\t.set EventScr_Ch9B_9, EventScr_Ch9B_9__shift\n");
