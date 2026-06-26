#include "global.h"

/* De-pointered from data/residual/UnitDef_Event_PrologueValterGroup.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 REDA_PrologueValterGroup0[];
extern const u8 REDA_PrologueValterGroup2[];
extern const u8 REDA_PrologueValterGroup3[];

SECTION(".rodata.dat_UnitDef_Event_PrologueValterGroup_ref") static const u32 UnitDef_Event_PrologueValterGroup__shift[] = {
    0x2C002345,
    0x0200014E,
    (u32)&REDA_PrologueValterGroup0,
    0x00000017,
    0x00000000,
    0x0D001F80,
    0x0100010E,
    (u32)&REDA_PrologueValterGroup2,
    0x00000000,
    0x00000000,
    0x0D001F80,
    0x0100018E,
    (u32)&REDA_PrologueValterGroup3,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
__asm__(".global UnitDef_Event_PrologueValterGroup\n\t.set UnitDef_Event_PrologueValterGroup, UnitDef_Event_PrologueValterGroup__shift\n");
