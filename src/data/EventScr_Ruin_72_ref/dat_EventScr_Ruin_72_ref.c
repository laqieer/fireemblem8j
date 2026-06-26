#include "global.h"

/* De-pointered from data/residual/EventScr_Ruin_72.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_9EE84C[];
extern const u8 EventScr_ConfigHardModeLoadUnitHard[];

SECTION(".rodata.dat_EventScr_Ruin_72_ref") static const u32 EventScr_Ruin_72__shift[] = {
    0x00020540,
    0x00000000,
    0x00000A40,
    (u32)&EventScr_ConfigHardModeLoadUnitHard,
    0x000D0540,
    0x00000000,
    0x00010540,
    0x00000032,
    0x00000721,
    0x00010540,
    0x00000019,
    0x00000721,
    0x00010540,
    0x0000000F,
    0x00000721,
    0x00010540,
    0x00000005,
    0x00000721,
    0x00010540,
    0x00000005,
    0x00000721,
    0x00000A40,
    (u32)&EventScr_9EE84C,
    0x00010540,
    0x00000000,
    0x00000721,
    0x00010540,
    0x00000001,
    0x00000721,
    0x00010540,
    0x00000002,
    0x00000721,
    0x00010540,
    0x00000003,
    0x00000721,
    0x00010540,
    0x00000006,
    0x00000721,
    0x00010540,
    0x00000007,
    0x00000721,
    0x00000120,
};
__asm__(".global EventScr_Ruin_72\n\t.set EventScr_Ruin_72, EventScr_Ruin_72__shift\n");
