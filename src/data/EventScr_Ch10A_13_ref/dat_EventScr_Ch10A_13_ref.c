#include "global.h"

/* De-pointered from data/residual/EventScr_Ch10A_13.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_ChangeAIinQueue[];
extern const u8 UnitDef_Ch14BAlly_7[];

SECTION(".rodata.dat_EventScr_Ch10A_13_ref") static const u32 EventScr_Ch10A_13__shift[] = {
    0x00020540,
    0x00000000,
    0x00000A40,
    (u32)&UnitDef_Ch14BAlly_7,
    0x000E0221,
    0x000D0540,
    0x00000000,
    0x00010540,
    0x001D000D,
    0x00000721,
    0x00010540,
    0x001C000E,
    0x00000721,
    0x00010540,
    0x001D000F,
    0x00000721,
    0x00010540,
    0x001C0010,
    0x00000721,
    0x00010540,
    0x001D0011,
    0x00000721,
    0x00010540,
    0x001E000E,
    0x00000721,
    0x00010540,
    0x001E0010,
    0x00000721,
    0x00010540,
    0x001E0012,
    0x00000721,
    0x00020540,
    0x00010000,
    0x00000A40,
    (u32)&EventScr_ChangeAIinQueue,
    0x00070228,
    0x00000120,
};
__asm__(".global EventScr_Ch10A_13\n\t.set EventScr_Ch10A_13, EventScr_Ch10A_13__shift\n");
