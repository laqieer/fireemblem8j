#include "global.h"

/* De-pointered from data/residual/EventScr_Ch1Tut_ChooseSethTurn1.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch1Tut_SethMoveToEnemy[];

SECTION(".rodata.dat_EventScr_Ch1Tut_ChooseSethTurn1_ref") static const u32 EventScr_Ch1Tut_ChooseSethTurn1__shift[] = {
    0x00001A23,
    0x000B0540,
    0xFFFFFFFF,
    0x090E1B20,
    0x00001D20,
    0x00001B22,
    0x00023B25,
    0x003C0E20,
    0x00003B22,
    0x000D0540,
    0x00000000,
    0x00010540,
    0x00000000,
    0x00000721,
    0x00010540,
    0x00000001,
    0x00000721,
    0x00010540,
    0x00010000,
    0x00000721,
    0x00010540,
    0xFFFFFFFF,
    0x00000721,
    0x00003F42,
    0x00000000,
    0x00020B41,
    (u32)&EventScr_Ch1Tut_SethMoveToEnemy,
    0x60003D20,
    0x00000120,
};
__asm__(".global EventScr_Ch1Tut_ChooseSethTurn1\n\t.set EventScr_Ch1Tut_ChooseSethTurn1, EventScr_Ch1Tut_ChooseSethTurn1__shift\n");
