#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness: data_085BA36C (earthquake / stone-shatter
 * event fx).
 *
 * Two opaque proc scripts inside the `.data.residue.085BA36C` blob are decoded
 * (pointers resolved against the JP ELF) into typed `struct ProcCmd NAME[]` in
 * their OWN 4-aligned `.rodata.dat_NAME_ref` sections at their exact JP
 * addresses:
 *   - ProcScr_EventEarthQuake   (3 ProcCmd) @0x085BA36C
 *   - gProcScr_StoneShatterEvent(4 ProcCmd) @0x085BA384
 * Their redundant baseline `.set NAME,0xADDR` aliases are dropped so the typed
 * symbols win. The 204-byte tail [0x085BA3A4,0x085BA470) is the StoneShatter
 * gfx descriptor (pal/img/tsa OBJECT pointers, no Thumb bit) kept byte-identical
 * as raw `.4byte` residue. The external alias data_085BA36C (Proc_Find/Start'd by
 * sub_8012CEC.c) is preserved byte-neutrally onto ProcScr_EventEarthQuake. FUNC
 * targets are bare (ld ORs the Thumb bit). The ONLY correctness oracle is
 * `make compare` (sha1).
 */

extern void EventEarthQuakeMain();
extern void StoneShatterEvent_OnEnd();
extern void CheckBmBgfxDone();

struct ProcCmd ProcScr_EventEarthQuake[] __attribute__((section(".rodata.dat_ProcScr_EventEarthQuake_ref"))) = {
    PROC_YIELD,
    PROC_REPEAT(EventEarthQuakeMain),
    PROC_END,
};

struct ProcCmd gProcScr_StoneShatterEvent[] __attribute__((section(".rodata.dat_gProcScr_StoneShatterEvent_ref"))) = {
    PROC_YIELD,
    PROC_SET_END_CB(StoneShatterEvent_OnEnd),
    PROC_WHILE(CheckBmBgfxDone),
    PROC_END,
};

/* Byte-neutral external alias: data_085BA36C == ProcScr_EventEarthQuake. */
extern const u32 data_085BA36C __attribute__((alias("ProcScr_EventEarthQuake")));

/* Tail [0x085BA3A4,0x085BA470) (204 B): StoneShatter gfx descriptor (pal/img/tsa
 * OBJECT pointers), byte-identical raw residue. */
u32 data_085BA3A4[] __attribute__((section(".data.residue.085BA3A4"))) = {
    0x00000003,
    (u32)&gPal_StoneShatterAnim,
    0x00000001,
    0x00000001,
    (u32)&gImg_StoneShatterAnim,
    0x00011000,
    0x00000002,
    (u32)&gTsa_StoneShatter_0,
    0x00010000,
    0x00000002,
    (u32)&gTsa_StoneShatter_1,
    0x00010000,
    0x00000002,
    (u32)&gTsa_StoneShatter_2,
    0x00010000,
    0x00000002,
    (u32)&gTsa_StoneShatter_3,
    0x00020000,
    0x00000002,
    (u32)&gTsa_StoneShatter_4,
    0x00030000,
    0x00000002,
    (u32)&gTsa_StoneShatter_5,
    0x00030000,
    0x00000002,
    (u32)&gTsa_StoneShatter_6,
    0x00040000,
    0x00000002,
    (u32)&gTsa_StoneShatter_7,
    0x00040000,
    0x00000002,
    (u32)&gTsa_StoneShatter_8,
    0x00040000,
    0x00000002,
    (u32)&gTsa_StoneShatter_9,
    0x00040000,
    0x00000002,
    (u32)&gTsa_StoneShatter_10,
    0x00040000,
    0x00000002,
    (u32)&gTsa_StoneShatter_11,
    0x00040000,
    0x00000002,
    (u32)&gTsa_StoneShatter_12,
    0x00020000,
    0x00000002,
    (u32)&gTsa_StoneShatter_13,
    0x00020000,
    0x0000000A,
    0x00000000,
    0x00000000,
};
