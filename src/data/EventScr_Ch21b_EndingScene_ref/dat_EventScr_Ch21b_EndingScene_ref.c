#include "global.h"

/* De-pointered from data/residual/EventScr_Ch21b_EndingScene.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch21A_9[];
extern const u8 UnitDef_Ch21BMixed[];

SECTION(".rodata.dat_EventScr_Ch21b_EndingScene_ref") static const u32 EventScr_Ch21b_EndingScene__shift[] = {
    0x7FFF1326,
    0x00041721,
    0x0000342A,
    0x0000342C,
    0x0000342B,
    0x040B2628,
    0x00002B22,
    0x00012C41,
    (u32)&UnitDef_Ch21BMixed,
    0x00003020,
    0x00041720,
    0x00012C41,
    (u32)&UnitDef_Ch21BMixed,
    0x00003020,
    0x00403B21,
    0x003C0E20,
    0x00003B22,
    0x00001A20,
    0x0B861B20,
    0x00001D20,
    0x00441326,
    0x00001C20,
    0x00001D20,
    0x00001B22,
    0x7FFF1324,
    0x00000A40,
    (u32)&EventScr_Ch21A_9,
    0x00232A23,
    0x00000120,
};
__asm__(".global EventScr_Ch21b_EndingScene\n\t.set EventScr_Ch21b_EndingScene, EventScr_Ch21b_EndingScene__shift\n");
