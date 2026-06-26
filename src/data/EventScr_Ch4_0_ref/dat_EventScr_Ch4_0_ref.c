#include "global.h"

/* De-pointered from data/residual/EventScr_Ch4_0.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 UnitDef_Ch4NPC_0[];

SECTION(".rodata.dat_EventScr_Ch4_0_ref") static const u32 EventScr_Ch4_0__shift[] = {
    0x00072628,
    0x000F0E20,
    0x00012C40,
    (u32)&UnitDef_Ch4NPC_0,
    0x00003020,
    0x002A1220,
    0x00193B21,
    0x003C0E20,
    0x00003B22,
    0x00001A20,
    0x096C1B20,
    0x00001D20,
    0x00001B22,
    0x00182F40,
    0x020F0019,
    0x00182F40,
    0x010F001A,
    0x00182F40,
    0x010F001C,
    0x00003020,
    0x0000342B,
    0x00070228,
    0x00000120,
};
__asm__(".global EventScr_Ch4_0\n\t.set EventScr_Ch4_0, EventScr_Ch4_0__shift\n");
