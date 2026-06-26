#include "global.h"

/* De-pointered from data/residual/EventScr_Ch2Tutorial24.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch2Tutorial24[];
extern const u8 EventScr_Ch2Tutorial25[];
extern const u8 EventScr_Tutorial_Exec1[];

SECTION(".rodata.dat_EventScr_Ch2Tutorial24_ref") static const u32 EventScr_Ch2Tutorial24__shift[] = {
    0x00070228,
    0x00001120,
    0x000D0540,
    0x00000000,
    0x00010540,
    0x00020004,
    0x00000721,
    0x00010540,
    0x00000000,
    0x00000721,
    0x00010540,
    0x00000000,
    0x00000721,
    0x00010540,
    (u32)&EventScr_Ch2Tutorial25,
    0x00000721,
    0x00010540,
    (u32)&EventScr_Ch2Tutorial24,
    0x00000721,
    0x00000A40,
    (u32)&EventScr_Tutorial_Exec1,
    0xFFDF3D20,
    0x010A1120,
    0x00000120,
};
__asm__(".global EventScr_Ch2Tutorial24\n\t.set EventScr_Ch2Tutorial24, EventScr_Ch2Tutorial24__shift\n");
