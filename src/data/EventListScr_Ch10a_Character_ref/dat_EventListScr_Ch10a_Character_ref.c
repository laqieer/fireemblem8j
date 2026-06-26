#include "global.h"

/* De-pointered from data/residual/EventListScr_Ch10a_Character.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch10A_1[];
extern const u8 EventScr_Ch10A_2[];
extern const u8 EventScr_Ch10A_3[];
extern const u8 EventScr_Ch10A_4[];
extern const u8 EventScr_Ch10A_5[];
extern const u8 EventScr_Ch10A_6[];
extern const u8 EventScr_Ch10A_7[];

SECTION(".rodata.dat_EventListScr_Ch10a_Character_ref") static const u32 EventListScr_Ch10a_Character__shift[] = {
    0x00080003,
    (u32)&EventScr_Ch10A_1,
    0x00000B01,
    0x00000000,
    0x00080003,
    (u32)&EventScr_Ch10A_2,
    0x00000B22,
    0x00000000,
    0x00090003,
    (u32)&EventScr_Ch10A_3,
    0x0000140B,
    0x00000000,
    0x00090003,
    (u32)&EventScr_Ch10A_4,
    0x00001415,
    0x00000000,
    0x000A0003,
    (u32)&EventScr_Ch10A_5,
    0x0000150B,
    0x00000000,
    0x000A0003,
    (u32)&EventScr_Ch10A_6,
    0x00001514,
    0x00000000,
    0x000B0003,
    (u32)&EventScr_Ch10A_7,
    0x00001614,
    0x00000000,
    0x00000000,
};
__asm__(".global EventListScr_Ch10a_Character\n\t.set EventListScr_Ch10a_Character, EventListScr_Ch10a_Character__shift\n");
