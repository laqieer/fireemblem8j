#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness: data_085D1F2C.
 *
 * 1 opaque proc script(s) decoded from the .data.residue.085D1F2C
 * blob into typed struct ProcCmd NAME[] at their exact JP addresses:
 *   - gProcScr_CpPerform (16 ProcCmd) @0x085D1F2C
 * Residue regions stay byte-identical (relocated pointers copied verbatim).
 * Redundant jp_syms .set aliases dropped. FUNC targets bare (ld ORs the
 * Thumb bit); gap_/OBJECT targets carry an explicit +1. The ONLY correctness
 * oracle is `make compare` (sha1).
 */

extern void CpPerform_BeginUnitMovement();
extern void CpPerform_Cleanup();
extern void CpPerform_EquipBest();
extern void CpPerform_MoveCameraOntoTarget();
extern void CpPerform_MoveCameraOntoUnit();
extern void CpPerform_PerformAction();
extern void CpPerform_UpdateMapMusic();
extern void CpPerform_WaitAction();
extern void HandlePostActionTraps();
extern void MuExistsActive();
extern void RunPotentialWaitEvents();
extern u8 data_080DCDAC[];

struct ProcCmd gProcScr_CpPerform[] __attribute__((section(".rodata.dat_gProcScr_CpPerform_ref"))) = {
    PROC_NAME((void *)((u8 *)data_080DCDAC + 0xC)),
    PROC_CALL(CpPerform_UpdateMapMusic),
    PROC_CALL(CpPerform_MoveCameraOntoUnit),
    PROC_YIELD,
    PROC_CALL(CpPerform_BeginUnitMovement),
    PROC_WHILE(MuExistsActive),
    PROC_CALL(CpPerform_MoveCameraOntoTarget),
    PROC_YIELD,
    PROC_CALL(CpPerform_PerformAction),
    PROC_REPEAT(CpPerform_WaitAction),
    PROC_CALL_2(HandlePostActionTraps),
    PROC_CALL_2(RunPotentialWaitEvents),
    PROC_CALL(CpPerform_Cleanup),
    PROC_CALL(CpPerform_EquipBest),
    PROC_LABEL(1),
    PROC_END,
};

/* residue [085D1FAC,085D2034) (136 B): byte-identical. */
u32 data_085D1FAC[] __attribute__((section(".data.residue.085D1FAC"))) = {
    0x0000000A,
    0x0000005C,
    0x00000004,
    0x000006E2,
    0x00000000,
    0x00000000,
    0xFFFD0000,
    0xFFFEFFFF,
    0xFFFE0000,
    0xFFFE0001,
    0xFFFFFFFE,
    0xFFFFFFFF,
    0xFFFF0000,
    0xFFFF0001,
    0xFFFF0002,
    0x0000FFFD,
    0x0000FFFE,
    0x0000FFFF,
    0x00000001,
    0x00000002,
    0x00000003,
    0x0001FFFE,
    0x0001FFFF,
    0x00010000,
    0x00010001,
    0x00010002,
    0x0002FFFF,
    0x00020000,
    0x00020001,
    0x00030000,
    0x270F270F,
    0x00372403,
    0x21372403,
    0x00000000,
};
