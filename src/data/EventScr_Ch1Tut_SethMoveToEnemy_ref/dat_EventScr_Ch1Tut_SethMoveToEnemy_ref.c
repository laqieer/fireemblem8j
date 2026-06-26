#include "global.h"

/* De-pointered from data/residual/EventScr_Ch1Tut_SethMoveToEnemy.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch1Tut_BeforeSethMoveToEnemy[];
extern const u8 EventScr_Ch1Tut_SethMoveToEnemy[];
extern const u8 EventScr_Tutorial_Exec0[];

SECTION(".rodata.dat_EventScr_Ch1Tut_SethMoveToEnemy_ref") static const u32 EventScr_Ch1Tut_SethMoveToEnemy__shift[] = {
    0x00070228,
    0x000D0540,
    0x00000000,
    0x00010540,
    0x00000002,
    0x00000721,
    0x00010540,
    0x00060009,
    0x00000721,
    0x00010540,
    0x00000910,
    0x00000721,
    0x00010540,
    0x00080008,
    0x00000721,
    0x00010540,
    0x0000090F,
    0x00000721,
    0x00010540,
    0x00080008,
    0x00000721,
    0x00010540,
    (u32)&EventScr_Ch1Tut_BeforeSethMoveToEnemy,
    0x00000721,
    0x00010540,
    (u32)&EventScr_Ch1Tut_SethMoveToEnemy,
    0x00000721,
    0x00000A40,
    (u32)&EventScr_Tutorial_Exec0,
    0x00000120,
};
__asm__(".global EventScr_Ch1Tut_SethMoveToEnemy\n\t.set EventScr_Ch1Tut_SethMoveToEnemy, EventScr_Ch1Tut_SethMoveToEnemy__shift\n");
