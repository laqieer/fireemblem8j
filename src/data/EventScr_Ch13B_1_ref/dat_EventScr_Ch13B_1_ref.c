#include "global.h"

/* De-pointered from data/residual/EventScr_Ch13B_1.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_UnTriggerIfNotUnit[];
extern const u8 UnitDef_Ch14BAlly_7[];

SECTION(".rodata.dat_EventScr_Ch13B_1_ref") static const u32 EventScr_Ch13B_1__shift[] = {
    0x00020321,
    0x00000C41,
    0x0000000C,
    0x00020540,
    0x00000000,
    0x00000A40,
    (u32)&UnitDef_Ch14BAlly_7,
    0x00020540,
    0x0000001D,
    0x00000A40,
    (u32)&EventScr_UnTriggerIfNotUnit,
    0x00001520,
    0x00001A20,
    0x0AB51B20,
    0x00001D20,
    0x00001B22,
    0x00001521,
    0x00000820,
    0x00070228,
    0x00000120,
};
__asm__(".global EventScr_Ch13B_1\n\t.set EventScr_Ch13B_1, EventScr_Ch13B_1__shift\n");
