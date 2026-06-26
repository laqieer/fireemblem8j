#include "global.h"

/* De-pointered from data/residual/EventScr_Ch14A_8.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_ChangeAIinQueue[];
extern const u8 UnitDef_Ch14BAlly_7[];

SECTION(".rodata.dat_EventScr_Ch14A_8_ref") static const u32 EventScr_Ch14A_8__shift[] = {
    0x00020540,
    0x00000000,
    0x00000A40,
    (u32)&UnitDef_Ch14BAlly_7,
    0x000D0540,
    0x00000000,
    0x00010540,
    0x00070008,
    0x00000721,
    0x00010540,
    0x00070009,
    0x00000721,
    0x00010540,
    0x0007000A,
    0x00000721,
    0x00020540,
    0x00010000,
    0x00000A40,
    (u32)&EventScr_ChangeAIinQueue,
    0x00070228,
    0x00000120,
};
__asm__(".global EventScr_Ch14A_8\n\t.set EventScr_Ch14A_8, EventScr_Ch14A_8__shift\n");
