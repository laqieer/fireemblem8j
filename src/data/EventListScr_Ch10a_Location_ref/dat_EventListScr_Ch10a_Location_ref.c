#include "global.h"

/* De-pointered from data/residual/EventListScr_Ch10a_Location.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch10A_10[];
extern const u8 EventScr_Ch10A_11[];
extern const u8 EventScr_Ch10A_9[];

SECTION(".rodata.dat_EventListScr_Ch10a_Location_ref") static const u32 EventListScr_Ch10a_Location__shift[] = {
    0x00000008,
    0x00000001,
    0x0012090A,
    0x00000008,
    0x00000001,
    0x0012090B,
    0x00030005,
    0x00000001,
    0x0011010F,
    0x00000005,
    (u32)&EventScr_Ch10A_9,
    0x0010060B,
    0x00000005,
    (u32)&EventScr_Ch10A_10,
    0x0010070A,
    0x00000005,
    (u32)&EventScr_Ch10A_11,
    0x0010080D,
    0x00000000,
};
__asm__(".global EventListScr_Ch10a_Location\n\t.set EventListScr_Ch10a_Location, EventListScr_Ch10a_Location__shift\n");
