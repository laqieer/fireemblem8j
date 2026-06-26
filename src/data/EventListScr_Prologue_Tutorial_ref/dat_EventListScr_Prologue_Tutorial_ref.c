#include "global.h"

/* De-pointered from data/residual/EventListScr_Prologue_Tutorial.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Prologue_Tutorial0[];
extern const u8 EventScr_Prologue_Tutorial1[];
extern const u8 EventScr_Prologue_Tutorial4[];
extern const u8 EventScr_Prologue_TutorialA[];
extern const u8 EventScr_Prologue_TutorialB[];
extern const u8 data_08A614C0[];
extern const u8 data_08A61624[];
extern const u8 data_08A618F0[];

SECTION(".rodata.dat_EventListScr_Prologue_Tutorial_ref") static const u32 EventListScr_Prologue_Tutorial__shift[] = {
    (u32)&EventScr_Prologue_Tutorial0,
    (u32)&EventScr_Prologue_Tutorial1,
    (u32)&data_08A614C0,
    (u32)&data_08A614C0 + 0x10,
    (u32)&EventScr_Prologue_Tutorial4,
    (u32)&data_08A61624,
    (u32)&data_08A61624 + 0x20,
    (u32)&data_08A61624 + 0x50,
    (u32)&data_08A61624 + 0x80,
    (u32)&data_08A61624 + 0xBC,
    (u32)&EventScr_Prologue_TutorialA,
    (u32)&EventScr_Prologue_TutorialB,
    (u32)&data_08A618F0,
    (u32)&data_08A618F0 + 0x10,
    (u32)&data_08A618F0 + 0x44,
    0x00000000,
};
__asm__(".global EventListScr_Prologue_Tutorial\n\t.set EventListScr_Prologue_Tutorial, EventListScr_Prologue_Tutorial__shift\n");
