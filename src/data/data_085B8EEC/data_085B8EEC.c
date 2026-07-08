#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness: data_085B8EEC.
 *
 * 2 opaque proc script(s) decoded from the .data.residue.085B8EEC
 * blob into typed struct ProcCmd NAME[] at their exact JP addresses:
 *   - gProcScr_E_FACE (7 ProcCmd) @0x085B8EEC
 *   - gProcScr_E_FACE_ExtraFrame (7 ProcCmd) @0x085B8F24
 * Residue regions stay byte-identical (relocated pointers copied verbatim).
 * Redundant jp_syms .set aliases dropped. FUNC targets bare (ld ORs the
 * Thumb bit); gap_/OBJECT targets carry an explicit +1. The ONLY correctness
 * oracle is `make compare` (sha1).
 */

extern void Face_OnIdle();
extern void Face_OnInit();
extern u8 frontier_df4_misc_lo_000a_0DC3DC[];
extern struct ProcCmd ProcScr_CamMove[];

struct ProcCmd gProcScr_E_FACE[] __attribute__((section(".rodata.dat_gProcScr_E_FACE_ref"))) = {
    PROC_NAME((void *)((u8 *)frontier_df4_misc_lo_000a_0DC3DC + 0x18)),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_YIELD,
    PROC_CALL(Face_OnInit),
    PROC_CALL(Face_OnIdle),
    PROC_REPEAT(Face_OnIdle),
    PROC_END,
};

struct ProcCmd gProcScr_E_FACE_ExtraFrame[] __attribute__((section(".rodata.dat_gProcScr_E_FACE_ExtraFrame_ref"))) = {
    PROC_NAME((void *)((u8 *)frontier_df4_misc_lo_000a_0DC3DC + 0x18)),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_SLEEP(1),
    PROC_CALL(Face_OnInit),
    PROC_CALL(Face_OnIdle),
    PROC_REPEAT(Face_OnIdle),
    PROC_END,
};

/* residue [085B8F5C,085B8F70) (20 B): byte-identical. */
u32 data_085B8F5C[] __attribute__((section(".data.residue.085B8F5C"))) = {
    0x01000404,
    0x05040302,
    0x09080706,
    0x0D0C0B0A,
    0x00000F0E,
};
