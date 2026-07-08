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
extern const u8 EventScr_Prologue_Tutorial2[];
extern const u8 EventScr_Prologue_Tutorial3[];
extern const u8 EventScr_Prologue_Tutorial5[];
extern const u8 EventScr_Prologue_Tutorial6[];
extern const u8 EventScr_Prologue_Tutorial7[];
extern const u8 EventScr_Prologue_Tutorial8[];
extern const u8 EventScr_Prologue_Tutorial9[];
extern const u8 EventScr_Prologue_TutorialC[];
extern const u8 EventScr_Prologue_TutorialD[];
extern const u8 EventScr_Prologue_TutorialE[];

SECTION(".rodata.dat_EventListScr_Prologue_Tutorial_ref") static const u32 EventListScr_Prologue_Tutorial__shift[] = {
    (u32)&EventScr_Prologue_Tutorial0,
    (u32)&EventScr_Prologue_Tutorial1,
    (u32)&EventScr_Prologue_Tutorial2,
    (u32)&EventScr_Prologue_Tutorial3,
    (u32)&EventScr_Prologue_Tutorial4,
    (u32)&EventScr_Prologue_Tutorial5,
    (u32)&EventScr_Prologue_Tutorial6,
    (u32)&EventScr_Prologue_Tutorial7,
    (u32)&EventScr_Prologue_Tutorial8,
    (u32)&EventScr_Prologue_Tutorial9,
    (u32)&EventScr_Prologue_TutorialA,
    (u32)&EventScr_Prologue_TutorialB,
    (u32)&EventScr_Prologue_TutorialC,
    (u32)&EventScr_Prologue_TutorialD,
    (u32)&EventScr_Prologue_TutorialE,
    0x00000000,
};
extern const u32 EventListScr_Prologue_Tutorial __attribute__((alias("EventListScr_Prologue_Tutorial__shift")));
