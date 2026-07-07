#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness: data_08A9DAB4 (sysutil UI proc scripts).
 *
 * Three opaque proc scripts inside the `.data.residue.08A9DAB4` blob are decoded
 * (structure ported from fe8u src/sysutil.c, pointers resolved against the JP
 * ELF) into typed `struct ProcCmd NAME[]` in their OWN 4-aligned
 * `.rodata.dat_NAME_ref` sections, placed at their exact JP addresses by the
 * carved_rom fragment:
 *   - ProcScr_ParallelFiniteLoop (4 ProcCmd) @0x08A9DB1C
 *   - ProcScr_SysBlackBox        (6 ProcCmd) @0x08A9DB3C
 *   - ProcScr_SysHandCtrl        (6 ProcCmd) @0x08A9DB84
 * Their redundant baseline `.set NAME,0xADDR` aliases (referenced by sysutil
 * consumers) are dropped so the real typed symbols win.
 *
 * The surrounding scripts are NOT in the #148 opaque worklist and stay as
 * byte-identical *relocated* `.4byte` slices (leaving them INCBIN would turn
 * their ROM func pointers into un-relocated hardcoded pointers = shiftcheck
 * HIGH): a 104-byte lead (UiCursorHand + UiSpinningArrows scripts + sprite
 * data), a 24-byte gap (un-named ParallelWorker script) and a 24-byte trail
 * (un-named SysGrayBox script). The external alias data_08A9DB84 (Proc_Find'd by
 * sub_80B2034.c) is preserved byte-neutrally as `.set data_08A9DB84,
 * ProcScr_SysHandCtrl`. FUNC targets in typed tables are bare (ld ORs the Thumb
 * bit). REGION_SAME; the ONLY correctness oracle is `make compare` (sha1).
 */

extern void sub_80B1890();
extern void ParallelFiniteLoop_Loop();
extern void SysBlackBox_Init();
extern void SysBlackBox_Main();
extern void SysHandCursor_Init();
extern void SysHandCursor_Loop();
extern void UiCursorHand_Init();
extern void UiCursorHand_Loop();

struct ProcCmd gProcScr_UiCursorHand[] __attribute__((section(".rodata.dat_gProcScr_UiCursorHand_ref"))) = {
    PROC_CALL(UiCursorHand_Init),
    PROC_LABEL(0x0),
    PROC_REPEAT(UiCursorHand_Loop),
    PROC_LABEL(0x1),
    PROC_BLOCK,
    PROC_END,
};

__asm__(".global data_08A9DAB4\n.set data_08A9DAB4, gProcScr_UiCursorHand");

/* Lead [0x08A9DAE4,0x08A9DB1C) (56 B): UiSpinningArrows script + data. */
__asm__(
"	.section .data.residue.08A9DAE4, \"aw\", %progbits\n"
"\t.global data_08A9DAE4\n"
"data_08A9DAE4:\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000008\n"
"\t.4byte 0x00010006\n"
"\t.4byte 0x00004000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte UiSpinningArrows_Init + 0x1\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte UiSpinningArrows_Loop + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);

struct ProcCmd ProcScr_ParallelFiniteLoop[] __attribute__((section(".rodata.dat_ProcScr_ParallelFiniteLoop_ref"))) = {
    PROC_YIELD,
    PROC_CALL(sub_80B1890),
    PROC_REPEAT(ParallelFiniteLoop_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_SysBlackBox[] __attribute__((section(".rodata.dat_ProcScr_SysBlackBox_ref"))) = {
    PROC_CALL(SysBlackBox_Init),
    PROC_LABEL(0),
    PROC_REPEAT(SysBlackBox_Main),
    PROC_LABEL(1),
    PROC_BLOCK,
    PROC_END,
};

/* Gap [0x08A9DB6C,0x08A9DB84) (24 B): un-named ParallelWorker script. */
__asm__(
"\t.section .data.residue.08A9DB6C, \"aw\", %progbits\n"
"\t.global data_08A9DB6C\n"
"data_08A9DB6C:\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte ParallelWorker_OnLoop + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);

struct ProcCmd ProcScr_SysHandCtrl[] __attribute__((section(".rodata.dat_ProcScr_SysHandCtrl_ref"))) = {
    PROC_CALL(SysHandCursor_Init),
    PROC_LABEL(0),
    PROC_BLOCK,
    PROC_LABEL(1),
    PROC_REPEAT(SysHandCursor_Loop),
    PROC_END,
};

/* Byte-neutral external alias: data_08A9DB84 == ProcScr_SysHandCtrl (0x08A9DB84),
 * Proc_Find'd by sub_80B2034.c. */
__asm__(
"\t.global data_08A9DB84\n"
"\t.set data_08A9DB84, ProcScr_SysHandCtrl\n"
);

/* Trail [0x08A9DBB4,0x08A9DBCC) (24 B): un-named SysGrayBox script. */
__asm__(
"\t.section .data.residue.08A9DBB4, \"aw\", %progbits\n"
"\t.global data_08A9DBB4\n"
"data_08A9DBB4:\n"
"\t.4byte 0x00000002\n"
"\t.4byte SysGrayBox_Init + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte SysGrayBox_Loop + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
