#include "global.h"

/* De-pointered from data/residual/EventScr_Ch2Tutorial21.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch2_7[];

SECTION(".rodata.dat_EventScr_Ch2Tutorial21_ref") static const u32 EventScr_Ch2Tutorial21__shift[] = {
    0x00001120,
    0x00001A20,
    0x091F1B20,
    0x00001D20,
    0x00001B22,
    0x00C00229,
    0x00001A23,
    0x000B0540,
    0xFFFFFFFF,
    0x093D1B20,
    0x00001D20,
    0x00001B22,
    0x00C40229,
    0x00003D20,
    0x00000B40,
    (u32)&EventScr_Ch2_7,
    0x00070228,
    0x00000120,
};
__asm__(".global EventScr_Ch2Tutorial21\n\t.set EventScr_Ch2Tutorial21, EventScr_Ch2Tutorial21__shift\n");
