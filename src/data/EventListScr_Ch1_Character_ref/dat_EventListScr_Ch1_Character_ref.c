#include "global.h"

/* De-pointered from data/residual/EventListScr_Ch1_Character.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch1_Talk_EirikaFranz[];
extern const u8 EventScr_Ch1_Talk_SethFranz[];

SECTION(".rodata.dat_EventListScr_Ch1_Character_ref") static const u32 EventListScr_Ch1_Character__shift[] = {
    0x00080003,
    (u32)&EventScr_Ch1_Talk_SethFranz,
    0x00000402,
    0x00000000,
    0x00080003,
    (u32)&EventScr_Ch1_Talk_SethFranz,
    0x00000204,
    0x00000000,
    0x00090003,
    (u32)&EventScr_Ch1_Talk_EirikaFranz,
    0x00000401,
    0x00000000,
    0x00090003,
    (u32)&EventScr_Ch1_Talk_EirikaFranz,
    0x00000104,
    0x00000000,
    0x00000000,
};
__asm__(".global EventListScr_Ch1_Character\n\t.set EventListScr_Ch1_Character, EventListScr_Ch1_Character__shift\n");
