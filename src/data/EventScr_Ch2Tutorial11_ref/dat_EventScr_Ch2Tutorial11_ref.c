#include "global.h"

/* De-pointered from data/residual/EventScr_Ch2Tutorial11.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch2Tutorial11[];
extern const u8 EventScr_Ch2Tutorial12[];
extern const u8 EventScr_Tutorial_Exec0[];

SECTION(".rodata.dat_EventScr_Ch2Tutorial11_ref") static const u32 EventScr_Ch2Tutorial11__shift[] = {
    0x00070228,
    0x000D0540,
    0x00000000,
    0x00010540,
    0x00000006,
    0x00000721,
    0x00010540,
    0x00040008,
    0x00000721,
    0x00010540,
    0x00000936,
    0x00000721,
    0x00010540,
    0x00580020,
    0x00000721,
    0x00010540,
    0x00000934,
    0x00000721,
    0x00010540,
    0x00580020,
    0x00000721,
    0x00010540,
    (u32)&EventScr_Ch2Tutorial12,
    0x00000721,
    0x00010540,
    (u32)&EventScr_Ch2Tutorial11,
    0x00000721,
    0x00000A40,
    (u32)&EventScr_Tutorial_Exec0,
    0x03FE1120,
    0x00000120,
};
__asm__(".global EventScr_Ch2Tutorial11\n\t.set EventScr_Ch2Tutorial11, EventScr_Ch2Tutorial11__shift\n");
