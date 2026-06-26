#include "global.h"

/* De-pointered from data/residual/EventScr_Ch21A_9.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_UnitWarpOUT[];

SECTION(".rodata.dat_EventScr_Ch21A_9_ref") static const u32 EventScr_Ch21A_9__shift[] = {
    0x00001860,
    0x00000000,
    0x00000000,
    0x0A061862,
    0x00000004,
    0x00000000,
    0x001E0E20,
    0x00022F42,
    0x00030040,
    0x00003020,
    0x001E0E22,
    0x00020540,
    0x00000040,
    0x00000A40,
    (u32)&EventScr_UnitWarpOUT,
    0x0040342F,
    0x00001A20,
    0x0B871B20,
    0x00001D20,
    0x00001B22,
    0x00001A24,
    0x000B0540,
    0x00800018,
    0x0B881B20,
    0x00001D20,
    0x00001B22,
    0x00000120,
};
__asm__(".global EventScr_Ch21A_9\n\t.set EventScr_Ch21A_9, EventScr_Ch21A_9__shift\n");
