#include "global.h"

/* De-pointered from data/residual/EventScr_Prologue_Tutorial1.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Prologue_Tutorial1[];
extern const u8 EventScr_Tutorial_Exec1[];
extern const u8 data_08A614C0[];

SECTION(".rodata.dat_EventScr_Prologue_Tutorial1_ref") static const u32 EventScr_Prologue_Tutorial1__shift[] = {
    0x00070228,
    0x00001120,
    0x000D0540,
    0x00000000,
    0x00010540,
    0x00050004,
    0x00000721,
    0x00010540,
    0x000008DC,
    0x00000721,
    0x00010540,
    0x00080058,
    0x00000721,
    0x00010540,
    (u32)&data_08A614C0,
    0x00000721,
    0x00010540,
    (u32)&EventScr_Prologue_Tutorial1,
    0x00000721,
    0x00000A40,
    (u32)&EventScr_Tutorial_Exec1,
    0xFFFB3D20,
    0x010A1120,
    0x00000120,
};
__asm__(".global EventScr_Prologue_Tutorial1\n\t.set EventScr_Prologue_Tutorial1, EventScr_Prologue_Tutorial1__shift\n");
