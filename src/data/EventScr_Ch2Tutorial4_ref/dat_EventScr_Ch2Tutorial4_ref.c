#include "global.h"

/* De-pointered from data/residual/EventScr_Ch2Tutorial4.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch2Tutorial5[];

SECTION(".rodata.dat_EventScr_Ch2Tutorial4_ref") static const u32 EventScr_Ch2Tutorial4__shift[] = {
    0x00070228,
    0x00001120,
    0x00001520,
    0x00001A20,
    0x091D1B20,
    0x00001D20,
    0x00001B22,
    0x00001521,
    0x00003D20,
    0x00063120,
    0x04083B24,
    0x003C0E20,
    0x00001A23,
    0x000B0540,
    0x00580010,
    0x09331B20,
    0x00001D20,
    0x00001B22,
    0x00003B22,
    0x010A1120,
    0x00030B41,
    (u32)&EventScr_Ch2Tutorial5,
    0x00000120,
};
__asm__(".global EventScr_Ch2Tutorial4\n\t.set EventScr_Ch2Tutorial4, EventScr_Ch2Tutorial4__shift\n");
