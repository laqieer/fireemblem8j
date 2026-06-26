#include "global.h"

/* De-pointered from data/residual/EventScr_Ch8_0.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 UnitDef_Ch8Ally_0[];

SECTION(".rodata.dat_EventScr_Ch8_0_ref") static const u32 EventScr_Ch8_0__shift[] = {
    0x17002620,
    0x00012C40,
    (u32)&UnitDef_Ch8Ally_0,
    0x00003020,
    0x000F3421,
    0x00103421,
    0x00113421,
    0x00010540,
    0x00000001,
    0x000F3428,
    0x00010540,
    0x00000001,
    0x00103428,
    0x00010540,
    0x00000001,
    0x00113428,
    0x000F3B21,
    0x003C0E20,
    0x00003B22,
    0x00251220,
    0x00001A20,
    0x09CE1B20,
    0x00001D20,
    0x00001B22,
    0x00070228,
    0x00000120,
};
__asm__(".global EventScr_Ch8_0\n\t.set EventScr_Ch8_0, EventScr_Ch8_0__shift\n");
