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
__asm__(
"\t.global data_085BA36C\n"
"\t.set data_085BA36C, ProcScr_EventEarthQuake\n"
);

/* Tail [0x085BA3A4,0x085BA470) (204 B): StoneShatter gfx descriptor (pal/img/tsa
 * OBJECT pointers), byte-identical raw residue. */
__asm__(
"\t.section .data.residue.085BA3A4, \"aw\", %progbits\n"
"data_085BA3A4:\n"
"\t.4byte 0x00000003\n"
"\t.4byte gPal_StoneShatterAnim\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00000001\n"
"\t.4byte gImg_StoneShatterAnim\n"
"\t.4byte 0x00011000\n"
"\t.4byte 0x00000002\n"
"\t.4byte gTsa_StoneShatter_0\n"
"\t.4byte 0x00010000\n"
"\t.4byte 0x00000002\n"
"\t.4byte gTsa_StoneShatter_1\n"
"\t.4byte 0x00010000\n"
"\t.4byte 0x00000002\n"
"\t.4byte gTsa_StoneShatter_2\n"
"\t.4byte 0x00010000\n"
"\t.4byte 0x00000002\n"
"\t.4byte gTsa_StoneShatter_3\n"
"\t.4byte 0x00020000\n"
"\t.4byte 0x00000002\n"
"\t.4byte gTsa_StoneShatter_4\n"
"\t.4byte 0x00030000\n"
"\t.4byte 0x00000002\n"
"\t.4byte gTsa_StoneShatter_5\n"
"\t.4byte 0x00030000\n"
"\t.4byte 0x00000002\n"
"\t.4byte gTsa_StoneShatter_6\n"
"\t.4byte 0x00040000\n"
"\t.4byte 0x00000002\n"
"\t.4byte gTsa_StoneShatter_7\n"
"\t.4byte 0x00040000\n"
"\t.4byte 0x00000002\n"
"\t.4byte gTsa_StoneShatter_8\n"
"\t.4byte 0x00040000\n"
"\t.4byte 0x00000002\n"
"\t.4byte gTsa_StoneShatter_9\n"
"\t.4byte 0x00040000\n"
"\t.4byte 0x00000002\n"
"\t.4byte gTsa_StoneShatter_10\n"
"\t.4byte 0x00040000\n"
"\t.4byte 0x00000002\n"
"\t.4byte gTsa_StoneShatter_11\n"
"\t.4byte 0x00040000\n"
"\t.4byte 0x00000002\n"
"\t.4byte gTsa_StoneShatter_12\n"
"\t.4byte 0x00020000\n"
"\t.4byte 0x00000002\n"
"\t.4byte gTsa_StoneShatter_13\n"
"\t.4byte 0x00020000\n"
"\t.4byte 0x0000000A\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
