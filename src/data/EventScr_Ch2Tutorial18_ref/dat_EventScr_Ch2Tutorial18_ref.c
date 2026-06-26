#include "global.h"

/* De-pointered from data/residual/EventScr_Ch2Tutorial18.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch2Tutorial18[];
extern const u8 EventScr_Tutorial_Exec0[];
extern const u8 data_08A63088[];

SECTION(".rodata.dat_EventScr_Ch2Tutorial18_ref") static const u32 EventScr_Ch2Tutorial18__shift[] = {
    0x00070228,
    0x00052621,
    0x000D0540,
    0x00000000,
    0x00010540,
    0x00000005,
    0x00000721,
    0x00010540,
    0x00030007,
    0x00000721,
    0x00010540,
    0x00000939,
    0x00000721,
    0x00010540,
    0x00580020,
    0x00000721,
    0x00010540,
    0x00000938,
    0x00000721,
    0x00010540,
    0x00580020,
    0x00000721,
    0x00010540,
    (u32)&data_08A63088,
    0x00000721,
    0x00010540,
    (u32)&EventScr_Ch2Tutorial18,
    0x00000721,
    0x00000A40,
    (u32)&EventScr_Tutorial_Exec0,
    0x03FE1120,
    0x00000120,
};
__asm__(".global EventScr_Ch2Tutorial18\n\t.set EventScr_Ch2Tutorial18, EventScr_Ch2Tutorial18__shift\n");
