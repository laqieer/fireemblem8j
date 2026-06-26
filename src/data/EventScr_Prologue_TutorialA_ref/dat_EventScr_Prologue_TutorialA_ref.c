#include "global.h"

/* De-pointered from data/residual/EventScr_Prologue_TutorialA.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Prologue_TutorialA[];
extern const u8 EventScr_Prologue_TutorialB[];
extern const u8 EventScr_Tutorial_Exec0[];

SECTION(".rodata.dat_EventScr_Prologue_TutorialA_ref") static const u32 EventScr_Prologue_TutorialA__shift[] = {
    0x00070228,
    0x000D0540,
    0x00000000,
    0x00010540,
    0x00000001,
    0x00000721,
    0x00010540,
    0x00060008,
    0x00000721,
    0x00010540,
    0x000008E5,
    0x00000721,
    0x00010540,
    0x00080058,
    0x00000721,
    0x00010540,
    0x000008E4,
    0x00000721,
    0x00010540,
    0x00080058,
    0x00000721,
    0x00010540,
    (u32)&EventScr_Prologue_TutorialB,
    0x00000721,
    0x00010540,
    (u32)&EventScr_Prologue_TutorialA,
    0x00000721,
    0x00000A40,
    (u32)&EventScr_Tutorial_Exec0,
    0x00000120,
};
__asm__(".global EventScr_Prologue_TutorialA\n\t.set EventScr_Prologue_TutorialA, EventScr_Prologue_TutorialA__shift\n");
