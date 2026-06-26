#include "global.h"

/* De-pointered from data/residual/EventListScr_Ch2_Tutorial.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 EventScr_Ch2Tutorial10[];
extern const u8 EventScr_Ch2Tutorial11[];
extern const u8 EventScr_Ch2Tutorial12[];
extern const u8 EventScr_Ch2Tutorial13[];
extern const u8 EventScr_Ch2Tutorial14[];
extern const u8 EventScr_Ch2Tutorial15[];
extern const u8 EventScr_Ch2Tutorial16[];
extern const u8 EventScr_Ch2Tutorial17[];
extern const u8 EventScr_Ch2Tutorial18[];
extern const u8 EventScr_Ch2Tutorial2[];
extern const u8 EventScr_Ch2Tutorial21[];
extern const u8 EventScr_Ch2Tutorial22[];
extern const u8 EventScr_Ch2Tutorial23[];
extern const u8 EventScr_Ch2Tutorial24[];
extern const u8 EventScr_Ch2Tutorial25[];
extern const u8 EventScr_Ch2Tutorial26[];
extern const u8 EventScr_Ch2Tutorial27[];
extern const u8 EventScr_Ch2Tutorial28[];
extern const u8 EventScr_Ch2Tutorial29[];
extern const u8 EventScr_Ch2Tutorial3[];
extern const u8 EventScr_Ch2Tutorial30[];
extern const u8 EventScr_Ch2Tutorial4[];
extern const u8 EventScr_Ch2Tutorial5[];
extern const u8 EventScr_Ch2Tutorial6[];
extern const u8 EventScr_Ch2Tutorial7[];
extern const u8 EventScr_Ch2Tutorial8[];
extern const u8 EventScr_Ch2Tutorial9[];
extern const u8 data_08A62808[];
extern const u8 data_08A63088[];

SECTION(".rodata.dat_EventListScr_Ch2_Tutorial_ref") static const u32 EventListScr_Ch2_Tutorial__shift[] = {
    (u32)&data_08A62808 + 0x134,
    (u32)&EventScr_Ch2Tutorial2,
    (u32)&EventScr_Ch2Tutorial3,
    (u32)&EventScr_Ch2Tutorial4,
    (u32)&EventScr_Ch2Tutorial5,
    (u32)&EventScr_Ch2Tutorial6,
    (u32)&EventScr_Ch2Tutorial7,
    (u32)&EventScr_Ch2Tutorial8,
    (u32)&EventScr_Ch2Tutorial9,
    (u32)&EventScr_Ch2Tutorial10,
    (u32)&EventScr_Ch2Tutorial11,
    (u32)&EventScr_Ch2Tutorial12,
    (u32)&EventScr_Ch2Tutorial13,
    (u32)&EventScr_Ch2Tutorial14,
    (u32)&EventScr_Ch2Tutorial15,
    (u32)&EventScr_Ch2Tutorial16,
    (u32)&EventScr_Ch2Tutorial17,
    (u32)&EventScr_Ch2Tutorial18,
    (u32)&data_08A63088,
    (u32)&data_08A63088 + 0x20,
    (u32)&EventScr_Ch2Tutorial21,
    (u32)&EventScr_Ch2Tutorial22,
    (u32)&EventScr_Ch2Tutorial23,
    (u32)&EventScr_Ch2Tutorial24,
    (u32)&EventScr_Ch2Tutorial25,
    (u32)&EventScr_Ch2Tutorial26,
    (u32)&EventScr_Ch2Tutorial27,
    (u32)&EventScr_Ch2Tutorial28,
    (u32)&EventScr_Ch2Tutorial29,
    (u32)&EventScr_Ch2Tutorial30,
    0x00000000,
};
__asm__(".global EventListScr_Ch2_Tutorial\n\t.set EventListScr_Ch2_Tutorial, EventListScr_Ch2_Tutorial__shift\n");
