#include "global.h"

/* De-pointered from data/residual/EventScr_Ch2Tutorial22.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch2Tutorial23[];

SECTION(".rodata.dat_EventScr_Ch2Tutorial22_ref") static const u32 EventScr_Ch2Tutorial22__shift[] = {
    0x00001120,
    0x00013B21,
    0x003C0E20,
    0x00003B22,
    0x00001A20,
    0x091C1B20,
    0x00001D20,
    0x00001B22,
    0x00001A23,
    0x000B0540,
    0xFFFFFFFF,
    0x09401B20,
    0x00001D20,
    0x00001B22,
    0x00013B25,
    0x003C0E20,
    0x00003B22,
    0x00020B41,
    (u32)&EventScr_Ch2Tutorial23,
    0x40003D20,
    0x00070228,
    0x00000120,
};
__asm__(".global EventScr_Ch2Tutorial22\n\t.set EventScr_Ch2Tutorial22, EventScr_Ch2Tutorial22__shift\n");
