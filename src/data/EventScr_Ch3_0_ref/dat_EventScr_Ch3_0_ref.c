#include "global.h"

/* De-pointered from data/residual/EventScr_Ch3_0.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_FormatFlashingCursor[];

SECTION(".rodata.dat_EventScr_Ch3_0_ref") static const u32 EventScr_Ch3_0__shift[] = {
    0x07072628,
    0x000F0E20,
    0x000D0540,
    0x00000000,
    0x00010540,
    0x00030002,
    0x00000721,
    0x00010540,
    0x000A0006,
    0x00000721,
    0x00010540,
    0x0005000A,
    0x00000721,
    0x00000A40,
    (u32)&EventScr_FormatFlashingCursor,
    0x003C0E20,
    0x00003B22,
    0x00001A20,
    0x094D1B20,
    0x00001D20,
    0x00001B22,
    0x0A072628,
    0x000F0E20,
    0x000D0540,
    0x00000000,
    0x00010540,
    0x00090004,
    0x00000721,
    0x00010540,
    0x000C0004,
    0x00000721,
    0x00010540,
    0x00080008,
    0x00000721,
    0x00000A40,
    (u32)&EventScr_FormatFlashingCursor,
    0x003C0E20,
    0x00003B22,
    0x00001A23,
    0x000B0540,
    0xFFFFFFFF,
    0x095B1B20,
    0x00001D20,
    0x00001B22,
    0x00D30229,
    0x00000120,
};
__asm__(".global EventScr_Ch3_0\n\t.set EventScr_Ch3_0, EventScr_Ch3_0__shift\n");
