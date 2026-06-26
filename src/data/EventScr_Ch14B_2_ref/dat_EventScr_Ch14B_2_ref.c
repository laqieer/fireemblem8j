#include "global.h"

/* De-pointered from data/residual/EventScr_Ch14B_2.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 data_08A60BE4[];

SECTION(".rodata.dat_EventScr_Ch14B_2_ref") static const u32 EventScr_Ch14B_2__shift[] = {
    0x00020540,
    0x0000000A,
    0x00030540,
    0x0000001C,
    0x00040540,
    0x000026FC,
    0x000D0540,
    0x00000000,
    0x00010540,
    0x00000AD2,
    0x00000721,
    0x00010540,
    0x00000AD3,
    0x00000721,
    0x00010540,
    0x00000AD5,
    0x00000721,
    0x00010540,
    0x00000AD6,
    0x00000721,
    0x00010540,
    0x00000AD7,
    0x00000721,
    0x00010540,
    0x00000AD4,
    0x00000721,
    0x00000A40,
    (u32)&data_08A60BE4,
    0x00000120,
};
__asm__(".global EventScr_Ch14B_2\n\t.set EventScr_Ch14B_2, EventScr_Ch14B_2__shift\n");
