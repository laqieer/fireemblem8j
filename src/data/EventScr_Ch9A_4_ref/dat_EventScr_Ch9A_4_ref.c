#include "global.h"

/* De-pointered from data/residual/EventScr_Ch9A_4.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch9a_EndingScene[];

SECTION(".rodata.dat_EventScr_Ch9A_4_ref") static const u32 EventScr_Ch9A_4__shift[] = {
    0x00123322,
    0x00000C40,
    0x0000000C,
    0x00123325,
    0x00010540,
    0x00000000,
    0x00000C40,
    0x0001000C,
    0x00122621,
    0x00123B21,
    0x003C0E20,
    0x00003B22,
    0x00141420,
    0x00210E20,
    0x00001A20,
    0x09E01B20,
    0x00001D20,
    0x00001B22,
    0x00182F40,
    0x17020012,
    0x00182F40,
    0x17020083,
    0x00182F40,
    0x17020084,
    0x00182F40,
    0x17020085,
    0x00003020,
    0x0012342F,
    0x0083342F,
    0x0084342F,
    0x0085342F,
    0x00001924,
    0x00000C41,
    0x0000000C,
    0x00000A40,
    (u32)&EventScr_Ch9a_EndingScene,
    0x00000121,
};
__asm__(".global EventScr_Ch9A_4\n\t.set EventScr_Ch9A_4, EventScr_Ch9A_4__shift\n");
